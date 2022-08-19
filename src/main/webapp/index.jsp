<%-- 
    Document   : index
    Created on : 13 Aug 2022, 23:19:17
    Author     : oladimeji
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.ecommerce.loginpack.model.Cart"%>
<%@page import="com.ecommerce.loginpack.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.dao.ProductDao"%>
<%@page import="com.ecommerce.loginpack.model.UserModelClass"%>
<%@page import="com.ecommerce.connection.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    UserModelClass auth = (UserModelClass) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);
    }

    ProductDao pd = new ProductDao(DbConnection.getConnection());
    List<Product> products = pd.getAllProducts();
    
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

if(cart_list !=null){
    request.setAttribute("cart_list", cart_list);

    }
%>





<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <!-- CSS only -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"> 
        <link rel="stylesheet" type="text/css" href="style.css"> 
    </head>
    <body>
        <ul>
            <li><a href="#home">Home</a></li>
            <li><a href="login.jsp">Log-in</a></li>
            <li><a href="register.jsp">Sign-up</a></li>
            <li><a href="cart.jsp">Cart<span class="badge bg-danger px-2">${cart_list.size()}</span></a></li>
        </ul>

        <div class="container">
            <div class="card-header">All Products</div>
            <div class="row">

                <%
                    if (!products.isEmpty()) {
                        for (Product p : products) {%>
                <div class="col -sm-6 my-3">
                    <div class="card" style="width: 20rem;">
                        <img class ="card-img-top" src="product-images/<%= p.getImage()%>" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"><%= p.getName()%></h5>
                            <h6 class="price">Price: £<%=p.getPrice()%></h6><!-- comment -->
                            <h6 class="category">Category: <%= p.getCategory()%></h6>
                            <div class="mt-3 d-flex justify-content-between"> 
                                <a href="add-to-cart?id=<%= p.getProductid()%>" class="btn btn-primary">Add To Cart</a>
                                <a href="#" class="btn btn-primary">Buy Now</a>

                            </div>

                        </div>
                    </div>



                    <%}
                        }


                    %>


                </div>

            </div>
        </div>





        <%--<% out.print(DbConnection.getConnection()); %> --%>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js"></script>
    </body>
</html>



