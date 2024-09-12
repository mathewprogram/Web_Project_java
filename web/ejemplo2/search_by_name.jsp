<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mongodb.client.model.Filters"%>
<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search students</title>
    </head>
    <body>
        <h1>Find students by name</h1>

        <%-- FORMULARIO DE BÚSQUEDA --%>
        <form method="get" action="search_by_name.jsp">
            <input type="text" name="txtNombre" placeholder="Student Name" />
            <input type="submit" value="Search" name="cmdBuscar" /> 
        </form>

        <%-- COMPONENTE JAVA PARA PROCESAR LA BÚSQUEDA --%>
        <%
            // Configuración de la conexión a MongoDB
            String databaseName = "campusfp";
            String serverName = "localhost";
            int puerto = 27017;

            // Crear la conexión al servidor de MongoDB
            MongoClient mc = new MongoClient(serverName, puerto);

            // Obtener la base de datos
            MongoDatabase database = mc.getDatabase(databaseName);
            MongoCollection<Document> alumno = database.getCollection("alumno");

            // Obtener el nombre del parámetro de entrada
            String nombre = request.getParameter("txtNombre");
            boolean existe = false;
            List<Document> resultados = new ArrayList<>(); // Lista para almacenar los documentos encontrados

            // Realizar la búsqueda si se ha solicitado
            if (request.getParameter("cmdBuscar") != null && nombre != null && !nombre.isEmpty()) {
                try (MongoCursor<Document> cursor = alumno.find(Filters.regex("nombre", nombre, "i")).iterator()) {
                    while (cursor.hasNext()) {
                        Document doc = cursor.next();
                        resultados.add(doc);
                        existe = true;
                    }
                }
            }
        %>

        <%-- MOSTRAR RESULTADO DE LA BÚSQUEDA --%>
        <% if (request.getParameter("cmdBuscar") != null) { %>
            <% if (existe) { %>
                <h2>Results of the search for "<%= nombre %>":</h2>
                <ul>
                    <% for (Document doc : resultados) { %>
                        <li>
                            <p><strong>Name:</strong> <%= doc.getString("nombre") %></p>
                            <p><strong>id:</strong> <%= doc.getString("idAlumno") %></p>
                            <p><strong>Age:</strong> <%= doc.getInteger("edad") %></p>
                            <p><strong>Height:</strong> <%= doc.getDouble("estatura") %> metros</p>
                        </li>
                        <hr />
                    <% } %>
                </ul>
            <% } else { %>
                <p>No student found with the name "<%= nombre %>".</p>
            <% } %>
        <% } %>
    </body>
</html>