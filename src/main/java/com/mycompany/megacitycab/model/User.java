package com.mycompany.megacitycab.model;

import java.sql.Timestamp;

public class User {

    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private Timestamp createdAt;

    public User(int id, String firstName, String lastName, String email, Timestamp createdAt) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
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

    public Timestamp getCreatedAt() {
        return createdAt;
    }
}
