package servlet2;

import java.sql.*;

public class ConnectionMySQLBDInstituto {
    
    public static void main(String[] args){
        obtainConnection();
    }

    public static Connection obtainConnection(){
        String url = "jdbc:mysql://localhost:3306/Instituto";
        String user = "root";
        String key = "Passw0rd!";
        Connection connection = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, key);
        }catch(SQLException | ClassNotFoundException e){
            connection = null;
        }
        return connection;
    }
    
}


