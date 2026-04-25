package com.airtel.inventory.entity;

import java.time.LocalDate;
import javax.persistence.*;

@Entity
@Table(name = "assets")
public class Asset {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "asset_id")
    private Long assetId;

    @Column(name = "asset_code", unique = true, nullable = false)
    private String assetCode;

    private String type;
    private String brand;
    private String model;

    @Column(name = "serial_number", unique = true)
    private String serialNumber;

    @Column(columnDefinition = "TEXT")
    private String specifications;

    @Column(name = "purchase_date")
    private LocalDate purchaseDate;

    private String status = "AVAILABLE";

    public Asset() {}

    public Asset(String assetCode, String type, String brand, String model,
                 String serialNumber, String specifications, LocalDate purchaseDate) {
        this.assetCode = assetCode;
        this.type = type;
        this.brand = brand;
        this.model = model;
        this.serialNumber = serialNumber;
        this.specifications = specifications;
        this.purchaseDate = purchaseDate;
        this.status = "AVAILABLE";
    }

    // Getters & Setters
    public Long getAssetId() { return assetId; }

    public String getAssetCode() { return assetCode; }
    public void setAssetCode(String assetCode) { this.assetCode = assetCode; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }

    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }

    public String getSerialNumber() { return serialNumber; }
    public void setSerialNumber(String serialNumber) { this.serialNumber = serialNumber; }

    public String getSpecifications() { return specifications; }
    public void setSpecifications(String specifications) { this.specifications = specifications; }

    public LocalDate getPurchaseDate() { return purchaseDate; }
    public void setPurchaseDate(LocalDate purchaseDate) { this.purchaseDate = purchaseDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}