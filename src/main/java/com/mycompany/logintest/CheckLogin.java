package com.mycompany.logintest;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author student
 */
public class CheckLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        java.sql.Connection c;
        java.sql.Statement stmt;
        java.sql.ResultSet rs;
        String username, passwd, sql;
        Boolean loginResult = false;    //設定登入狀態預設為false
        
        //將使用者輸入帳密分別指向給變數 username與passwd
        username = request.getParameter("username");
        passwd = request.getParameter("passwd");
        sql = "SELECT * FROM user WHERE NAME = '" + username + "'AND passwd = '" + passwd + "';";
        try{
            //載入jdbc資料庫驅動程式
            Class.forName("org.mariadb.jdbc.Driver");
            System.out.println("系統成功載入 jdbc 驅動程式");
            
            //建立連線
             c = java.sql.DriverManager.getConnection("jdbc:mariadb://127.0.0.1/webdb", "root", "12345");
            System.out.println("連線成功");
            
            //建立SQL對應的Statement語法物件stmt
            stmt = c.createStatement();
            
            //執行查詢語法
            rs = stmt.executeQuery(sql);
            
            //輸出結果
            if(rs.next()){
                loginResult = true;
            }
//                while(rs.next()){
//                    System.out.println("姓名：" + rs.getString("name") + "<br>");
//                    out.print("信箱：" + rs.getString(3) + "<br>");    //起始的index為1
//                    out.print("<hr>");
//                }
            }
            catch(Exception e){
//                out.print("連線失敗" + e.getMessage());
            }
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckLogin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>CheckLogin 會員登入結果</h1>");
            out.println("<h3>sql語法:" + sql + "</h3>" );
            out.println("<hr>");
            if(loginResult){
                out.println("<h3>您已登入成功</h3>");
            }
            else{
                out.println("<h3>登入失敗</h3>");
            }
            out.println("<h1>Servlet CheckLogin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
