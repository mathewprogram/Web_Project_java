package examen_MF0226;

import java.sql.*;

public class ConexionMySQL_agencia_de_viajes {

    public static Connection obtenerConexion() {
        String url = "jdbc:mysql://localhost:3306/agencia_de_viajes";
        String usuario = "root";
        String clave = "Passw0rd!";
        Connection conexion = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection(url,usuario,clave);
        }catch(SQLException | ClassNotFoundException e){
            conexion = null;
        }
        return conexion;
    }
}