<%-- 
    Document   : checkpass
    Created on : 2023年12月15日, 上午9:50:04
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%!
        //第一種:使用文字宣告作為預設密碼
        String[] users = {"user01", "user02", "user03"};
        String[] pass = {"123", "456", "789"};
        //第二種:使用Dictionary字典 Key -> Value (user01 -> 123)
        HashMap<String, String> userMap = new HashMap<>();
        HttpSession mySession;
        //宣告第一種方法查找帳號密碼
        public boolean checkArray(String u, String p){
            for(int i =0; i < users.length; i++){
                //如果有該使用者帳號 -> 檢查密碼是否相同
                if(users[i].equals(u)){
                    if(pass[i].equals(p)){
                        return true;
                    }
                    else{
                        return false;  //帳號正確但密碼錯誤
                    }
                }
             
            }
            return false;    //跳出loop -> 沒找到該使用者
        }
        public boolean checkMap(String u, String p){
            //如果在Map物件中有找到key值(帳號)
            if(userMap.containsKey(u)){
                //在Map物件中取出該key值的value(密碼)，內容是否等於輸入的密碼
                if(userMap.get(u).equals(p)){
                    return true;
                }
            }
            return false;
        }
    %>
    <%
        userMap.put("user01", "123");
        userMap.put("user02", "456");
        userMap.put("user03", "789");
        userMap.put("kevin@gmail.com", "111");
        userMap.put("david", "0975-123456");
        userMap.put("google", "http://www.google.com.tw");
        
       String user = request.getParameter("username");
       String pass = request.getParameter("passwd");
       //判斷是否異常 (輸入帳密為空值)
       if(user == null || pass == null){
            //重新登入(導回登入頁)
            response.sendRedirect("/loginTest/login.jsp");
       }
       //檢查輸入帳密是否正確
       if(checkArray(user, pass)){
            //設定兩個特徵給mySession (session物件)
            /*先將Tomcat存放使用者輸入內容(特徵) -> 用request物件.getSession方法取得 
            並指向給mySession物件*/ 
            mySession = request.getSession();
            //設定username(key) user帳號(value)
            mySession.setAttribute("username", user);
            //設定isLogin(key) value值為true
            mySession.setAttribute("isLogin", true);
            response.sendRedirect("/loginTest/member/page1.jsp");
       }
       else{
            response.sendRedirect("/loginTest/login.jsp");
       }
    %>
    <body>
        <h1>Hello World!</h1>
        
    </body>
</html>
