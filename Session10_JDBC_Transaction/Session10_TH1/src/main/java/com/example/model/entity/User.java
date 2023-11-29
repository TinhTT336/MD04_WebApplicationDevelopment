package com.example.model.entity;

public class User {
    protected int userId;
    protected String username;
    protected String email;
    protected String country;

    public User() {
    }

    public User(int userId, String username, String email, String country) {
        this.userId = userId;
        this.username = username;
        this.email = email;
        this.country = country;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
