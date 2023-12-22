<%-- 
    Document   : CheckOut
    Created on : 2023年12月22日, 上午11:27:15
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            input[type=text], select {
              width: 100%;
              padding: 12px 20px;
              margin: 8px 0;
              display: inline-block;
              border: 1px solid #ccc;
              border-radius: 4px;
              box-sizing: border-box;
            }

            input[type=submit] {
              width: 100%;
              background-color: #4CAF50;
              color: white;
              padding: 14px 20px;
              margin: 8px 0;
              border: none;
              border-radius: 4px;
              cursor: pointer;
            }

            input[type=submit]:hover {
              background-color: #45a049;
            }

            div {
              border-radius: 5px;
              background-color: #f2f2f2;
              padding: 20px;
            }
        </style>
    </head>
    
    <%
        Boolean notLogin = false;
        String member = null;   //檢查是否登入
        if(session.getAttribute("username") == null){     //若未登入 -> 轉到登入頁面
            member = "尚未登入";
            notLogin = true; 
        }
        else{
            member = session.getAttribute("username").toString();
        }
    %>
    <body>
        <h3>結帳頁面</h3>
        <h5><%= member %></h5>
        <div id="loginRemind"></div>
        <div>
            <form action="OrderProcess">
                <label for="recipient">收件人</label>
                <input type="text" id="recipient" name="recipient" placeholder="Your name..">
                <label for="address">您的收件地址</label>
                <input type="text" id="address" name="address" placeholder="Your address..">
                <label for="shipping">取貨方式</label>
                <select id="shipping" name="shipping">請選擇取貨方式
                  <option value="homeAddress">宅配</option>
                  <option value="convenientStore">便利超商</option>
                  <option value="post">郵局</option>
                </select>
                <label for="payment">付款方式</label>
                <select id="payment" name="payment">請選擇付款方式
                  <option value="creditCard">信用卡</option>
                  <option value="cash">現金</option>
                  <option value="transfer">銀行帳戶轉帳</option>
                </select>
                <input type="submit" value="Submit">
            </form>
        </div>
    </body>
    <% if( notLogin ) { %>  <!--把javascript包進程式，可讓瀏覽器讀完執行-->
    <script>
        //進行三秒倒數 時間到 -> 跳轉到登入頁面
        var countdown = 3;
        var c1 = window.setInterval(goToLogin, 1000);
        function goToLogin() {            
            document.getElementById('loginRemind').innerHTML = "系統即將轉送到登入頁面,請稍後" + countdown;
            
            if( countdown-- == 0 ) {
                window.clearInterval(c1);
                location.href = 'login.jsp';   
            }   
        }
    </script>
    <% } %>
</html>
