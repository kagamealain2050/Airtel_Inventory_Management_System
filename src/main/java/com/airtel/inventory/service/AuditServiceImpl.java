package com.airtel.inventory.service;

import com.airtel.inventory.entity.AuditLog;
import com.airtel.inventory.repository.AuditLogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuditServiceImpl implements AuditService {

    @Autowired
    private AuditLogRepository auditRepo;

    @Override
    public void log(String action, String entity, Long entityId, String performedBy, String description) {

        AuditLog log = new AuditLog();

        log.setAction(action);
        log.setEntity(entity);
        log.setEntityId(entityId);
        log.setPerformedBy(performedBy);
        log.setDescription(description);

        auditRepo.save(log);
    }
}