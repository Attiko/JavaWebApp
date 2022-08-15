/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ecommerce.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbConnection {

    
    public static Connection connection;
    
    public static Connection getConnection(){
    
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3368/ecommerce", "root","root");
        
        }catch(Exception e){
            e.printStackTrace();
        
        }
        return (connection);
    }
    
    public static void CloseConnection(){
        if(connection !=null){
            try{
                connection.close();
                connection =null;
            }catch(SQLException ex){
                ex.printStackTrace();
            }
        }   
    }
    
    public static ResultSet getResultFromSqlQuery(String SqlQueryString){
        
        ResultSet rs = null;
        try{
            if (connection == null){
                getConnection();
            }
            
            rs = connection.createStatement().executeQuery(SqlQueryString);
        
        }catch(Exception ex){
            ex.printStackTrace();
        
        }
        return rs;
    }
    
    public static int insertUpdateFromSqlQuery(String SqlQueryString){
        int i = 2;
        try{
            if(connection ==null){
                getConnection();
            }
            
            i = connection.createStatement().executeUpdate(SqlQueryString);
        }catch(Exception ex){
            ex.printStackTrace();
        
        }
        return i;
        
    
    }
}
