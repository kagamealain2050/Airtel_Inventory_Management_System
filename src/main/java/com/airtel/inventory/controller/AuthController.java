package com.airtel.inventory.controller;

import com.airtel.inventory.dto.LoginRequest;
import com.airtel.inventory.dto.LoginResponse;
import com.airtel.inventory.entity.User;
import com.airtel.inventory.repository.UserRepository;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin("*")
public class AuthController {

    private final UserRepository userRepo;

    public AuthController(UserRepository userRepo) {
        this.userRepo = userRepo;
    }

    @PostMapping("/login")
    public LoginResponse login(@RequestBody LoginRequest request) {

        User user = userRepo.findByEmail(request.getEmail())
                .orElseThrow(() -> new RuntimeException("User not found"));

        // ✅ simple password check
        if (!user.getPassword().equals(request.getPassword())) {
            throw new RuntimeException("Invalid password");
        }

        return new LoginResponse(
                user.getUserId(),
                user.getFullName(),
                user.getEmail()
        );
    }
}