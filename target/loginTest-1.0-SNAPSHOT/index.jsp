<%-- 
    Document   : index.jsp
    Created on : 2023年12月15日, 下午3:25:09
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            a {
                display: block;
                background: green;
                color:white;
            }
            span {
                color:red;
                font-weight: 900;
            }
            div {
                border: 2px solid brown;
                margin: 10px;
                padding: 10px 20px;
            }
        </style>
    </head>
    <body>
        <h1>首頁</h1>
        <a style="text-decoration: none" href="login.jsp">會員登入</a>
        
        <h3>request Header 介紹：</h3>
        <div>
            <!--因為requestHeader是Key-Value，需使用.getHeader(Key)來取得值-->
            <p><span>瀏覽器版本:</span><%= request.getHeader("User-Agent")%></p>
            <p><span>瀏覽器語系:</span><%= request.getHeader("Accept-Language")%></p>
        </div>
        <h3>連線議題查詢：</h3>
        <div>
        <!--其他連線議題查詢-->
            <p><span>使用者IP:</span><%= request.getRemoteAddr()%></p>
            <p><span>Tomcat IP:</span><%= request.getLocalAddr()%></p>
            <p><span>瀏覽者瀏覽路徑:</span><%= request.getRequestURI()%></p>
            <p><span>瀏覽者瀏覽網址:</span><%= request.getRequestURL()%></p>
        </div>
    </body>
</html>
