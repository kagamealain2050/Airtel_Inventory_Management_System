package com.airtel.inventory.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.airtel.inventory.entity.Asset;
import com.airtel.inventory.repository.AssetRepository;

@Service
public class AssetServiceImpl implements AssetService {

    @Autowired
    private AssetRepository repository;

    @Override
    public Asset save(Asset asset) {
        return repository.save(asset);
    }

    @Override
    public List<Asset> getAll() {
        return repository.findAll();
    }

    @Override
    public Asset getById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Asset not found"));
    }

    @Override
    public Asset update(Long id, Asset asset) {
        Asset existing = getById(id);

        existing.setAssetCode(asset.getAssetCode());
        existing.setType(asset.getType());
        existing.setBrand(asset.getBrand());
        existing.setModel(asset.getModel());
        existing.setSerialNumber(asset.getSerialNumber());
        existing.setSpecifications(asset.getSpecifications());
        existing.setPurchaseDate(asset.getPurchaseDate());
        existing.setStatus(asset.getStatus());

        return repository.save(existing);
    }

    @Override
    public void delete(Long id) {
        repository.deleteById(id);
    }
}