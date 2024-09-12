<%-- 
    Document   : formulario
    Created on : Sep 11, 2024, 12:45:53 PM
    Author     : mihaitamatei
--%>

<%@page import="java.util.TreeSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String url = "jdbc:mysql://127.0.0.1:3306/DBRegister";
    String user = "root";
    String password = "12345678";
    Class.forName("com.mysql.cj.jdbc.Driver"); //Only for web
    Connection connection = DriverManager.getConnection(url, user, password);

    String query = "SELECT * FROM pet;";
    PreparedStatement ps = connection.prepareStatement(query);
    ResultSet rs = ps.executeQuery();

    Set<String> pets_ts = new TreeSet();

    while (rs.next()) {
        pets_ts.add(rs.getString(2));
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Form</title>
    </head>
    <body>
        <h1>Register Form.</h1>
        <form action="process_form.jsp">
            1.Client First and Last Name: <input type="text" name="txtName"/><br><br>

            2. Multiple selection list of pets:
            <select name="lstPet" multiple="true" size="3" >
                <%                    for (String description_ : pets_ts) {
                        out.println("<option value=" + description_ + ">" + description_ + "</option>");
                    }
                %>
            </select><br>   

            <%
                String queryone = "SELECT idCountry, description_ FROM country ORDER BY description_";
                ps = connection.prepareStatement(queryone);
                rs = ps.executeQuery();
            %>
            <br><br><br>
            3. Simple selection list Country:
            <select name="cboCountryCode" size="1" >
                <%
                    while (rs.next()) {
                        out.println("<option value=" + rs.getString(1) + ">" + rs.getString(2) + "</option>");
                    }
                %>    
            </select><br>
            <br><br>
            <%
                String querytwo = "SELECT description_ FROM hobby ORDER BY description_";
                ps = connection.prepareStatement(querytwo);
                rs = ps.executeQuery();
            %>
            4. Multiple selection Checkbox:
            <%
                while (rs.next()) {
                    out.println("<br><input type='checkbox' name='chbHobby' value='" + rs.getString(1) + "'/>" + rs.getString(1));
                }
            %>
            <br><br>
            <label for="lblDateTime">5. Select Date and Time: 
                <input 
                    type="datetime-local" 
                    name="txtDateTime" 
                    id="lblMeetingDate"
                    required />
            </label>
            <br><br>
            <label> 
                6. Insert email:
                <input type="email" 
                       pattern=".+@+.+.com" 
                       size="18"
                       placeholder="user@gmail.com"
                       minlenght="18"
                       maxlenght="18"
                       list="emailList"
                       name ="myEmail"
                       required />
            </label>
            <br><br>
            <label>
                7. Radio button to select different options:
            <input type="radio" name="radioS" value="H" />Man
            <input type="radio" name="radioS" value="M" />Woman
            </label>
            
            <label>
                <br><br>    
                8. Insert your phone number:
            <input type="tel"
                   name="myPhone"
                   id="phoneNumber"
                   pattern="[0-9]{9,9}"
                   size="12"
                   placeholder = "xxxxxxxxx"
                   minlenght="18"
                   maxlenght="18"
                   list="phoneNumberList"
                   required />
            <datalist id="phoneNumberList">
                <option value="625942928" />
                <option value="609164121" />
                <option value="666777888" />
                <option value="765892345" />
            </datalist>
            </label>
            <br><br>
            <label>
                9. Password: <input type="password" name="txtPassword" />
            </label>
            <br><br>
            <label>
                10. Simple check box:
            <input type="checkbox" name="chbAccept" />Accept to register the information.
            </label>
            <br><br>
            <input type="submit" name="btnRegister" value="Register" />
            <br><br>
        </form>
        <a href="../ejemplo5/index.jsp">Go to the index.</a><br><br><br>
    </body>
</html>
