<%-- 
    Document   : page1
    Created on : 2023年12月15日, 上午9:23:22
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
        String memberName;
    %>
    <%
        //檢查是否有特徵(存放在Session) 若有欠缺 -> 跳轉到login重新登入
        mySession = request.getSession();
        if(mySession.getAttribute("username") == null){
            //response.sendRedirect("/loginTest/login.jsp");
            //如果將登入會員網址貼到別的瀏覽器 -> 因無特徵所以先導入到告知nologin頁面
            response.sendRedirect("nologin.html");
        }
        else{
            /*
            若有特徵 -> 則將存放session中的帳號名稱取出指向給member物件，
            因為session物件是屬於 Map<>類別，不屬於String類別，因此要.toString()轉換
            */
            memberName = mySession.getAttribute("username").toString();
        }
    %>
    <body>
        <h1><%= memberName %></h1>
        <p>您好!歡迎您登入</p>
        <p>session ID= <%= mySession.getId() %></p>
    </body>
</html>
