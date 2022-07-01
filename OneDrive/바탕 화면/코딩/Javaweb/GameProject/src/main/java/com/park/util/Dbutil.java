package com.park.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbutil {
	private static Connection connection = null;

    public static Connection getConnection() {
        if (connection != null)
            return connection;
        else {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection
                		("jdbc:mysql://localhost:3306/gameproject","root","as!172721324");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            } 
            return connection;
        }

    }
}
