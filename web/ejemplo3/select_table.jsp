<%-- 
    Document   : select_table
    Created on : Sep 6, 2024, 11:26:51 AM
    Author     : mihaitamatei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Java Server Page </title>
        <style>
            h1{
                color: red;
                font-family: Courier New;
                font-size: 16px;
            }
            div{
                text-align: center;
            }
            .search{
                text-align: center;
                width: 115px;
                background-color: grey;
                color: white;
            }
            .accept{
                text-align: center;
                width: 55px;
            }
            .salida{
                font-family: Courier New;
                font-size: 13px;
                border-radius: 30px;
                text-align: grey;
                background-color: grey;
                color: white;
                width: 25px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div style="center">
            <h1>Select Multiply Table</h1>
            <%-- Java Component --%>
            <%
                //Entry
                String n = "";
                boolean flag = false;
                //Action
                if (request.getParameter("btnAccept") != null) {
                    int num = Integer.parseInt(request.getParameter("txtN"));
                    if (num >= 2 && num <= 12) {
                        n = num + "";
                        flag = true;
                    }
                }
            %>
            <%-- HTML Component --%>
            <form>
                <!-- Entry -->
                <input class="search" type="text" name="txtN" value="<%=n%>" placeholder="Write number" />
                <!-- Action -->
                <input class="accept" type="submit" value="Accept" name="btnAccept" />
            </form><br>

            <%
                if (flag == true) {
                    for (int j = 1; j <= 12; j++) {
            %>
            <%--
            <%=n%> x <%=j%> = <%=Integer.parseInt(n) * j%><br>
            --%>

            <input class="salida" type="text" value="<%=n%>" readonly />
            <input class="salida" type="text" value="*" readonly />
            <input class="salida" type="text" value="<%=j%>" readonly />
            <input class="salida" type="text" value="=" readonly />
            <input class="salida" type="text" value="<%=Integer.parseInt(n) * j%>" readonly /><br>
            <%
                    }
                }
            %>


        </div>
    </body>
</html>
