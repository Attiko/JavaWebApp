/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ecommerce.loginpack.model;

/**
 *
 * @author oladimeji
 */
public class UserModelClass {
    private int id;
    private String username;
    private String password;

    public UserModelClass() {
        
    }
    

    public UserModelClass(int id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "UserModelClass{" + "id=" + id + ", username=" + username + ", password=" + password + '}';
    }
    
    
    
}
