package model.entity;

public class Product {
    private int productId;
    private String productName;
    private String description;
    private boolean productStatus;
    private int stock;

    public Product() {
    }

    public Product(int productId, String productName, String description, boolean productStatus, int stock) {
        this.productId = productId;
        this.productName = productName;
        this.description = description;
        this.productStatus = productStatus;
        this.stock = stock;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isProductStatus() {
        return productStatus;
    }

    public void setProductStatus(boolean productStatus) {
        this.productStatus = productStatus;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
}
