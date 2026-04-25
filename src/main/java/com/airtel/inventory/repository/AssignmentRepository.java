package com.airtel.inventory.repository;

import com.airtel.inventory.entity.Assignment;
import com.airtel.inventory.entity.Asset;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface AssignmentRepository extends JpaRepository<Assignment, Long> {

    Optional<Assignment> findByAssetAndStatus(Asset asset, String status);

    List<Assignment> findByStatus(String status);
}