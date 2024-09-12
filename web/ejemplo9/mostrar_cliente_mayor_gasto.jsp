<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ejemplo1.ConexionMySQL_tienda_bd"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.*"%>
<%--<%@page import="java.sql.*"%> esto importa todas las bibliotecas de java.sql--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Client with the biggest expenses</title>
    </head>
    <body>
        <h1>Show biggest expanse</h1>

        <%
            Connection connection = ConexionMySQL_tienda_bd.obtainConection();
            String query = "CALL mostrar_cliente_mayor_gasto_total()";

            try {
                // Preparar la llamada al procedimiento almacenado
                CallableStatement cs = connection.prepareCall(query);

                // Ejecutar el procedimiento
                boolean hasResultSet = cs.execute();

                //RECUPERAR LO DEL SELECT
                if (hasResultSet) {
                    ResultSet rs = cs.getResultSet();
                    while (rs.next()) {
                        String nombre = rs.getString(1);
                        int cantidad = rs.getInt(2);

                        out.print(nombre);
                        out.print(cantidad);
                    }
                    out.println("SI HAY RESULTADOS");
                } else {
                    out.println("NO HAY RESULTADOS");
                }

            } catch (SQLException e) {
                out.println("ERROR DE QUERY: " + e.getMessage());
            } finally {
                try {
                    // Cerrar la conexión
                    if (connection != null) {
                        connection.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }


        %> 

    </body>
</html>
