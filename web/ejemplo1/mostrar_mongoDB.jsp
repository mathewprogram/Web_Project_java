<%-- 
    Document   : mostrar_mongoDB
    Created on : Sep 4, 2024, 2:17:44 PM
    Author     : mihaitamatei
--%>

<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Java Server Page Page</title>
    </head>
    <body>
        <h1>Show the documents of a collection</h1>
        <%
            //Connection with mongoDB
            String databaseName = "campusfp";
        String serverName = "localhost";
        int puerto = 27017;
        
        // Crear la base de datos
        MongoClient mc = new MongoClient(serverName, puerto);
        
        // Obtener la base de datos
        MongoDatabase database = mc.getDatabase(databaseName);
        MongoCollection<Document> alumno = database.getCollection("alumno");
        out.print("Connection ok." + "<br><br>");

        //Show all of the documents
        try (MongoCursor<Document> cursor = alumno.find().iterator()){
                while(cursor.hasNext()){
                    Document doc = cursor.next();
                    //System.out.println(doc.toJson());
                    out.print(doc.toJson() + "<br><br>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }   
        %>    
    </body>
</html>
