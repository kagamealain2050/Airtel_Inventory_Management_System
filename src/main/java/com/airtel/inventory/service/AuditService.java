package com.airtel.inventory.service;

public interface AuditService {
    void log(String action, String entity, Long entityId, String performedBy, String description);
}