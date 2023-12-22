
package com.mycompany.logintest;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;


public class OrderProcess extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // 資料庫的前置作業 -> 建立連線
        DBcongenerator dbGen = new DBcongenerator();
        Connection con = dbGen.getConnection();
        Statement stmt;   //宣告語法物件
        String sql;
        
        //宣告物件來接收 買家所填寫的購物表單"欄位"資訊
        String recipient = request.getParameter("recipient");
        String address = request.getParameter("address");
        String payment = request.getParameter("payment");
        String shipping = request.getParameter("shipping");    //寄送方式還沒寫
        
        //取出買家的購物清單
        HttpSession session = request.getSession();   //Servlet 要自行取得session
        ArrayList<CartItem> cart = (ArrayList) session.getAttribute("cart");
        String member = (String) session.getAttribute("username");
        if(member == null){
            member = "快速出貨會員";
        }
        
        //新增"購物紀錄"至資料庫的order_item資料表中
        try{
            stmt = con.createStatement();
            for(CartItem ci : cart ) {
            sql = "INSERT INTO webdb.order_item(member, pcode, qty, recipient, addr, payment, shipping)" + 
                    "VALUES('" + member + "','"+ ci.getProductCode() + "'," + ci.getQty() + ",'" +
                    recipient + "','" + address + "','" + payment + "','" + shipping +"');";
            System.out.println("SQL:  " + sql);
            stmt.execute(sql);
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
