<%-- 
    Document   : productQuery
    Created on : 2023年12月20日, 下午3:42:09
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        .acontain {
            display: flex;
            flex-direction: column;
            width: 200px;
        }
    </style>
    <body>
        <h1>巨匠模型專賣店</h1>
        <hr/>
        <h3>請選擇模型種類</h3>
        <div class="acontain">
            <a href="productList.jsp?pl=1">Classic Cars經典汽車模型</a>
            <a href="productList.jsp?pl=2">Motorcycle 重機模型</a>
            <a href="productList.jsp?pl=3">Vintage Cars 老爺車</a>
            <a href="productList.jsp?pl=4">Planes 飛機</a>
            <a href="productList.jsp?pl=5">Trucks and Buses 卡車巴士</a>
            <a href="productList.jsp?pl=6">Ships 船</a>
        </div>
        <div>
            <select>
                <option>請選擇商品</option>
                <option>Classic 經典汽車模型</option>
                <option>Motorcycle 重機模型</option>
                <option>Trucks and Buses 卡車</option>
                <option>Vintage Cars 老爺車</option>
                <option>Planes 飛機</option>
                <option>Ships 船</option>
            </select>
        </div>
    </body>
</html>
