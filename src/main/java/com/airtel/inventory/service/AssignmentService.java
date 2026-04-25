package com.airtel.inventory.service;

import com.airtel.inventory.entity.Assignment;

import java.util.List;

public interface AssignmentService {

    Assignment assignAsset(Long assetId, Long userId);

    Assignment returnAsset(Long assetId);

    List<Assignment> getAllAssignments();

    List<Assignment> getActiveAssignments();
}