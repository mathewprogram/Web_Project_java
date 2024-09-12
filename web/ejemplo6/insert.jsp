<%-- 
    Document   : insert
    Created on : Sep 9, 2024, 11:41:13 AM
    Author     : mihaitamatei
--%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%
    String databaseName = "campusfp";
    String serverName = "localhost";
    int puerto = 27017;

    // Create MongoDB client
    MongoClient mc = new MongoClient(serverName, puerto);
    MongoDatabase database = mc.getDatabase(databaseName);
    MongoCollection<Document> alumno = database.getCollection("alumno");
%>
<%@page import="misrc.Validar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert</title>
    </head>
    <body>
        <h1>Insert document.</h1>

        <%-- Java Component --%>
        <%
            String idAlumno = Validar.idAlumno(alumno);
            String nombre = "";
            String edad = "";
            String estatura = "";

            String mNombre = "";
            String mEdad = "";
            String mEstatura = "";

            if (request.getParameter("btnSave") != null) {
                idAlumno = request.getParameter("txtIdAlumno");
                nombre = request.getParameter("txtNombre");
                edad = request.getParameter("txtEdad");
                estatura = request.getParameter("txtEstatura");

                if (Validar.nombre(nombre)) {
                    mNombre = "✅";
                } else {
                    mNombre = "❌";
                }
                if (Validar.edad(edad)) {
                    mEdad = "✅";
                } else {
                    mEdad = "❌";
                }
                if (Validar.estatura(estatura)) {
                    mEstatura = "✅";
                } else {
                    mEstatura = "❌ - requiere punto.";
                }
            }

            if (request.getParameter("btnClear") != null){
            idAlumno = Validar.idAlumno(alumno);
            nombre = "";
            edad = "";
            estatura = "";
            }
            
            if (mEdad.equalsIgnoreCase("✅") && mNombre.equalsIgnoreCase("✅") && mEstatura.equalsIgnoreCase("✅")) {
                Document doc = new Document();
                doc.append("idAlumno", idAlumno);
                doc.append("nombre", nombre);
                doc.append("edad", Integer.parseInt(edad));
                doc.append("estatura", Double.parseDouble(estatura));

                alumno.insertOne(doc);
                out.println("Inserted.");
            }

        %>
        <%-- HTML Component --%>

        <form action="" method="post" >

            <input type="text" name="txtIdAlumno" value="<%=idAlumno%>" readonly /><br>
            <input type="text" name="txtNombre" value="<%= nombre%>" placeholder="insert Name" /><%=mNombre%><br>
            <input type="text" name="txtEdad" value="<%= edad%>" placeholder="insert Age" /><%=mEdad%><br>
            <input type="text" name="txtEstatura" value="<%= estatura%>" placeholder="insert Height" /><%=mEstatura%><br>

            <input type="submit" value="Clear" name="btnClear" style="margin-right: 49px;" />
            <input type="submit" value="Save" name="btnSave" />
        </form><br>    
        <a href="../ejemplo5/index.jsp">Go to the index.</a><br>
    </body>
</html>
