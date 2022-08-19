/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ecommerce.login;

import com.ecommerce.loginpack.model.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author oladimeji
 */
@WebServlet(name = "QIncreDerServlet", urlPatterns = {"/quan-incre-dec"})
public class QIncreDerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try(PrintWriter out = response.getWriter();){
            String action = request.getParameter("action");
            int id = Integer.parseInt(request.getParameter("id"));
            
           ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
           //condition for increasing the quantity
           if(action != null && id>=1){
               if(action.equals("incre")){
                   for(Cart c:cart_list){
                       if(c.getProductid()==id){
                           int quantity = c.getQuantity();
                           quantity++;
                           c.setQuantity(quantity);
                           response.sendRedirect("cart.jsp");
                       }
                   }
               }
               //condition for decreasing the quantity
               if(action.equals("decre")){
                   for(Cart c:cart_list){ 
//                                            this prevent it from displaying -1 after hitting zero
                       if(c.getProductid()==id && c.getQuantity() >1){
                           int quantity = c.getQuantity();
                           quantity--;
                           c.setQuantity(quantity);
                           break;
                       }
                   }
                   response.sendRedirect("cart.jsp");
               }
               
           }else{
               response.sendRedirect("cart.jsp");
           }
        }
    
    
    }
    

}
