package edu.bellevue.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Creates and returns a connection to the CSD430 MySQL database.
 *
 * @author Noor El-din Al salihi
 * @version 1.0
 */
public class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/CSD430";

    private static final String USER = "student1";
    private static final String PASSWORD = "pass";

    /**
     * Prevents the DBConnection class from being instantiated.
     */
    private DBConnection() {
    }

    /**
     * Creates a connection to the CSD430 database.
     *
     * @return an active database connection
     * @throws SQLException if the database connection fails
     */
    public static Connection getConnection() throws SQLException {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException(
                    "The MySQL JDBC driver could not be found.", e
            );
        }

        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}