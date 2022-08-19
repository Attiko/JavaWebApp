/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ecommerce.dao;

import com.ecommerce.loginpack.model.UserModelClass;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author oladimeji
 */
public class UserDao {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
     public UserDao(Connection con){
         this.con = con;
     
     }
     
     public UserModelClass userLogin(String username, String password){
         UserModelClass user = null;
         try{
             query = "select * from users where username=? and password=?";
             pst = this.con.prepareStatement(query);
             pst.setString(1, username);
             pst.setString(2, password);
             rs = pst.executeQuery();
             
             if(rs.next()){
                 user = new UserModelClass();
                 user.setId(rs.getInt("userid"));
                 user.setUsername(rs.getString("username"));
             
             }
         }catch(Exception e){
             e.printStackTrace();
             System.out.print(e.getMessage());
         
         }
         return user;
     
     }
    
}
