<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Users</h1>
        <%
            List<String> users_al = (ArrayList) request.getAttribute("users_al");
            if (users_al != null) {
                for (String user : users_al) {
                    out.println(user);
                }
            }
        %>
        <footer style='position: fixed; bottom: 10px; width: 100%; text-align: center;'>
            <a href='http://localhost:8080/Web_Project_Java/ejemplo10/menu.jsp'>Go to menu</a>
        </footer>
    </body>
</html>
