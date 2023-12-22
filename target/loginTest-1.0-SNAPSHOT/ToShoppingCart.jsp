<%-- 
    Document   : ToShoppingCart
    Created on : 2023年12月21日, 上午9:49:09
    Author     : student
--%>

<%@page import="com.mycompany.logintest.CartItem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.logintest.ProductModel"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%!
        ArrayList<CartItem> shoppingCart = null;  //宣告購物車物件，型別為CartItem 
        String pid = null, pname = null;
        Boolean isDuplicate = false;       //檢查是否重複
    %>
    <%
      //檢查使用者登入狀態
      String user = (String) session.getAttribute("username");
      
      //HttpSession productSession = request.getSession();
      //購物車的容器使用Map來存放 Key是商品id、Value是用Class裡的(品名、數量->用商品id來取資料用)存放
      //Map<String, ProductModel> shoppingCart = new HashMap<>(); //Class類別也是一種datatype
      shoppingCart = (ArrayList) session.getAttribute("cart");
      if(shoppingCart == null){
           //跟 mySession 要求購物車物件 如果沒有 -> 建立
           shoppingCart = new ArrayList();
           session.setAttribute("cart", shoppingCart);  //讓購物車可以隨著瀏覽器活著而活著
      }
      pid = request.getParameter("pid");
      pname = request.getParameter("pname");
      
      //檢查是否已經放在購物車內
      //如果沒有 -> 建立新的購物車後 把商品id、商品名、數量1放入
      if(shoppingCart.size() == 0){
           CartItem citem = new CartItem(pid, pname,1);
           shoppingCart.add(citem);
       }
       else{
            //檢查是否跟購物車內的商品id重複
            for(CartItem cti : shoppingCart){
                if(cti.getProductCode().equals(pid)){
                    cti.setQty(cti.getQty()+1);
                    isDuplicate = true;
                }
            }
            //檢查結果若沒有重複 ->新增項目
            if(!isDuplicate){
                CartItem citem = new CartItem(pid, pname,1);
                shoppingCart.add(citem);
                isDuplicate = false;
            }
        }
    %>

    <body>
        <h1>購物清單</h1>
        <h2>您目前共有 <%= shoppingCart.size() %>筆產品在購物車內</h2>
        <%
            if(user == null){ %>
                <h3 style="color: red"> 提醒您 你目前尚未登入></h3>
            <%}%>
        %>
        您所購物的商品編號：<%= pid %><br>
        商品名稱：<%= pname %><br>
        
    </body>
</html>
