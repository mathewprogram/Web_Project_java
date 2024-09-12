<%-- 
    Document   : tabla_multiplicar
    Created on : Sep 6, 2024, 9:40:03 AM
    Author     : mihaitamatei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Java Server Page Page</title>
        <link rel="stylesheet" href="styles.css" />
        <!--<style>
            You could write the styles here or in the file with the styles.
        </style>
        -->
    </head>
    <body>    
        <div>
            <h1>Multiply table with Java Server Page</h1><br>
            <table border="1" cellspacing="5" cellpadding="5" >
                <tbody>
                    <%
                        for (int i = 2; i <= 12; i++) {
                            for (int j = 1; j <= 12; j++) {
                    %>

                <input type="text" value="<%=i%>" readonly />
                <input type="text" value="X" readonly />
                <input type="text" value="<%=j%>" readonly />
                <input type="text" value="=" readonly />
                <input type="text" value="<%=i * j%>" readonly /><br>
                <%--
                <%=i + "X" + j + "=" + i* j%><br>
                
                <tr>
                    <td><%=i%></td>
                    <td>X</td>
                    <td><%=j%></td>
                    <td>=</td>
                    <td><%=i*j%></td>
                </tr>
                --%>
                <%
                        }
                    }
                %>    

                </tbody>
            </table>
        </div>                        
    </tbody>
</table>
</body>
</html>
