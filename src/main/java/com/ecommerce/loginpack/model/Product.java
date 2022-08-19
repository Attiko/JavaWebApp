/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ecommerce.loginpack.model;

/**
 *
 * @author oladimeji
 */
public class Product {
    private int productid;
    private String name;
    private Double price;
    private String category;
    private String image;

    public Product() {
    }
    
    

    public Product(int productid, String name, Double price, String category, String image) {
        this.productid = productid;
        this.name = name;
        this.price = price;
        this.category = category;
        this.image = image;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Product{" + "productid=" + productid + ", name=" + name + ", price=" + price + ", category=" + category + ", image=" + image + '}';
    }
    
    
    
}
