<%@page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement"%>
<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Datos de conexión
    String url = "jdbc:mysql://127.0.0.1:3306/DBRegister";
    String user = "root";
    String password = "12345678";

    Connection connection = null;
    PreparedStatement ps = null;
    Gson gson = new Gson();

    try {
        // Establecer conexión
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, user, password);

        // Obtener los parámetros del formulario
        int clientId = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("txtName");
        String selectedCountry = request.getParameter("cboCountryCode");
        String[] selectedHobbies = request.getParameterValues("chbHobby");
        String[] selectedPets = request.getParameterValues("lstPet");

        String hobbiesJson = selectedHobbies != null ? gson.toJson(selectedHobbies) : "[]";
        String petsJson = selectedPets != null ? gson.toJson(selectedPets) : "[]";

        String dateTime = request.getParameter("txtDateTime");
        String email = request.getParameter("myEmail");
        String sex = request.getParameter("radioS");
        String phone = request.getParameter("myPhone");
        String password_ = request.getParameter("txtPassword");
        boolean accept = request.getParameter("chbAccept") != null;

        // Consulta para actualizar el cliente
        String updateQuery = "UPDATE client_ SET firstLastName=?, pet=?, country=?, hobby=?, dateTime_=?, email=?, sex=?, phone=?, password_=?, autorize=? WHERE idClient=?";
        ps = connection.prepareStatement(updateQuery);
        ps.setString(1, name);
        ps.setString(2, petsJson); 
        ps.setString(3, selectedCountry);
        ps.setString(4, hobbiesJson); 
        ps.setString(5, dateTime);
        ps.setString(6, email);
        ps.setString(7, sex);
        ps.setString(8, phone);
        ps.setString(9, password_);
        ps.setBoolean(10, accept);
        ps.setInt(11, clientId);

        int rowsUpdated = ps.executeUpdate();
        if (rowsUpdated > 0) {
            out.println("Update successful!");
        } else {
            out.println("Update failed. No rows affected.");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("An error occurred: " + e.getMessage());
    } finally {
        // Cerrar recursos
        if (ps != null) ps.close();
        if (connection != null) connection.close();
    }
%>

<html>
    <br><br><br><a href="../ejemplo5/index.jsp">Go to the index.</a><br><br><br>
</html>
