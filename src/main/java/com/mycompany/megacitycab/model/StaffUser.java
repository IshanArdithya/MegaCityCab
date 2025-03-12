package com.mycompany.megacitycab.model;

import java.sql.Timestamp;

public class StaffUser {
    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String role;
    private Timestamp createdAt;

    public StaffUser(int id, String firstName, String lastName, String email, String role, Timestamp createdAt) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.role = role;
        this.createdAt = createdAt;
    }

    public int getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }
    
    public String getRole() {
        return role;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }
}
