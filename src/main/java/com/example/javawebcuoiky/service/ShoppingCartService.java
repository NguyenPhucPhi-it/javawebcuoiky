package com.example.javawebcuoiky.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.javawebcuoiky.model.Product;
import com.example.javawebcuoiky.model.ShoppingCart;
import com.example.javawebcuoiky.model.ShoppingCartItem;
import com.example.javawebcuoiky.model.User;
import com.example.javawebcuoiky.repository.ProductRepository;
import com.example.javawebcuoiky.repository.ShoppingCartRepository;

@Service
public class ShoppingCartService {

    private final ShoppingCartRepository cartRepo;
    private final ProductRepository productRepo;

    public ShoppingCartService(ShoppingCartRepository cartRepo,
                               ProductRepository productRepo) {
        this.cartRepo = cartRepo;
        this.productRepo = productRepo;
    }

   // ───── Thêm vào giỏ ─────
public void addToCart(User loggedUser, String sessionId, int productId, int quantity) {
    Product product = productRepo.findById(productId)
            .orElseThrow(() -> new RuntimeException("Không tìm thấy sản phẩm"));

    //  Kiểm tra hết hàng
    if (product.getQuantity() <= 0) {
        throw new RuntimeException("Sản phẩm đã hết hàng");
    }

    if (loggedUser != null) {
        Optional<ShoppingCart> existing =
                cartRepo.findByIdUserAndIdProduct(loggedUser.getId(), productId);

       if (existing.isPresent()) {
    ShoppingCart cart = existing.get();
    int newQty = cart.getQuantity() + quantity;
    if (newQty > product.getQuantity()) {
        throw new RuntimeException("Số lượng trong giỏ vượt quá tồn kho (" 
            + product.getQuantity() + " sản phẩm)");
    }
    cart.setQuantity(newQty);
    cart.setPrice(getFinalPrice(product)); 
    cartRepo.save(cart);
} else {
            if (quantity > product.getQuantity()) {
                throw new RuntimeException("Số lượng vượt quá tồn kho (" 
                    + product.getQuantity() + " sản phẩm)");
            }
            ShoppingCart cart = new ShoppingCart();
            cart.setIdUser(loggedUser.getId());
            cart.setIdProduct(productId);
            cart.setPrice(getFinalPrice(product));
            cart.setQuantity(quantity);
            cartRepo.save(cart);
        }
    } else {
        Optional<ShoppingCart> existing =
                cartRepo.findBySessionIdAndIdProduct(sessionId, productId);

        if (existing.isPresent()) {
            ShoppingCart cart = existing.get();
            int newQty = cart.getQuantity() + quantity;
            if (newQty > product.getQuantity()) {
                throw new RuntimeException("Số lượng trong giỏ vượt quá tồn kho (" 
                    + product.getQuantity() + " sản phẩm)");
            }
            cart.setQuantity(newQty);
            cartRepo.save(cart);
        } else {
            if (quantity > product.getQuantity()) {
                throw new RuntimeException("Số lượng vượt quá tồn kho (" 
                    + product.getQuantity() + " sản phẩm)");
            }
            ShoppingCart cart = new ShoppingCart();
            cart.setSessionId(sessionId);
            cart.setIdProduct(productId);
            cart.setPrice(getFinalPrice(product));
            cart.setQuantity(quantity);
            cart.setIdUser(0);
            cartRepo.save(cart);
        }
    }
}

    // ───── Lấy danh sách giỏ ─────
    public List<ShoppingCart> getCartItems(User loggedUser, String sessionId) {
        if (loggedUser != null) {
            return cartRepo.findByIdUser(loggedUser.getId());
        }
        return cartRepo.findBySessionId(sessionId);
    }

    // ───── Xóa item ─────
    public void removeFromCart(int cartId) {
        cartRepo.deleteById(cartId);
    }
    public List<ShoppingCartItem> getCartItemsWithProduct(User loggedUser, String sessionId) {
    List<ShoppingCart> carts;
    if (loggedUser != null) {
        carts = cartRepo.findByIdUser(loggedUser.getId());
    } else {
        carts = cartRepo.findBySessionId(sessionId);
    }

    List<ShoppingCartItem> result = new java.util.ArrayList<>();
    for (ShoppingCart cart : carts) {
        productRepo.findById(cart.getIdProduct()).ifPresent(product -> {
            result.add(new ShoppingCartItem(cart, product));
        });
    }
    return result;
}

    // ───── Merge session → DB khi đăng nhập ─────
    // Gọi hàm này trong AuthController sau khi login thành công
    public void mergeSessionCart(String sessionId, User loggedUser) {
        List<ShoppingCart> sessionItems = cartRepo.findBySessionId(sessionId);
        for (ShoppingCart item : sessionItems) {
            Optional<ShoppingCart> existing =
                    cartRepo.findByIdUserAndIdProduct(loggedUser.getId(), item.getIdProduct());

            if (existing.isPresent()) {
                // Cộng dồn số lượng rồi xóa bản ghi session
                ShoppingCart dbCart = existing.get();
                dbCart.setQuantity(dbCart.getQuantity() + item.getQuantity());
                cartRepo.save(dbCart);
                cartRepo.delete(item);
            } else {
                // Chuyển ownership từ session → user
                item.setIdUser(loggedUser.getId());
                item.setSessionId(null);
                cartRepo.save(item);
            }
        }
    }
   
public int countCartItems(User loggedUser, String sessionId) {
    List<ShoppingCartItem> items = getCartItemsWithProduct(loggedUser, sessionId);
    return items.stream().mapToInt(i -> i.getCart().getQuantity()).sum();
}

public void updateQuantity(int cartId, int quantity) {
    final int finalQuantity = (quantity < 1) ? 1 : quantity;
    cartRepo.findById(cartId).ifPresent(c -> {
        c.setQuantity(finalQuantity);
        cartRepo.save(c);
    });
}
public ShoppingCart addToCartExact(User loggedUser, String sessionId, int productId, int quantity) {
    Product product = productRepo.findById(productId)
            .orElseThrow(() -> new RuntimeException("Không tìm thấy sản phẩm"));

    if (product.getQuantity() <= 0) {
        throw new RuntimeException("Sản phẩm đã hết hàng");
    }
    if (quantity < 1) quantity = 1;
    //  Giới hạn theo tồn kho
    if (quantity > product.getQuantity()) {
        quantity = product.getQuantity();
    }

    ShoppingCart cart = new ShoppingCart();
    if (loggedUser != null) {
        cart.setIdUser(loggedUser.getId());
    } else {
        cart.setSessionId(sessionId);
        cart.setIdUser(0);
    }
    cart.setIdProduct(productId);
    cart.setPrice(getFinalPrice(product));
    cart.setQuantity(quantity);
    return cartRepo.save(cart);
}
private double getFinalPrice(Product product) {
    if (product.getDiscount() != null && product.getDiscount() > 0 && product.getDiscount() <= 100) {
        return product.getPrice() * (100 - product.getDiscount()) / 100.0;
    }
    return product.getPrice();
}
}