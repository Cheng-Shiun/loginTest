<%-- 
    Document   : ShoppingCartList
    Created on : 2023年12月22日, 上午9:55:34
    Author     : student
--%>

<%@page import="com.mycompany.logintest.CartItem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <style>
            table {
              border-collapse: collapse;
              width: 75%;
            }
            th, td {
              padding: 8px;
              text-align: left;
              border-bottom: 1px solid #ddd;
            }
            tr:hover {
                background-color:#f5f5ff;
            }
        </style>
    </head>
    <%!
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        String productLine = null;  //宣告要查找的產品種類為空
        ArrayList<CartItem> shoppingCart = null;
    %>
    <%
        ArrayList<CartItem> cart = null;               //宣告一個空的購物車物件，初值為空
        cart = (ArrayList) session.getAttribute("cart");   //建立一個空的購物車
        shoppingCart = (ArrayList) session.getAttribute("cart");
        
        String sql = "Delect from classicmodels.products where productCode = '";
        
    %>
    <body>
        <h1>我的購物車</h1>
        <%
            if(cart != null && cart.size() > 0){ %>  <!-- 如果購物車不是空的且有商品 -->
            <table>
                <tr>
                    <th>產品編號</th>
                    <th>產品名稱</th>
                    <th>訂購數量</th>
                </tr>
                <%
                    for(CartItem citem : cart){ %>
                    <tr>
                        <td><%= citem.getProductCode() %></td>
                        <td><%= citem.getProductName() %></td>
                        <td><%= citem.getQty() %></td>
                        <td><a onclick="cancelItem()">取消</td>
                    </tr>
                     <% } %>
           </table>
        <% } else { %>
            <h2> 您尚未有任何商品放入購物車 </h2>
        <% } %>

        <button onclick="location.href='CheckOut.jsp'">結帳</button>
    </body>
    <script>
        function cancelItem(){
            shoppingCart.remove(citem);
        }
    </script>
</html>
