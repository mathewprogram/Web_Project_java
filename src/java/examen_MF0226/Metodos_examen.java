package examen_MF0226;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Metodos_examen {
    
    public static List<String> mostrarTuristasYSucursales(Connection connection) {
    List<String> turistasYSucursalesList = new ArrayList<>();
    try {
        // Definir la consulta SQL
        String query = "SELECT Turista.nombre, Turista.apellidos, Sucursal.direccion AS sucursal "
                     + "FROM Turista "
                     + "JOIN Sucursal ON Turista.codigo_sucursal = Sucursal.codigo_sucursal";
        
        // Crear PreparedStatement
        PreparedStatement ps = connection.prepareStatement(query);
        
        // Ejecutar la consulta
        ResultSet rs = ps.executeQuery();
        
        // Procesar los resultados
        int count = 0; // Contador de resultados
        while (rs.next()) {
            String turistaDetalles = rs.getString("nombre") + " " 
                                   + rs.getString("apellidos") + " - " 
                                   + rs.getString("sucursal");
            turistasYSucursalesList.add(turistaDetalles);
            count++;
        }
        
        // Imprimir el número de resultados
        System.out.println("Número de resultados: " + count);
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return turistasYSucursalesList;
}


    
}
