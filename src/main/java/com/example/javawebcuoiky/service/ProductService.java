package com.example.javawebcuoiky.service;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.javawebcuoiky.model.Product;
import com.example.javawebcuoiky.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    public ProductService(ProductRepository productRepository){
        this.productRepository=productRepository;
    }
    // luu 1  sp
    public Product saveProduct(Product product){
        Product p =this.productRepository.save(product);
        return p;
    }
    // lay tat ca sp
    public List<Product> getAllProducts(){
        return productRepository.findAll();
    }
    // xoa theo id
    public void deletProducts(int id){
        productRepository.deleteById(id);
    }
    //phân trang
    public Page<Product> getProductByPage(int page, int size){
        Pageable pageable=PageRequest.of(page,size);
        return productRepository.findAll(pageable);
    }
    // san pham moi 
    public List<Product> getNewProducts(){
        return productRepository.findNewProducts(PageRequest.of(0, 8));
    }
    // san pham khuyen mai
    public List<Product> getSaleProducts(){
         return productRepository.findSaleProducts(PageRequest.of(0, 8));
    }
    public Product getProductById(int id){
        return productRepository.findById(id).orElse(null);
    }
    
// san pham hot (ban chay)
public List<Product> getHotProducts(){
    List<Product> hot = productRepository.findHotProducts(PageRequest.of(0, 8));
    if (hot == null || hot.isEmpty()) {
        // fallback: chưa có đơn hàng -> lấy sản phẩm mới nhất thay thế
        hot = productRepository.findNewProducts(PageRequest.of(0, 8));
    }
    return hot;
}

   public Page<Product> getProductByPage(int page, int size, Integer brandId, Double minPrice, Double maxPrice, String keyword) {
    Pageable pageable = PageRequest.of(page, size);
    boolean hasKeyword = keyword != null && !keyword.trim().isEmpty();

    if (hasKeyword) {
        String kw = keyword.trim();
        if (brandId != null && minPrice != null && maxPrice != null) {
            return productRepository.searchByKeywordAndBrandAndPrice(kw, brandId, minPrice, maxPrice, pageable);
        } else if (brandId != null) {
            return productRepository.searchByKeywordAndBrand(kw, brandId, pageable);
        } else if (minPrice != null && maxPrice != null) {
            return productRepository.searchByKeywordAndPrice(kw, minPrice, maxPrice, pageable);
        }
        return productRepository.searchByKeyword(kw, pageable);
    }

    if (brandId != null && minPrice != null && maxPrice != null) {
        return productRepository.findByBrandIdAndPriceBetween(brandId, minPrice, maxPrice, pageable);
    } else if (brandId != null) {
        return productRepository.findByBrandId(brandId, pageable);
    } else if (minPrice != null && maxPrice != null) {
        return productRepository.findByPriceBetween(minPrice, maxPrice, pageable);
    }
    return productRepository.findAll(pageable);
}
    
}