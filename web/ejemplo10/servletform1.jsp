<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action='http://localhost:8080/Web_Project_Java/OtroServlet' method="POST"> <!-- aqui cambias tambien el nombre que pusiste en xml -->
            <h1>Insert Name</h1>
            <input type="text" name="txtName" />
            <input type='submit' value='Send' />
            <br><br><br>
            <h1>Operation</h1>
            <input type="text" name="txtNumber" />
            <input type='submit' name="operation" value='Square root' />
            <input type='submit' name="operation" value='Cube root' />
            <input type='submit' name="operation" value='Square' />
        </form>
    </body>
</html>
