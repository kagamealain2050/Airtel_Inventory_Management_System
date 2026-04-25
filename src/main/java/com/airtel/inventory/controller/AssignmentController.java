package com.airtel.inventory.controller;

import com.airtel.inventory.entity.Assignment;
import com.airtel.inventory.service.AssignmentService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/assignments")
@CrossOrigin("*")
public class AssignmentController {

    private final AssignmentService service;

    public AssignmentController(AssignmentService service) {
        this.service = service;
    }

  
    @GetMapping
    public List<Assignment> getAll() {
        return service.getAllAssignments();
    }

    
    @PostMapping
    public Assignment assign(
            @RequestParam Long assetId,
            @RequestParam Long userId
    ) {
        return service.assignAsset(assetId, userId);
    }

   
    @PutMapping("/return/{assetId}")
    public Assignment returnAsset(@PathVariable Long assetId) {
        return service.returnAsset(assetId);
    }
}