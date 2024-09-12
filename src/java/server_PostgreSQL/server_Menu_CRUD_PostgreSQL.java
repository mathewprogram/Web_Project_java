package server_PostgreSQL;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.List;

public class server_Menu_CRUD_PostgreSQL extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Connection connection = ConnectionPostgresqlTienda.obtainConnection();

            if (connection != null) {
                //out.println("Connection ok.<br>");
                String option = request.getParameter("option");
                out.println("Option: " + option + "<br>"); // Debugging output

                if (option == null) {
                    out.println("No option received.<br>");
                    return;
                }

                switch (option) {
                    case "1":
                        String nombre = request.getParameter("txtNombre");
                        String marca = request.getParameter("txtMarca");
                        String modelo = request.getParameter("txtModelo");
                        String precioStr = request.getParameter("txtPrecio");
                        String pantalla = request.getParameter("txtPantalla");
                        String resolucion = request.getParameter("txtResolucion");

                        out.println("Nombre: " + nombre + "<br>");
                        out.println("Marca: " + marca + "<br>");
                        out.println("Modelo: " + modelo + "<br>");
                        out.println("Precio: " + precioStr + "<br>");
                        out.println("Pantalla: " + pantalla + "<br>");
                        out.println("Resolucion: " + resolucion + "<br>");

                        double precio = 0.0;
                        try {
                            precio = Double.parseDouble(precioStr);
                            out.println("Parsed Precio: " + precio + "<br>");
                        } catch (NumberFormatException e) {
                            out.println("Invalid price format.<br>");
                            return;
                        }

                        out.println("Inserting product...<br>");
                        if (OperationsCrud.insertarProducto(connection, nombre, marca, modelo, precio, pantalla, resolucion)) {
                            out.println("Insertion ok.<br>");
                        } else {
                            out.println("Insertion error.<br>");
                        }
                        break;

                    case "2":
                        String productN = request.getParameter("txtNombre");
                        out.println("Product Name: " + productN + "<br>");
                        out.println("Fetching product details...<br>");

                        List<String> productDetailsList = OperationsCrud.readProductsByName(connection, productN);
                        if (!productDetailsList.isEmpty()) {
                            // Print the header once with matching column widths
                            out.println("<pre>");
                            out.println(String.format("<strong>%-12s %-12s %-12s %-10s %-15s %-15s</strong>",
                                    "Brand", "Model", "Name", "Price", "Screen", "Resolution"));
                            out.println(String.format("%-12s %-12s %-12s %-10s %-15s %-15s",
                                    "----------", "----------", "----------", "----------", "----------", "----------"));

                            for (String productDetails : productDetailsList) {
                                // Format and print the product details
                                String formattedProductDetails = OperationsCrud.formatProductDetails(productDetails);
                                out.println(formattedProductDetails);
                            }
                            out.println("</pre>");
                        } else {
                            out.println("Product not found.<br>");
                        }
                        break;

                    case "3":
                        String productIdStr = request.getParameter("txtID");
                        String newName = request.getParameter("txtNombre");
                        String newMarca = request.getParameter("txtMarca");
                        String newModelo = request.getParameter("txtModelo");
                        String newPrecioStr = request.getParameter("txtPrecio");
                        String newPantalla = request.getParameter("txtPantalla");
                        String newResolucion = request.getParameter("txtResolucion");

                        int productId = 0;
                        try {
                            productId = Integer.parseInt(productIdStr); // Parse the product ID
                            out.println("Updating product with ID: " + productId + "<br>");
                        } catch (NumberFormatException e) {
                            out.println("Invalid ID format.<br>");
                            return;
                        }

                        double newPrecio = 0.0;
                        try {
                            newPrecio = Double.parseDouble(newPrecioStr); // Parse the new price
                            out.println("Parsed new price: " + newPrecio + "<br>");
                        } catch (NumberFormatException e) {
                            out.println("Invalid price format for update.<br>");
                            return;
                        }

                        if (OperationsCrud.productExists(connection, productId)) {
                            if (OperationsCrud.updateProductDetails(connection, productId, newName, newMarca, newModelo, newPrecio, newPantalla, newResolucion)) {
                                out.println("Product update ok.<br>");
                            } else {
                                out.println("Product update error.<br>");
                            }
                        } else {
                            out.println("Product with ID " + productId + " does not exist.<br>");
                        }

                        break;

                    case "4":
                        String productNameToDelete = request.getParameter("txtNombre");
                        String productModelToDelete = request.getParameter("txtModelo");

                        out.println("Deleting Product: " + productNameToDelete + "<br>");
                        out.println("Model: " + productModelToDelete + "<br>");

                        if (OperationsCrud.deleteProductByNameAndModel(connection, productNameToDelete, productModelToDelete)) {
                            out.println("Product deleted successfully.<br>");
                        } else {
                            out.println("Error: Product not found or could not be deleted.<br>");
                        }
                        break;
                }
            } else {
                out.println("Connection error.<br>");
            }

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet server_Menu_CRUD_PostgreSQL</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1></h1>");
            out.println("<footer style='position: fixed; bottom: 10px; width: 100%; text-align: center;'>");
            out.println("<a href='http://localhost:8080/Web_Project_Java/ejemplo12/index_CRUD.jsp'>Go back</a>");
            out.println("</footer>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
