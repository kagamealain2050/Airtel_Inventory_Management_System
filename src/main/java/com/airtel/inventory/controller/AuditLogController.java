package com.airtel.inventory.controller;

import com.airtel.inventory.entity.AuditLog;
import com.airtel.inventory.repository.AuditLogRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/audit")
@CrossOrigin("*")
public class AuditLogController {

    private final AuditLogRepository repo;

    public AuditLogController(AuditLogRepository repo) {
        this.repo = repo;
    }

    @GetMapping
    public List<AuditLog> getAll() {
        return repo.findAll();
    }
}