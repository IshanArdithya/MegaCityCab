package com.mycompany.megacitycab.model;

import java.sql.Timestamp;

public class Driver {
    private int id;
    private String firstName;
    private String lastName;
    private String gender;
    private String email;
    private String homeAddress;
    private String nic;
    private String contactNumber;
    private String vehicleName;
    private String passengerCount;
    private String vehicleNumber;
    private Timestamp createdAt;

    public Driver(int id, String firstName, String lastName, String gender, String email, String homeAddress, String nic, String contactNumber, String vehicleName, String passengerCount, String vehicleNumber, Timestamp createdAt) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.email = email;
        this.homeAddress = homeAddress;
        this.nic = nic;
        this.contactNumber = contactNumber;
        this.vehicleName = vehicleName;
        this.passengerCount = passengerCount;
        this.vehicleNumber = vehicleNumber;
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

    public String getGender() {
        return gender;
    }
    
    public String getEmail() {
        return email;
    }

    public String getHomeAddress() {
        return homeAddress;
    }
    
    public String getNIC() {
        return nic;
    }
    
    public String getContactNumber() {
        return contactNumber;
    }
    
    public String getVehicleName() {
        return vehicleName;
    }
    
    public String getPassengerCount() {
        return passengerCount;
    }
    
    public String getVehicleNumber() {
        return vehicleNumber;
    }
    
    public Timestamp getCreatedAt() {
        return createdAt;
    }
}
