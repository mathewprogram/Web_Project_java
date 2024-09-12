package servlet2;

import java.sql.*;

public class ConnectionMySQLBDTRANSACCIONES {
    
    public static void main(String[] args){
        obtainConnection();
    }

    public static Connection obtainConnection(){
        String url = "jdbc:mysql://localhost:3306/BDTRANSACCIONES";
        String user = "root";
        String key = "12345678";
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


