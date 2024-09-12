package examen_MF0226;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.List;

public class servlet_examen extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Connection conexion = ConexionMySQL_agencia_de_viajes.obtenerConexion();
            
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet servlet_examen</title>");
            out.println("<style>"
                    + "table { border-collapse: collapse; width: 100%; }"
                    + "th, td { border: 1px solid black; padding: 12px; text-align: left; }" // Aumentar padding
                    + "th { background-color: #f2f2f2; }" // Color de fondo para el encabezado
                    + "</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Examen MF0226</h1>");
            out.println("<footer style='position: fixed; bottom: 10px; width: 100%; text-align: center;'>");
            out.println("<a href='http://localhost:8080/Web_Project_Java/examen_MF0226/examen_MF0226.jsp'>Atras</a>");
            out.println("</footer>");
            out.println("</body>");
            out.println("</html>");
            
            if (conexion != null) {
                //out.println("Conexion ok.");
                List<String> resultados = Metodos_examen.mostrarTuristasYSucursales(conexion);
                if (!resultados.isEmpty()) {
                out.println("<table>");
                out.println("<tr><th>Nombre</th><th>Apellidos</th><th>Sucursal</th></tr>");

                // Iterar sobre los resultados y llenar la tabla
                for (String resultado : resultados) {
                    // Separar el nombre y apellidos de la sucursal
                    String[] partes = resultado.split(" - ");
                    if (partes.length >= 2) { // Asegúrate de que hay suficientes partes
                        String nombreCompleto = partes[0]; // Nombre y Apellido
                        String sucursal = partes[1]; // La sucursal

                        // Suponiendo que el nombre y apellidos están en la primera parte
                        // Separa el nombre y los apellidos (si están juntos)
                        String[] nombreApellido = nombreCompleto.split(" "); // Separa por espacio
                        String nombre = nombreApellido[0];
                        String apellidos = nombreCompleto.replace(nombre + " ", ""); // Resto como apellidos

                        // Imprimir una fila en la tabla
                        out.println("<tr>");
                        out.println("<td>" + nombre + "</td>");
                        out.println("<td>" + apellidos + "</td>");
                        out.println("<td>" + sucursal + "</td>");
                        out.println("</tr>");
                    } else {
                        // Depuración: Si no hay suficientes partes
                        System.out.println("Formato inesperado en: " + resultado);
                        out.println("<tr><td colspan='3'>Formato inesperado en: " + resultado + "</td></tr>");
                    }
                }

                out.println("</table>");
            } else {
                out.println("<p>No se encontraron turistas.</p>");
            }

            out.println("</body>");
            out.println("</html>");
            } else {
                out.println("Error conexion.");
            }

            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
