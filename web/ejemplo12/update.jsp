<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product Price</title>
    </head>
    <body>
        <h1>Update Product Price</h1>
        <form action="http://localhost:8080/Web_Project_Java/server_Menu_CRUD_PostgreSQL?option=3" method="post">
            <input type="hidden" name="option" value="3"/>
            <input type="text" name="txtID" placeholder="Product ID" required/><br>
            <p><strong>Data JSON</strong></p>
            <input type="text" name="txtNombre" placeholder="Nombre" required/><br>
            <input type="text" name="txtMarca" placeholder="Brand" required/><br>
            <input type="text" name="txtModelo" placeholder="Model" required/><br>
            <input type="text" name="txtPrecio" placeholder="Price" required/><br>
            <p><strong>Specifications</strong></p>
            <input type="text" name="txtPantalla" placeholder="Dimension in inches" required/><br>
            <input type="text" name="txtResolucion" placeholder="Resolution" required/><br>

            <br><input type="submit" value="Update Product" style="margin-left: 53px;" />
            <footer style='position: fixed; bottom: 10px; width: 100%; text-align: center;'>
                <a href='http://localhost:8080/Web_Project_Java/ejemplo12/index_CRUD.jsp'>Go back</a>
            </footer>
        </form>

    </body>
</html>

