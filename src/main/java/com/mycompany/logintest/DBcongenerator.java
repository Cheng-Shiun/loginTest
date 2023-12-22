/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.logintest;
import java.sql.*;

/**
 *
 * @author student
 */
public class DBcongenerator {
    //宣告成員變數(屬性)
    String username = "root";
    String passwd = "12345";
    String curl = "jdbc:mariadb://127.0.0.1/classicmodels";
    public DBcongenerator(){
        try{
            Class.forName("org.mariadb.jdbc.Driver");
        }
        catch(Exception e){
        }
    }
    public Connection getConnection(){
        Connection c;
        try{
            c = DriverManager.getConnection(curl, username, passwd);
            return c;
        }
        catch(Exception e){
            return null;
        }
    }
}
