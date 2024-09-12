package servlet2;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.List;

public class servlet2 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String option = request.getParameter("option");

            Connection connection = ConnectionMySQLBDInstituto.obtainConnection();
            if (connection != null) {
                if (option != null) {
                    switch (option) {
                        case "1":
                            List<String> proffesors_al = Methods.showProffesors(connection);
                            request.setAttribute("users_al1", proffesors_al);
                            request.getRequestDispatcher("/ejemplo10/result1.jsp").forward(request, response);
                            break;
                        case "2":
                            List<String> alumnos_al = Methods.showAlumno(connection);
                            request.setAttribute("users_al2", alumnos_al);
                            request.getRequestDispatcher("/ejemplo10/result2.jsp").forward(request, response);
                            break;
                        case "3":
                            List<String> modulo_al = Methods.showModulo(connection);
                            request.setAttribute("users_al3", modulo_al);
                            request.getRequestDispatcher("/ejemplo10/result3.jsp").forward(request, response);
                            break;
                        case "4":
                            List<String> grupo_al = Methods.showGrupo(connection);
                            request.setAttribute("users_al4", grupo_al);
                            request.getRequestDispatcher("/ejemplo10/result4.jsp").forward(request, response);
                            break;
                    }

                }

                /*
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet servlet2</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Connection successfully.</h1>");
                out.println("</body>");
                out.println("</html>");
                 */
            } else {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet servlet2</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Error connection.</h1>");
                out.println("</body>");
                out.println("</html>");
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
