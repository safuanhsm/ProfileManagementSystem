package database;

import java.sql.*;

public class DBConnection {

    public static Connection getConnection(){

        Connection con = null;

        try{    

            Class.forName("com.mysql.cj.jdbc.Driver");

con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/student_profiles?useSSL=false&allowPublicKeyRetrieval=true",
    "root",
    "root"
);

        }catch(Exception e){
            System.out.println(e);
        }

        return con;
    }
}