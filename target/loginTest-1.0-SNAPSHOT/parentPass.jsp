<%-- 
    Document   : parentPass
    Created on : 2023年12月20日, 下午1:32:03
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>登入成功頁面</h1>
        <h3>這裡會顯示CheckLogin2傳來的資料 <span style="color: red"><%= request.getParameter("msg")%></span></h3>
    </body>
</html>
