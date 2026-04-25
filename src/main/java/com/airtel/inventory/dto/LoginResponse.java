package com.airtel.inventory.dto;

public class LoginResponse {

    private Long userId;
    private String fullName;
    private String email;

    public LoginResponse(Long userId, String fullName, String email) {
        this.userId = userId;
        this.fullName = fullName;
        this.email = email;
    }

    public Long getUserId() { return userId; }
    public String getFullName() { return fullName; }
    public String getEmail() { return email; }
}
