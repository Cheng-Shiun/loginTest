<%-- 
    Document   : login
    Created on : 2023年12月15日, 上午9:20:46
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%!
        HttpSession mySession;
    %>
    <%
        mySession = request.getSession();
    %>
    <body>
        <form method="post" action="CheckLogin2">
            帳號：<input type="text" name="username" value="" /><br>
            密碼：<input type="password" name="passwd" value="" /><br>
            <input type="submit" value="登入" />
            <input type="reset" value="清除" />
        </form>
        <p>session ID= <%= mySession.getId() %></p>
        <p><span>瀏覽者瀏覽網址:</span><%= request.getRequestURL()%></p>
    </body>
</html>
