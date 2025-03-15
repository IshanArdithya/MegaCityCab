package com.mycompany.megacitycab.model;

public class Pricing {
    private int id;
    private int passengerCount;
    private double price;

    public Pricing(int id, int passengerCount, double price) {
        this.id = id;
        this.passengerCount = passengerCount;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public int getPassengerCount() {
        return passengerCount;
    }

    public double getPrice() {
        return price;
    }
}