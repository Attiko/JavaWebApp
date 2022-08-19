<%-- 
    Document   : login
    Created on : 14 Aug 2022, 01:47:18
    Author     : oladimeji
--%>

<%@page import="com.ecommerce.connection.DbConnection"%>
<%@page import="com.ecommerce.dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="login.jsp">Log-in</a></li>
        <li><a href="register.jsp">Sign-up</a></li>
        <li><a href="#cart">Cart</a></li>
        </ul>
        
        <div class="signup-header">
	 	<h2>Login</h2>
	</div>

	 <form method="post" action="user-login">
	 
	 <input type="hidden" name="page" value="login-form">
	 
	 	<!-- Validations errors -->
	 	<font color="#F24638"><c:out value="${msg }"></c:out></font>
	 
	 	<div class="signup-group">
	 		<label>Username</label>
	 		<input type="text" name="lusername" placeholder="Your Username">
	 	</div>
	 	<div class="signup-group">
	 		<label>Password</label>
	 		<input type="password" name="lpassword" placeholder="Enter password">
	 	</div>
	 	<div class="signup-group">
	 		<button type="submit" name="login" class="signup-btn">Log in</button>
	 	</div>
	 	<p>
	 		New to Computer For You? <a href="register.jsp" style="color:#F24638;">Create Account</a>
	 	</p>
	 </form>
    </body>
</html>
