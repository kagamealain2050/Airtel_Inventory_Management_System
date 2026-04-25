package com.airtel.inventory.service;

import com.airtel.inventory.entity.*;
import com.airtel.inventory.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class AssignmentServiceImpl implements AssignmentService {

    @Autowired
    private AssignmentRepository assignmentRepo;

    @Autowired
    private AssetRepository assetRepo;

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private TransactionRepository transactionRepo;

    @Autowired
    private AuditService auditService;

    @Override
    public Assignment assignAsset(Long assetId, Long userId) {

        Asset asset = assetRepo.findById(assetId)
                .orElseThrow(() -> new RuntimeException("Asset not found"));

        User user = userRepo.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        // Prevent double assignment
        assignmentRepo.findByAssetAndStatus(asset, "ACTIVE")
                .ifPresent(a -> {
                    throw new RuntimeException("Asset already assigned!");
                });

        Assignment assignment = new Assignment();
        assignment.setAsset(asset);
        assignment.setUser(user);
        assignment.setAssignedDate(LocalDateTime.now());
        assignment.setStatus("ACTIVE");

        // Update asset status
        asset.setStatus("ASSIGNED");
        assetRepo.save(asset);

        // Save transaction
        Transaction transaction = new Transaction();
        transaction.setAsset(asset);
        transaction.setUser(user);
        transaction.setAction("ISSUE");
        transaction.setHandledBy("SYSTEM");
        transactionRepo.save(transaction);

        Assignment saved = assignmentRepo.save(assignment);

        // Audit log
        auditService.log(
                "ASSIGN",
                "ASSET",
                asset.getAssetId(),
                user.getFullName(),
                "Asset assigned to user"
        );

        return saved;
    }

    @Override
    public Assignment returnAsset(Long assetId) {

        Asset asset = assetRepo.findById(assetId)
                .orElseThrow(() -> new RuntimeException("Asset not found"));

        Assignment assignment = assignmentRepo
                .findByAssetAndStatus(asset, "ACTIVE")
                .orElseThrow(() -> new RuntimeException("No active assignment found"));

        assignment.setReturnedDate(LocalDateTime.now());
        assignment.setStatus("RETURNED");

        // Update asset
        asset.setStatus("AVAILABLE");
        assetRepo.save(asset);

        // Transaction
        Transaction transaction = new Transaction();
        transaction.setAsset(asset);
        transaction.setUser(assignment.getUser());
        transaction.setAction("RETURN");
        transaction.setHandledBy("SYSTEM");
        transactionRepo.save(transaction);

        Assignment saved = assignmentRepo.save(assignment);

        // Audit
        auditService.log(
                "RETURN",
                "ASSET",
                asset.getAssetId(),
                assignment.getUser().getFullName(),
                "Asset returned"
        );

        return saved;
    }

    @Override
    public List<Assignment> getAllAssignments() {
        return assignmentRepo.findAll();
    }

    @Override
    public List<Assignment> getActiveAssignments() {
        return assignmentRepo.findByStatus("ACTIVE");
    }
}