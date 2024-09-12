<%-- 
    Document   : delete_data_base
    Created on : Sep 12, 2024, 2:10:30 PM
    Author     : mihaitamatei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    String id = request.getParameter("id");
    String url = "jdbc:mysql://127.0.0.1:3306/DBRegister";
    String user = "root";
    String password = "12345678";

    Connection connection = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, user, password);

        String query = "DELETE FROM client_ WHERE idClient = ?";
        ps = connection.prepareStatement(query);
        ps.setInt(1, Integer.parseInt(id));

        int rowsDeleted = ps.executeUpdate();
        if (rowsDeleted > 0) {
            out.println("Record deleted successfully.");
        } else {
            out.println("No record found with the provided ID.");
        }

    } catch (Exception e) {
        out.println("Error deleting record.");
        e.printStackTrace();
    } finally {
        if (ps != null) ps.close();
        if (connection != null) connection.close();
    }
%>

<br><a href="../ejemplo5/index.jsp">Go to the index.</a><br><br><br>