package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDB {
    private static final String URL = "jdbc:mysql://localhost:3306/session08";
    private static final String USER = "root";
    private static final String PASSWORD = "123456a@";

    //tao phuong thuc mo ket noi
    public static Connection openConnection() {
        Connection connection = null;
        try {
            //dang ky driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            //gan ket noi
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }

        return connection;
    }

    //tao phuong thuc dong ket noi
    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

}
