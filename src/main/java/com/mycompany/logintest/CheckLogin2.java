/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.logintest;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author student
 */
public class CheckLogin2 extends HttpServlet {
    
    Connection dbcon;
    DBcongenerator dbGen;
    Statement stmt;
    ResultSet rs;
    String username, passwd, sql;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        dbGen = new DBcongenerator();
        dbcon = dbGen.getConnection();
        username = request.getParameter("username");
        passwd = request.getParameter("passwd");
        sql = "SELECT * FROM user WHERE NAME = '" + username + "'AND passwd = '" + passwd + "';";
        String message = "這是 LoginCheck2給的資料";
        try{
             //建立SQL對應的Statement語法物件stmt
            stmt = dbcon.createStatement();
            
            //執行查詢語法
            rs = stmt.executeQuery(sql);
            
            //輸出結果
            if(rs.next()){
                //轉換頁面 -> 使用RequestDispatcher類別去調度請求頁面 (方法1:模擬瀏覽器網址GET)
                //若頁面之間傳遞文字為非英文或特殊字元，必須預先編碼轉換為UTF-8才可傳送，否則會出現encode錯誤
                System.out.println("編碼後的內容:" + java.net.URLEncoder.encode(message , "UTF-8"));
                RequestDispatcher disp = request.getRequestDispatcher("parentPass.jsp?msg=" + java.net.URLEncoder.encode(message, "UTF-8"));
                disp.forward(request, response);
            }
            else{
                //轉換登入失敗頁面(方法2:使用request 屬性(較簡單))
                System.out.println("透過request夾參數setAttribute");
                request.setAttribute("errmsg", "請確認您的帳號密碼是否正確 或請洽本站管理員 admin@gmail.com");
                request.getRequestDispatcher("C.jsp").include(request, response);
   
            }
        }
        catch(Exception e){
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
