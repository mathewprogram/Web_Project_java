<%-- 
    Document   : process
    Created on : Sep 10, 2024, 10:14:21 AM
    Author     : mihaitamatei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Process</title>
    </head>
    <body>
        <h1>Information received from the form</h1>
        <%
            String name = "";
            String password = "";
            String gen = "";
            String autorization = "";
            String[] hobby = null;
            String country = "";
            String[] pet = null;
            String email = "";
            String phone = "";
            String time = "";
            String date = "";
            if (request.getParameter("btnSend") != null) {
                name = request.getParameter("txtName");
                password = request.getParameter("txtPassword");
                gen = request.getParameter("radioG");
                autorization = request.getParameter("chbAccept");
                hobby = request.getParameterValues("chbHobby");
                country = request.getParameter("cboCountryCode");
                pet = request.getParameterValues("lstPet");
                email = request.getParameter("myEmail");
                phone = request.getParameter("myPhone");   
                time = request.getParameter("txtHour");
                date = request.getParameter("txtDate");
            }
        %> 
        <input type="text" value="<%=name%>" />    
        <input type="text" value="<%=password%>" />    
        <input type="text" value="<%=gen%>" />    
        <input type="text" value="<%=autorization%>" />    

        <br><br> 
        <%
            if (hobby != null) {
                out.println("Hobbys: <br>");
                for (int i = 0; i < hobby.length; i++) {
                    out.println("-" + hobby[i] + "<br>");
                }
            }
        %>
        <br>
        <input type="text" value="<%=country%>" />
        <br><br>
        <%
            if (pet != null) {
                out.println("Pets: <br>");
                for (int i = 0; i < pet.length; i++) {
                    out.println("-" + pet[i] + "<br>");
                }
            }
        %>
        <h2>Show pets in a list:
        <%
            if (pet != null) {
        %>
        <select size="<%=pet.length%>">
            <%
                for (int i = 0; i < pet.length; i++) {
                    out.println("<option>" + pet[i] + "</option>");
                }
            %>
        </select>
        <%
            }
        %>
        </h2>
        <h2>
            Another way to print the pet list:
            <%
            if (pet != null){
            out.println("<select size=" + pet.length + ">");
            for(int i=0; i<pet.length; i++){
            out.println("<option>" + pet[i] + "</option>");
                }
                out.println("</select>");
                }
            %>    
        </h2>
        <br>
        Email: <%=email%><br>
        Mobile Phone: <%=phone%><br>
        Time selected: <%=time%><br>
        Date time selected: <%=date%><br>
        <br><br><a href="other_components.jsp">Go to the index.</a><br>
    </body>
</html>
