<%-- 
    Document   : index
    Created on : Sep 4, 2024, 1:11:02 PM
    Author     : mihaitamatei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Java Server Page Page</title>
    </head>
    <body>
        <%-- Component Java --%>
        <%
            //Entry
            String numero1 = "";
            String numero2 = "";
            
            //Exit
            String result = "";
            
            //Action
            if(request.getParameter("btnSum") != null){
                numero1 = request.getParameter("txtNumero1");
                numero2 = request.getParameter("txtNumero2");
                try {
                    double sum = Double.parseDouble(numero1) + Double.parseDouble(numero2);
                    result = sum + "";
                }catch(Exception e){
                numero1 = "";
                numero2 = "";
                result = "";
                }
            }
        %>
        
        <%-- Componente Vista (HTML) --%>
        <form action="sumar.jsp" method="post">
            <!-- Entry -->
            Number 1: <input type="text" name="txtNumero1" value="<%=numero1%>" /><br><br>
            Number 2: <input type="text" name="txtNumero2" value="<%=numero2%>" /><br><br>
            
            <!-- Exit -->
            Result<input type="text" name="txtResult" value="<%=result%>" readonly /><br><br>
            
            <!-- Process -->
            <input type="submit" value="Sum" name="btnSum" />
            <input type="submit" value="Nuevo" name="btnReset" />
            
        </form>
        
    </body>
</html>
