package com.airtel.inventory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.airtel.inventory.entity.Asset;
import com.airtel.inventory.service.AssetService;

@RestController
@RequestMapping("/api/assets")
@CrossOrigin(origins = "*") // important for frontend
public class AssetController {

    @Autowired
    private AssetService service;

    // CREATE
    @PostMapping
    public Asset create(@RequestBody Asset asset) {
        return service.save(asset);
    }

    // READ ALL
    @GetMapping
    public List<Asset> getAll() {
        return service.getAll();
    }

    // READ ONE
    @GetMapping("/{id}")
    public Asset getById(@PathVariable Long id) {
        return service.getById(id);
    }

    // UPDATE
    @PutMapping("/{id}")
    public Asset update(@PathVariable Long id, @RequestBody Asset asset) {
        return service.update(id, asset);
    }

    // DELETE
    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        service.delete(id);
    }
}