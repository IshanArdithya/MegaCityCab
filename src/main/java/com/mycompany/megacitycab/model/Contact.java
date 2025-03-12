package com.mycompany.megacitycab.model;

import java.sql.Timestamp;

public class Contact {

    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String mobileNumber;
    private String subject;
    private String message;
    private Timestamp submissionDate;

    public Contact(int id, String firstName, String lastName, String email, String mobileNumber, String subject, String message, Timestamp submission_date) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.mobileNumber = mobileNumber;
        this.subject = subject;
        this.message = message;
        this.submissionDate = submission_date;
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

    public String getMobileNumber() {
        return mobileNumber;
    }

    public String getSubject() {
        return subject;
    }

    public String getMessage() {
        return message;
    }

    public Timestamp getCreatedAt() {
        return submissionDate;
    }
}
