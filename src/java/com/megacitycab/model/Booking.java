package com.megacitycab.model;

public class Booking {
    private int bookingId;
    private int customerId;
    private String destination;
    private double fare;

    // Constructor
    public Booking(int bookingId, int customerId, String destination, double fare) {
        this.bookingId = bookingId;
        this.customerId = customerId;
        this.destination = destination;
        this.fare = fare;
    }

    // Getters and Setters
    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public double getFare() {
        return fare;
    }

    public void setFare(double fare) {
        this.fare = fare;
    }

    @Override
    public String toString() {
        return "Booking [bookingId=" + bookingId + ", customerId=" + customerId + ", destination=" + destination
                + ", fare=" + fare + "]";
    }
}
