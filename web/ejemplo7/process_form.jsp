<%-- 
    Document   : process_form
    Created on : Sep 11, 2024, 3:28:16 PM
    Author     : mihaitamatei
--%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String url = "jdbc:mysql://127.0.0.1:3306/DBRegister";
    String user = "root";
    String password = "12345678";
    Class.forName("com.mysql.cj.jdbc.Driver"); //Only for web
    Connection connection = DriverManager.getConnection(url, user, password);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Process form</title>
    </head>
    <body>
        <h1>Information registered from the form.</h1>
        <%
            String firstLastName = request.getParameter("txtName");
            String[] pet = request.getParameterValues("lstPet");
            String country = request.getParameter("cboCountryCode");
            String[] hobby = request.getParameterValues("chbHobby");
            String dateTime_ = request.getParameter("txtDateTime");
            String email = request.getParameter("myEmail");
            String sex = request.getParameter("radioS");
            String phone = request.getParameter("myPhone");
            String password_ = request.getParameter("txtPassword");
            String autorize = request.getParameter("chbAccept");
        %>

        <%=firstLastName%><br>
        <%=Arrays.toString(pet)%><br>
        <%=country%><br>
        <%=Arrays.toString(hobby)%><br>
        <%=dateTime_%><br>
        <%=email%><br>
        <%=sex%><br>
        <%=phone%><br>
        <%=password_%><br>
        <%=autorize%><br>
                
        <%
            try {
            String query = "INSERT INTO client_ (idClient,firstLastName,pet,country,hobby,dateTime_,email,sex,phone,password_,autorize) " 
                         + "VALUES (NULL,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1,firstLastName);
            
            Gson gson = new Gson();
            String petJSON = gson.toJson(pet);
            ps.setString(2, petJSON);
            
            ps.setString(3, country);
            
            String hobbyJSON = gson.toJson(hobby);
            ps.setString(4, hobbyJSON);
            
            ps.setString(5, dateTime_);
            
            ps.setString(6, email);
            
            ps.setString(7, sex);
            
            ps.setString(8, phone);
            
            ps.setString(9, password_);
            
            boolean accept = (autorize != null && autorize.equals("on"));
            ps.setBoolean(10, accept);
            
            ps.executeUpdate();
            out.println("Information inserterd.");
            } catch(Exception e) {
            out.println("Error inserting information.");
            }
        %>
        <br><br>    
    <a href="../ejemplo7/formulario.jsp">Go to the form.</a><br><br><br>    
    </body>
</html>
