package com.example.javawebcuoiky.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.javawebcuoiky.model.Brand;
import com.example.javawebcuoiky.repository.BrandRepository;

@Service
public class BrandService {
    private final BrandRepository brandRepository;

    public BrandService(BrandRepository brandRepository) {
        this.brandRepository = brandRepository;
    }

    public List<Brand> getAllBrands() {
        return brandRepository.findAll();
    }
     public Brand saveBrand(Brand brand){
        Brand b = this.brandRepository.save(brand);
        return b;
    }
    public Brand getBrandById(int id){
        return brandRepository.findById(id).orElse(null);
    }
     public void deleteBrand(int id){
        brandRepository.deleteById(id);
    }
}