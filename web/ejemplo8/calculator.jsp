<%-- 
    Document   : calculator
    Created on : Sep 10, 2024, 11:52:19 AM
    Author     : mihaitamatei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculator</title>
    </head>
    <body>
        <h1>Calculator</h1>
        <form action="process.jsp" method="GET">
            <p>
                Number 1: <input type="number" step="any" name="num1" required />
            </p>
            <p>
                Number 2: <input type="number" step="any" name="num2" required />
            </p>
            <p>
            <input type="radio" name="operation" value="-" required/>Subtract
            <input type="radio" name="operation" value="+" required/>Sum
            <input type="radio" name="operation" value="/" required/>Divide
            <input type="radio" name="operation" value="*" required/>Multiply
        </p>
        
        <p>
            <input type="submit" name="btnSend" value="Calculate" />
        </p>
        </form>
        <a href="../ejemplo5/index.jsp">Go to the index.</a><br>
    </body>
</html>
