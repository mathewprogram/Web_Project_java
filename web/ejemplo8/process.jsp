<%-- 
    Document   : process
    Created on : Sep 10, 2024, 11:52:52 AM
    Author     : mihaitamatei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Process</title>
    </head>
    <body>
        <h1>Result of the Calculation</h1>
        <%
            String operation = request.getParameter("operation");
            double num1 = Double.parseDouble(request.getParameter("num1"));
            double num2 = Double.parseDouble(request.getParameter("num2"));
            double result = 0;
            
            switch(operation) {
                case "-":
                    result = num1 - num2;
                    break;
                case "+":
                    result = num1 + num2;
                    break;
                case "/":
                    if (num2 != 0){
                    result = num1 / num2;
                    } else{
                    out.println("Cannot divide by zero.");
                    }
                    break;
                case "*":
                    result = num1 * num2;
                    break;
                default:
                    out.println("Invalid operation selected.");
            }
         %>   
         <p>First number: <%=num1%></p>   
         <p>Second number: <%=num2%></p>   
         <p>Operation: <%=operation%></p>   
         <p>Result: <%=result%></p>   
         
       <br><br><a href="calculator.jsp">Go back to the calculator</a><br>     
    </body>
</html>
