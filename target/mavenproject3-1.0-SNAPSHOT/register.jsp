<%-- 
    Document   : register
    Created on : 14 Aug 2022, 01:47:41
    Author     : oladimeji
--%>

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
        
        <h2>Sign-up</h2>

        <form method="post" action="register">
	 
	 <input type="hidden" name="page" value="sign-up-form">
	 
	 	<!-- Validations errors -->
	 	<font color="#F24638"><c:out value="${msg }"></c:out></font>
	 	
	 	
	 	<div class="signup-group">
	 		<label>Name</label>
	 		<input type="text" name="name" placeholder="Name goes here"/>
	 	</div>
	 	<div class="signup-group">
	 		<label>Email</label>
	 		<input type="email" name="email" placeholder="Your email address"il }"/>
	 	</div>
	 	<div class="signup-group">
	 		<label>Username</label>
	 		<input type="text" name="username" placeholder="Username"/>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Address</label>
	 		<input type="text" name="address" placeholder="your address goes here"/>
	 	</div>
	 	<div class="signup-group">
	 		<label>Password</label>
	 		<input type="password" name="passwordd" placeholder="Enter password" required>
	 	</div>
                <--<!-- <div class="signup-group">
	 		<label>Confirm Password</label>
	 		<input type="password" name="password_2" placeholder="Re-enter password" required>
	 	</div> -->
	 	
	 	<div class="signup-group">
	 		<button type="submit" name="register" class="signup-btn">Register</button>
	 	</div>
	 	<p>
	 		Already have an account? <a href="Controller?page=login" style="color:#F24638;">Login!</a>
	 	</p>
	 </form>
    </body>
</html>
