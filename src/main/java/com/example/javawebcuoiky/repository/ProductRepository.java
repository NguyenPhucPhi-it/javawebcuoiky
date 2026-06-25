package com.example.javawebcuoiky.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.javawebcuoiky.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

    //  Danh sách sản phẩm còn hoạt động
    @Query("SELECT p FROM Product p WHERE p.deleted = false ORDER BY p.id DESC")
    List<Product> findAllActive();

    @Query("SELECT p FROM Product p WHERE p.deleted = false")
    Page<Product> findAllActive(Pageable pageable);

    // san pham moi
    @Query("SELECT p FROM Product p WHERE p.deleted = false ORDER BY p.id DESC")
    List<Product> findNewProducts(Pageable pageable);

    // san pham khuyen mai
    @Query("SELECT p FROM Product p WHERE p.deleted = false AND p.discount > 0")
    List<Product> findSaleProducts(Pageable pageable);

    @Query(value = """
    SELECT p.* FROM product p
    JOIN order_detail od ON od.id_product = p.id
    JOIN orders o ON o.id = od.id_order
    WHERE o.status NOT IN ('Đã hủy')
      AND p.deleted = false
    GROUP BY p.id
    ORDER BY SUM(od.quantity) DESC
    """, nativeQuery = true)
    List<Product> findHotProducts(Pageable pageable);

    @Query("SELECT p FROM Product p WHERE p.deleted = false AND p.id_brand = :brandId")
    Page<Product> findByBrandId(@Param("brandId") int brandId, Pageable pageable);

    @Query("SELECT p FROM Product p WHERE p.deleted = false AND p.price BETWEEN :min AND :max")
    Page<Product> findByPriceBetween(@Param("min") double min, @Param("max") double max, Pageable pageable);

    @Query("SELECT p FROM Product p WHERE p.deleted = false AND p.id_brand = :brandId AND p.price BETWEEN :min AND :max")
    Page<Product> findByBrandIdAndPriceBetween(@Param("brandId") int brandId,
                                               @Param("min") double min,
                                               @Param("max") double max,
                                               Pageable pageable);

    //  Tìm kiếm theo tên (keyword) 

    @Query("SELECT p FROM Product p WHERE p.deleted = false AND LOWER(p.name) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    Page<Product> searchByKeyword(@Param("keyword") String keyword, Pageable pageable);

    @Query("SELECT p FROM Product p WHERE p.deleted = false AND LOWER(p.name) LIKE LOWER(CONCAT('%', :keyword, '%')) AND p.id_brand = :brandId")
    Page<Product> searchByKeywordAndBrand(@Param("keyword") String keyword,
                                           @Param("brandId") int brandId,
                                           Pageable pageable);

    @Query("SELECT p FROM Product p WHERE p.deleted = false AND LOWER(p.name) LIKE LOWER(CONCAT('%', :keyword, '%')) AND p.price BETWEEN :min AND :max")
    Page<Product> searchByKeywordAndPrice(@Param("keyword") String keyword,
                                           @Param("min") double min,
                                           @Param("max") double max,
                                           Pageable pageable);

    @Query("SELECT p FROM Product p WHERE p.deleted = false AND LOWER(p.name) LIKE LOWER(CONCAT('%', :keyword, '%')) AND p.id_brand = :brandId AND p.price BETWEEN :min AND :max")
    Page<Product> searchByKeywordAndBrandAndPrice(@Param("keyword") String keyword,
                                                   @Param("brandId") int brandId,
                                                   @Param("min") double min,
                                                   @Param("max") double max,
                                                   Pageable pageable);
    @Query("SELECT p FROM Product p WHERE p.id_brand = :brandId")
    List<Product> findByBrandIdRaw(@Param("brandId") int brandId);
}