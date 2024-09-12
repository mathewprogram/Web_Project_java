<%-- 
    Document   : search_mongoDB_enclase
    Created on : Sep 6, 2024, 2:23:22 PM
    Author     : mihaitamatei
--%>

<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="com.mongodb.client.model.Filters"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //CONEXION CON MONGODB
    String databaseName = "campusfp";
    String serverName = "localhost";//127.0.0.1
    int puerto = 27017;

    // Crear la conexión al servidor de MongoDB
    MongoClient mc = new MongoClient(serverName, puerto);

    // Obtener la base de datos
    MongoDatabase database = mc.getDatabase(databaseName);
    MongoCollection<Document> alumno = database.getCollection("alumno");

    //out.println("Ok connection." + "<br><br>");
%>    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Java Server Page</title>
        <style>
            .cabecera {
                border:none;
                text-align:center;
                font-size: 14px;
                outline: none;
                color: white;
                background-color: black;
                width: 8%;
            }
            .body{
                border: none;
                text-align: center;
                outline: none;
                color: black;
                width: 8%;
            }
            div {
                text-align: center;
            }
            h1{
                font-size: 22px;
            }
            input[placeholder]{
                font-family: Courier New;
            }
        </style>    
    </head>
    <body>
        <div>
            <h1>Show the students from a Collection</h1>
            <input type="text" value="idAlumno" class="cabecera" readonly/>
            <input type="text" value="nombre" class="cabecera" readonly/>
            <input type="text" value="edad" class="cabecera" readonly/>
            <input type="text" value="estatura" class="cabecera" readonly/><br>
            <%            String idAlumno = "";
                String nombre = "";
                String edad = "";
                String estatura = "";
                try (MongoCursor<Document> cursor = alumno.find().iterator()) {
                    while (cursor.hasNext()) {
                        Document doc = cursor.next();
                        //out.println(doc.toJson()+"<br>");
                        //out.println("ID: " + doc.getString("alumno"));
                        idAlumno = doc.getString("idAlumno");
                        nombre = doc.getString("nombre");
                        edad = doc.getString("edad");
                        estatura = doc.getString("estatura");
            %>
            <input  type="text" value="<%=idAlumno%>" class="body" readonly />
            <input type="text" value="<%=nombre%>" class="body" readonly />
            <input type="text" value="<%=edad%>" class="body" readonly />
            <input type="text" value="<%=estatura%>" class="body" readonly /><br>         
            <%
                    }
                }

            %>
            <%--
            <input type="text" value="<%=_id%>"/>
            <input type="text" value="X"/>
            <input type="text" value="<%=j%>"/>
            <input type="text" value="="/>
            <input type="text" value="<%=i * j%>"/><br>
            --%>
        </div>
    </body>
</html>