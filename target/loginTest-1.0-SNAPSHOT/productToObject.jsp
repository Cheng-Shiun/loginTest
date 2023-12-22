<%-- 
    Document   : productList
    Created on : 2023年12月20日, 下午3:42:27
    Author     : student
--%>

<%@page import="com.mycompany.logintest.ProductModel"%>
<%@page import="java.util.ArrayList"%>
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
        ArrayList<ProductModel> rows = new ArrayList(); //宣告陣列清單，存放型態為Class類別
    %>
    <%

        String sql = "Select * from classicmodels.products where productLine = '"; 
        
        //建立資料庫連線
        DBcongenerator dbg = new DBcongenerator();
        con = dbg.getConnection();
        //建立Statement物件，並將記憶體位址指向給stmt物件
        stmt = con.createStatement();
        try {
            //執行查詢語法並給rs物件來接收回傳值
            rs = stmt.executeQuery("select productCode, productName, productScale, quantityInStock from classicmodels.products");
  
            while(rs.next()) {
                //利用java Class建立物件:用來存放資料庫的資料 -> 此種作法為ORM
                ProductModel pml = new ProductModel();
                pml.productCode = rs.getString("productCode");
                pml.productName = rs.getString("productName");
                pml.productScale = rs.getString("productScale");
                pml.qty = rs.getInt("quantityInStock");
                rows.add(pml);  //如果有資料則新增至ArrayList
            }
            rs.close();
            stmt.close();
            con.close();
        }catch(Exception e){
        }

    %>
    <body>
        <h1>商品列表</h1>
        <h3>查詢類型: <%= productLine %> </h3>
        <table>
            <tr>
              <th>商品編號</th>
              <th>商品名稱</th>
              <th>模型比例</th>
              <th>庫存數量</th>
              <th>購物車</th>
            </tr>
        <%
            for(ProductModel row : rows){ %>
            <tr>
                <td><%= row.productCode %></td>
                <td><%= row.productName %></td>
                <td><%= row.productScale %></td>
                <td><%= row.qty %></td>
                <td><a href="<%= row.productCode %>">加入購物</a> </td>
            </tr>
            <%}%>  
      </table>
        目前共有 <%= rows.size()%> 筆模型資料
    </body>
</html>
