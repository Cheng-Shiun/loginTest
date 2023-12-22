<%-- 
    Document   : productList
    Created on : 2023年12月20日, 下午3:42:27
    Author     : student
--%>
<%@page import="com.mycompany.logintest.DBcongenerator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>商品列表</title>
        <style>
               table {
              font-family: arial, sans-serif;
              border-collapse: collapse;
              width: 100%;
            }

            td, th {
              border: 1px solid #dddddd;
              text-align: left;
              padding: 8px;
            }

            tr:nth-child(even) {
              background-color: #dddddd;
            }
            tr a {
                text-decoration: none;
                color: green;
            }
        </style>
    </head>
    <%--  
        1. 連結資料庫
        2. 取得連線
        3. 根據條件 建立 sql -->  select * from products where productLine  符合 classic cars , motorcycle, vintage cars .....
        4. 送出查詢 取得結果
        5. 安排迴圈顯示在 table 內
    --%>
    <%!
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        String productLine = null;  //宣告要查找的產品種類為空
        String shoppingUrl = "#";
    %>
    <%
        String v = request.getParameter("pl") ;
          int plType = 0;
          if( v == null ) {
            plType = 1;
          } 
          else{
            plType = Integer.parseInt(v);
          }

        String sql = "Select * from classicmodels.products where productLine = '"; 
        
        //建立資料庫連線
        DBcongenerator dbg = new DBcongenerator();
        con = dbg.getConnection();
        stmt = con.createStatement();
        
        switch(plType){
            case 1:
                productLine = "Classic Cars";
                sql = sql + productLine + "';";
                break;
            case 2:
                productLine = "Motorcycles";
                sql = sql + productLine + "';";
                break;
            case 3:
                productLine = "Vintage Cars";
                sql = sql + productLine + "';";
                break;
            case 4:
                productLine = "Planes";
                sql = sql + productLine + "';";
                break;
           case 5:
                productLine = "Trucks and Buses";
                sql = sql + productLine + "';";
                break;
            case 6:
                productLine = "Ships";
                sql = sql + productLine + "';";
                break;
             case 7:
                productLine = "Trains";
                sql = sql + productLine + "';";
                break;
        }
        try {
            rs = stmt.executeQuery(sql);
        }catch( Exception e) { 
        }
    
    %>
    <body>
        <a href="ShoppingCartList.jsp">查詢購物車</a>
        <a href="CheckOut.jsp">結帳</a>
        <h1>商品列表</h1>
        <h3>查詢類型: <%= request.getParameter("pl") %> </h3>
        <h3>查詢的商品為: <%= productLine%></h3>
        <table>
            <tr>
              <th>商品編號</th>
              <th>商品名稱</th>
              <th>模型比例</th>
              <th>庫存數量</th>
              <th>售價</th>
              <th>購物車</th>
            </tr>
        <%
        try{
            while(rs.next()) {
                shoppingUrl = "ToShoppingCart.jsp?pid=" + rs.getString("productCode") + "&pname=" + rs.getString("productName");
    
        %>
        <tr>
          <td><%= rs.getString("productCode") %></td>
          <td><%= rs.getString("productName") %></td>
          <td><%= rs.getString("productScale") %></td>
          <td><%= rs.getInt("quantityInStock") %></td>
          <td><%= rs.getBigDecimal("MSRP").toString() %></td>
          <td><a href="<%= shoppingUrl %>">加入購物</a> </td>
        </tr>
        <% 
            } 
        %>  
      </table>
        
        <%   
        }catch(SQLException e) {
            out.print("連線失敗:" + e.getMessage() + "<br>");
        }
        %>  
    </body>
</html>
