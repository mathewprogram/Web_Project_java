package server_PostgreSQL;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OperationsCrud {

    public static boolean insertarProducto(Connection connection,
            String nombre,
            String marca,
            String modelo,
            double precio,
            String pantalla,
            String resolucion) {
        boolean bandera = true;
        try {
            String json = "{\"nombre\":\"" + nombre + "\", "
                    + "\"marca\":\"" + marca + "\", "
                    + "\"modelo\":\"" + modelo + "\", "
                    + "\"precio\":" + precio + ", "
                    + "\"pantalla\":\"" + pantalla + "\", "
                    + "\"resolucion\":\"" + resolucion + "\"}";
            String query = "INSERT INTO Producto(nombre, detalles) VALUES (?, ?::jsonb)";

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, nombre);
            ps.setString(2, json);

            int affectedRow = ps.executeUpdate();
            if (affectedRow > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Print stack trace for debugging
            bandera = false;
        }
        return bandera;
    }

    // Method for reading product details by name for case 2
    public static List<String> readProductsByName(Connection connection, String nombre) {
        List<String> productDetailsList = new ArrayList<>();
        try {
            String query = "SELECT * FROM Producto WHERE nombre = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, nombre);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String productDetails = rs.getString("detalles");
                productDetailsList.add(productDetails);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productDetailsList;
    }

    // Update method for case 3
    public static boolean updateProductDetails(Connection connection, int id, String nombre, String marca, String modelo, double precio, String pantalla, String resolucion) {
        boolean success = true;
        try {
            // Update query with nested jsonb_set functions
            String query = "UPDATE Producto SET "
                    + "detalles = jsonb_set("
                    + "jsonb_set("
                    + "jsonb_set("
                    + "jsonb_set("
                    + "jsonb_set("
                    + "jsonb_set(detalles, '{nombre}', to_jsonb(?::text), false), "
                    + "'{marca}', to_jsonb(?::text), false), "
                    + "'{modelo}', to_jsonb(?::text), false), "
                    + "'{precio}', to_jsonb(?::numeric), false), "
                    + "'{pantalla}', to_jsonb(?::text), false), "
                    + "'{resolucion}', to_jsonb(?::text), false) "
                    + "WHERE id = ?";

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, nombre);      // Set nombre
            ps.setString(2, marca);       // Set marca
            ps.setString(3, modelo);      // Set modelo
            ps.setDouble(4, precio);      // Set precio
            ps.setString(5, pantalla);    // Set pantalla
            ps.setString(6, resolucion);  // Set resolucion
            ps.setInt(7, id);             // Set product ID

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Product updated successfully.");
                return true;
            } else {
                System.out.println("No rows affected during update.");
                success = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log any SQL exceptions for debugging
            success = false;
        }
        return success;
    }

    // Check if product exists
    public static boolean productExists(Connection connection, int id) {
        try {
            String query = "SELECT COUNT(*) FROM Producto WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;  // Returns true if product exists
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete method for case 4
    public static boolean deleteProductByNameAndModel(Connection connection, String nombre, String modelo) {
        boolean isDeleted = false;
        try {
            String query = "DELETE FROM Producto WHERE nombre = ? AND detalles->>'marca' = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, nombre);
            ps.setString(2, modelo);

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                isDeleted = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isDeleted;
    }

    // Format product details
    public static String formatProductDetails(String json) {
        // Clean up the JSON string to extract details
        json = json.replace("{", "").replace("}", "").replace("\"", "").trim();
        StringBuilder formattedDetails = new StringBuilder();

        // Split the JSON-like string into key-value pairs
        String[] lines = json.split(",");

        // Initialize variables to hold the details
        String marca = "", modelo = "", nombre = "", precio = "", pantalla = "", resolucion = "";

        for (String line : lines) {
            String[] keyValue = line.split(":");
            if (keyValue.length == 2) {
                String key = keyValue[0].trim();
                String value = keyValue[1].trim();
                switch (key) {
                    case "marca":
                        marca = value;
                        break;
                    case "modelo":
                        modelo = value;
                        break;
                    case "precio":
                        precio = value;
                        break;
                    case "pantalla":
                        pantalla = value;
                        break;
                    case "resolucion":
                        resolucion = value;
                        break;
                }
            }
        }

        // Ensure the name is fetched from the product name passed in case option 2
        // If you have a separate name in the product data, modify accordingly
        formattedDetails.append(String.format("%-12s %-12s %-12s %-10s %-15s %-15s",
                marca, modelo, nombre, precio, pantalla, resolucion));

        return formattedDetails.toString();
    }

}
