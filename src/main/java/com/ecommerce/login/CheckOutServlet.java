/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ecommerce.login;

import com.ecommerce.connection.DbConnection;
import com.ecommerce.dao.OrderDao;
import com.ecommerce.loginpack.model.*;
import com.ecommerce.loginpack.model.UserModelClass;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "CheckOutServlet", urlPatterns = {"/check-out"})
public class CheckOutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

            Date date = new Date();

            //retriving all cart products
            ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");

            //checking if user has logged in/User authentication
            UserModelClass auth = (UserModelClass) request.getSession().getAttribute("auth");
            
            //Checking if the user has logged in and if the cart is empty 
            if(cart_list !=null && auth != null){
                
                for(Cart c:cart_list){
                    //we prepare the order object
                    Order order= new Order();
                    order.setProductid(c.getProductid());
                    order.setUid(auth.getId());
                    order.setQuantity(c.getQuantity());
                    order.setDate(formatter.format(date));
                    
                    //instantiate the orderDao class
                    OrderDao oDao = new OrderDao(DbConnection.getConnection());
                    //calling the insert method
                    
                    boolean result = oDao.insertOrder(order);
                    if(!result) break;
                    
                    
                }
                cart_list.clear();
                response.sendRedirect("orders.jsp");
                
            }else{
                if(auth ==null) response.sendRedirect("login.jsp");
                response.sendRedirect("cart.jsp");
            }
            

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
