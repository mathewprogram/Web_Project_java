<%-- 
    Document   : show_data_base
    Created on : Sep 12, 2024, 11:19:56 AM
    Author     : mihaitamatei
--%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String url = "jdbc:mysql://127.0.0.1:3306/DBRegister";
    String user = "root";
    String password = "12345678";
    Class.forName("com.mysql.cj.jdbc.Driver"); //Only for web
    Connection connection = DriverManager.getConnection(url, user, password);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show table</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 14px 6px;
                text-align: left;
                border: 1px solid #ddd;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #f5f5f5;
            }
        </style>
    </head>
    <body>
        <h1>(Read - Update - Delete) Data Table</h1>
        <%
            String query = "SELECT * FROM client_";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            //out.print("Connection ok." + "<br><br>");
        %>

        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Pets</th>
                    <th>Country</th>
                    <th>Hobbies</th>
                    <th>Date & Time</th>
                    <th>Email</th>
                    <th>Sex</th>
                    <th>Phone</th>
                    <th>Password</th>
                    <th>Authorized</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <%                    //Show all of the documents
                    try {
                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rs.getInt("idClient") + "</td>");
                            out.println("<td>" + rs.getString("firstLastName") + "</td>");
                            out.println("<td>" + rs.getString("pet") + "</td>");
                            out.println("<td>" + rs.getString("country") + "</td>");
                            out.println("<td>" + rs.getString("hobby") + "</td>");
                            out.println("<td>" + rs.getString("dateTime_") + "</td>");
                            out.println("<td>" + rs.getString("email") + "</td>");
                            out.println("<td>" + rs.getString("sex") + "</td>");
                            out.println("<td>" + rs.getString("phone") + "</td>");
                            out.println("<td>" + rs.getString("password_") + "</td>");
                            out.println("<td>" + rs.getInt("autorize") + "</td>");
                            /*String autorizeText = rs.getBoolean("autorize") ? "Yes" : "No";
                            out.println("<td>" + autorizeText + "</td>");*/
                            
                            //Update
                            out.println("<td>");
                            out.println("<form action='update_data_base.jsp' method='POST'>");
                            out.println("<input type='hidden' name='id' value='" + rs.getInt("idClient") + "'/>");
                            out.println("<input type='submit' value='Update'/>");
                            out.println("</form>");
                            
                            //Delete
                            out.println("<td>");
                            out.println("<form action='delete_data_base.jsp' method='POST'>");
                            out.println("<input type='hidden' name='id' value='" + rs.getInt("idClient") + "'/>");
                            out.println("<input type='submit' value='Delete'/>");
                            out.println("</form>");
                            out.println("</td>");
                            
                            out.println("</tr>");
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='11'>Error retrieving data</td></tr>");
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table><br><br>   
        <br><br><br><a href="../ejemplo5/index.jsp">Go to the index.</a><br><br><br>
    </body>
</html>
