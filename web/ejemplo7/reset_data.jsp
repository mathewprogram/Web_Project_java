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
    Class.forName("com.mysql.cj.jdbc.Driver"); // Only for web
    Connection connection = DriverManager.getConnection(url, user, password);

    String query = "SELECT * FROM pet;";
    PreparedStatement ps = connection.prepareStatement(query);
    ResultSet rs = ps.executeQuery();

    Set<String> pets_ts = new TreeSet<>();

    while (rs.next()) {
        pets_ts.add(rs.getString(2));
    }

    String queryone = "SELECT idCountry, description_ FROM country ORDER BY description_";
    ps = connection.prepareStatement(queryone);
    ResultSet countriesRs = ps.executeQuery();

    String querytwo = "SELECT description_ FROM hobby ORDER BY description_";
    ps = connection.prepareStatement(querytwo);
    ResultSet hobbiesRs = ps.executeQuery();
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
            1. Client First and Last Name: 
            <input type="text" name="txtName" value="" /><br><br>

            2. Multiple selection list of pets:
            <select name="lstPet" multiple="true" size="3">
                <% 
                    for (String description_ : pets_ts) {
                        out.println("<option value='" + description_ + "'>" + description_ + "</option>");
                    }
                %>
            </select><br><br>

            3. Simple selection list Country:
            <select name="cboCountryCode" size="1">
                <% 
                    while (countriesRs.next()) {
                        out.println("<option value='" + countriesRs.getString("idCountry") + "'>" + countriesRs.getString("description_") + "</option>");
                    }
                %>
            </select><br><br>

            4. Multiple selection Checkbox:
            <% 
                while (hobbiesRs.next()) {
                    out.println("<br><input type='checkbox' name='chbHobby' value='" + hobbiesRs.getString("description_") + "' />" + hobbiesRs.getString("description_"));
                }
            %><br><br>

            <label for="lblDateTime">5. Select Date and Time: 
                <input type="datetime-local" name="txtDateTime" id="lblMeetingDate" value="" required />
            </label><br><br>

            <label> 
                6. Insert email:
                <input type="email" pattern=".+@.+.com" size="18" placeholder="user@gmail.com" name="myEmail" value="" required />
            </label><br><br>

            <label>
                7. Radio button to select different options:
                <input type="radio" name="radioS" value="H" />Man
                <input type="radio" name="radioS" value="M" />Woman
            </label><br><br>

            <label>
                8. Insert your phone number:
                <input type="tel" name="myPhone" id="phoneNumber" pattern="[0-9]{9,9}" size="12" placeholder="xxxxxxxxx" value="" required />
            </label><br><br>

            <label>
                9. Password: 
                <input type="password" name="txtPassword" value="" />
            </label><br><br>

            <label>
                10. Simple check box:
                <input type="checkbox" name="chbAccept" />Accept to register the information.
            </label><br><br>

            <input type="submit" name="btnRegister" value="Register" />
            <input type="reset" name="btnReset" value="Reset" />
            <br><br>
        </form>
        <a href="../ejemplo5/index.jsp">Go to the index.</a><br><br><br>
    </body>
</html>
