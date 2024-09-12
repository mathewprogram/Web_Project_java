<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: "Courier New"
            }
        </style>
    </head>
    <body>
        <h1>Insert a JSON register</h1>
    <form action="http://localhost:8080/Web_Project_Java/server_Menu_CRUD_PostgreSQL?option=1" method="post">
        <h1><strong>Product Name</strong></h1><br>
        <input type="text" name="txtNombre" placeholder="Product" required/><br>
        <br><p><strong>Datos JSON</strong></p><br>
        <input type="text" name="txtMarca" placeholder="Brand" required/><br>
        <input type="text" name="txtModelo" placeholder="Model" required/><br>
        <input type="text" name="txtPrecio" placeholder="Price" required/><br>
        <br><p><strong>Specifications</strong></p><br>
        <input type="text" name="txtPantalla" placeholder="Dimension in inches" required/><br>
        <input type="text" name="txtResolucion" placeholder="Resolution" required/><br>

        <br><input type="submit" name="send" value="Send" style="margin-left: 100px;" /><br>

        <footer style='position: fixed; bottom: 10px; width: 100%; text-align: center;'>
            <a href='http://localhost:8080/Web_Project_Java/ejemplo12/index_CRUD.jsp'>Go back</a>
        </footer>
    </form>
    </body>
</html>
