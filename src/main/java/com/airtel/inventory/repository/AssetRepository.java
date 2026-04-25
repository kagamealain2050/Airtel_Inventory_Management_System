package com.airtel.inventory.repository;

import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import com.airtel.inventory.entity.Asset;

public interface AssetRepository extends JpaRepository<Asset, Long> {

    // ✅ MUST match entity field name exactly
    Optional<Asset> findByAssetCode(String assetCode);
    List<Asset> findByStatus(String status);

    List<Asset> findByType(String type);
}


