<%-- 
    Document   : index.jsp
    Created on : 2023年12月15日, 下午3:25:09
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

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
    <%
        Connection c;
        Statement stmt;
        ResultSet rs;
        String sql = "select * from user;";
        try{
            Class.forName("org.mariadb.jdbc.Driver");
            out.println("系統成功載入 jdbc 驅動程式");
            
            //建立連線
             c = DriverManager.getConnection("jdbc:mariadb://127.0.0.1/webdb", "root", "12345");
            out.print("連線成功" + "<br>");
            
            //建立SQL對應的Statement語法物件stmt
            stmt = c.createStatement();
            
            //執行查詢語法
            rs = stmt.executeQuery(sql);
            
            //輸出結果
            while(rs.next()){
                out.print("姓名：" + rs.getString("name") + "<br>");
                out.print("信箱：" + rs.getString(3) + "<br>");    //起始的index為1
                out.print("<hr>");
            }
        }
        catch(Exception e){
            out.print("連線失敗" + e.getMessage());
        }
    %>
    <body>
        <h1>首頁</h1>
        <a style="text-decoration: none" href="login.jsp">會員登入</a>
        <a style="text-decoration: none" href="productQuery.jsp">模型商品</a>
        
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
