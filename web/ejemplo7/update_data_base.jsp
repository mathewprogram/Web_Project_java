<%@page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet"%>
<%@page import="java.util.Set, java.util.TreeSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Datos de conexión
    String url = "jdbc:mysql://127.0.0.1:3306/DBRegister";
    String user = "root";
    String password = "12345678";

    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    ResultSet countriesRs = null;
    ResultSet hobbiesRs = null;
    Set<String> pets_ts = new TreeSet<>();
    String selectedCountryId = "";

    try {
        // Establecer conexión
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, user, password);

        // Obtener el ID del cliente de los parámetros
        String clientId = request.getParameter("id");

        // Consulta para obtener detalles del cliente
        String clientQuery = "SELECT * FROM client_ WHERE idClient = ?";
        ps = connection.prepareStatement(clientQuery);
        ps.setInt(1, Integer.parseInt(clientId));
        rs = ps.executeQuery();

        if (rs.next()) {
            selectedCountryId = rs.getString("country");

            // Consulta para obtener las opciones de mascotas
            String petsQuery = "SELECT * FROM pet";
            ps = connection.prepareStatement(petsQuery);
            ResultSet petsRs = ps.executeQuery();
            while (petsRs.next()) {
                pets_ts.add(petsRs.getString("description_"));
            }

            // Consulta para obtener las opciones de países
            String countryQuery = "SELECT idCountry, description_ FROM country ORDER BY description_";
            ps = connection.prepareStatement(countryQuery);
            countriesRs = ps.executeQuery();

            // Consulta para obtener las opciones de hobbies
            String hobbyQuery = "SELECT description_ FROM hobby ORDER BY description_";
            ps = connection.prepareStatement(hobbyQuery);
            hobbiesRs = ps.executeQuery();

        } else {
            out.println("No client found with the provided ID.");
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Form</title>
    </head>
    <body>
        <h1>Update Form</h1>

        <form action="process_update.jsp" method="POST">
            <input type="hidden" name="id" value="<%= rs.getInt("idClient") %>">

            1. Client First and Last Name:
            <input type="text" name="txtName" value="<%= rs.getString("firstLastName") %>" /><br><br>

            2. Multiple selection list of pets:
            <select name="lstPet" multiple="true" size="3">
                <%
                    for (String description_ : pets_ts) {
                        boolean selected = rs.getString("pet").contains(description_);
                        out.println("<option value='" + description_ + "'" + (selected ? " selected" : "") + ">" + description_ + "</option>");
                    }
                %>
            </select><br><br>

            3. Simple selection list Country:
            <select name="cboCountryCode">
                <%
                    if (countriesRs != null) {
                        while (countriesRs.next()) {
                            String idCountry = countriesRs.getString("idCountry");
                            String description = countriesRs.getString("description_");
                            boolean selected = selectedCountryId.equals(idCountry);
                            out.println("<option value='" + idCountry + "'" + (selected ? " selected" : "") + ">" + description + "</option>");
                        }
                    } else {
                        out.println("<option value=''>No countries available</option>");
                    }
                %>
            </select><br><br>

            4. Multiple selection Checkbox:
            <%
                if (hobbiesRs != null && rs != null && rs.getString("hobby") != null) {
                    String selectedHobbies = rs.getString("hobby");
                    while (hobbiesRs.next()) {
                        String hobbyDescription = hobbiesRs.getString("description_");
                        boolean checked = selectedHobbies.contains(hobbyDescription);
                        out.println("<br><input type='checkbox' name='chbHobby' value='" + hobbyDescription + "'" + (checked ? " checked" : "") + "/>" + hobbyDescription);
                    }
                } else {
                    out.println("<p>No hobbies available or no hobbies selected.</p>");
                }
            %>
            <br><br>

            <label for="lblDateTime">5. Select Date and Time: 
                <input type="datetime-local" name="txtDateTime" id="lblMeetingDate" value="<%= rs.getString("dateTime_") %>" required />
            </label><br><br>

            <label>6. Insert email:
                <input type="email" pattern=".+@.+.com" size="18" placeholder="user@gmail.com" name="myEmail" value="<%= rs.getString("email") %>" required />
            </label><br><br>

            <label>7. Radio button to select different options:
                <input type="radio" name="radioS" value="H" <%= rs.getString("sex").equals("H") ? "checked" : "" %>>Man
                <input type="radio" name="radioS" value="M" <%= rs.getString("sex").equals("M") ? "checked" : "" %>>Woman
            </label><br><br>

            <label>8. Insert your phone number:
                <input type="tel" name="myPhone" id="phoneNumber" pattern="[0-9]{9,9}" size="12" placeholder="xxxxxxxxx" value="<%= rs.getString("phone") %>" required />
            </label><br><br>

            <label>9. Password:
                <input type="password" name="txtPassword" value="<%= rs.getString("password_") %>" />
            </label><br><br>

            <label>10. Simple check box:
                <input type="checkbox" name="chbAccept" <%= rs.getBoolean("autorize") ? "checked" : "" %> />Accept to register the information.
            </label><br><br>

            <input type="submit" name="btnUpdate" value="Update" />
        </form>
        <a href="../ejemplo5/index.jsp">Go to the index.</a><br><br><br>
    </body>
</html>
