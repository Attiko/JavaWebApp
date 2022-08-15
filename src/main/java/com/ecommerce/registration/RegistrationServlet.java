/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ecommerce.registration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author oladimeji
 */
@WebServlet(name = "RegistrationServlet", urlPatterns = {"/register"})
public class RegistrationServlet extends HttpServlet {
    

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String yname = request.getParameter("name");
        String yemail = request.getParameter("email");
        String uname = request.getParameter("username");
        String addy = request.getParameter("address");
        String pass = request.getParameter("passwordd");
        RequestDispatcher dispatcher = null;
        
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","rootroot" );
            PreparedStatement pst = con.prepareStatement("insert into register(name,email,username,address,password) values(?,?,?,?,?) ");
            
            pst.setString(1, yname);
            pst.setString(2, yemail);
            pst.setString(3, uname);
            pst.setString(4, addy);
            pst.setString(5, pass);
            
            int rowCount = pst.executeUpdate();
            dispatcher = request.getRequestDispatcher("register.jsp");
            if (rowCount > 0){
               request.setAttribute("status", "sucess");
               response.sendRedirect("login.jsp");
             
            } else{
            request.setAttribute("status","failed");
            }
            
            dispatcher.forward(request, response);
        } catch (Exception e){
            e.printStackTrace();
            
    }
        /*finally{
            try{
                con.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }*/
        
        
        
    
     
        
        
        




        
    }
    

    

    
    
}
