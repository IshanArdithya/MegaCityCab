package com.mycompany.megacitycab.dao;

import com.mycompany.megacitycab.auth.DatabaseConnection;
import com.mycompany.megacitycab.model.Contact;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ContactDAO {

    public List<Contact> getAllContacts() {
        List<Contact> contacts = new ArrayList<>();
        String query = "SELECT id, first_name, last_name, email, mobile_number, subject, message, submission_date FROM contact";

        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String email = rs.getString("email");
                String mobileNumber = rs.getString("mobile_number");
                String subject = rs.getString("subject");
                String message = rs.getString("message");
                Timestamp submissionDate = rs.getTimestamp("submission_date");

                Contact contact = new Contact(id, firstName, lastName, email, mobileNumber, subject, message, submissionDate);
                contacts.add(contact);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return contacts;
    }
    
    public List<Contact> getRecentContacts() {
        List<Contact> contacts = new ArrayList<>();
        String query = "SELECT id, first_name, last_name, email, mobile_number, subject, message, submission_date FROM contact ORDER BY submission_date DESC LIMIT 10";

        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                Timestamp submissionDate = rs.getTimestamp("submission_date");

                Contact contact = new Contact(id, firstName, lastName, null, null, null, null, submissionDate);
                contacts.add(contact);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return contacts;
    }
}
