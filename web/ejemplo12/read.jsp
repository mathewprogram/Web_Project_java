<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Read Product Details</title>
</head>
<body>
    <form action="http://localhost:8080/Web_Project_Java/server_Menu_CRUD_PostgreSQL?option=2">
        <input type="hidden" name="option" value="2"/>
        <label>Product Name:</label>
        <input type="text" name="txtNombre" placeholder="Product Name" required/><br>
        <input type="submit" value="Fetch Product" style="margin-left: 100px;"/>
        <footer style='position: fixed; bottom: 10px; width: 100%; text-align: center;'>
            <a href='http://localhost:8080/Web_Project_Java/ejemplo12/index_CRUD.jsp'>Go back</a>
        </footer>
    </form>
</body>
</html>

