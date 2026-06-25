package com.example.javawebcuoiky.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.javawebcuoiky.model.Brand;
import com.example.javawebcuoiky.model.Product;
import com.example.javawebcuoiky.repository.BrandRepository;
import com.example.javawebcuoiky.repository.ProductRepository;

@Service
public class BrandService {
    private final BrandRepository brandRepository;
    private final ProductRepository productRepository;

    public BrandService(BrandRepository brandRepository, ProductRepository productRepository) {
        this.brandRepository = brandRepository;
        this.productRepository = productRepository;
    }

    public List<Brand> getAllBrands() {
        return brandRepository.findAllActive();
    }

    public Brand saveBrand(Brand brand){
        return brandRepository.save(brand);
    }

    public Brand getBrandById(int id){
        Brand b = brandRepository.findById(id).orElse(null);
        return (b != null && !b.isDeleted()) ? b : null;
    }

    //  xóa mềm các sản phẩm thuộc brand đó
    public boolean deleteBrand(int id){
        Brand b = brandRepository.findById(id).orElse(null);
        if (b == null) return false;

        b.setDeleted(true);
        brandRepository.save(b);

        List<Product> products = productRepository.findByBrandIdRaw(id);
        for (Product p : products) {
            if (!p.isDeleted()) {
                p.setDeleted(true);
                productRepository.save(p);
            }
        }

        return true;
    }
}