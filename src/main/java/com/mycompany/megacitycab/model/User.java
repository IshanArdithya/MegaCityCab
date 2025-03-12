package com.mycompany.megacitycab.model;

import java.sql.Timestamp;

public class User {

    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String contactNumber;
    private String homeAddress;
    private String nic;
    private Timestamp createdAt;

    public User(int id, String firstName, String lastName, String email, String contactNumber, String homeAddress, String nic, Timestamp createdAt) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.contactNumber = contactNumber;
        this.homeAddress = homeAddress;
        this.nic = nic;
        this.createdAt = createdAt;
    }

    // getters
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
    
    public String getContactNumber() {
        return contactNumber;
    }
    
    public String getHomeAddress() {
        return homeAddress;
    }
    
    public String getNIC() {
        return nic;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }
    
    // setters
     public void setId(int id) {
        this.id = id;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public void setHomeAddress(String homeAddress) {
        this.homeAddress = homeAddress;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
