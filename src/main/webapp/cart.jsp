<%-- 
    Document   : cart
    Created on : 16 Aug 2022, 18:41:35
    Author     : oladimeji
--%>

<%@page import="com.ecommerce.dao.ProductDao"%>
<%@page import="java.util.*"%>
<%@page import="com.ecommerce.loginpack.model.Cart"%>
<%@page import="com.ecommerce.loginpack.model.UserModelClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ecommerce.connection.DbConnection"%>
<%
    UserModelClass auth = (UserModelClass) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if (cart_list != null) {
        ProductDao pDao = new ProductDao(DbConnection.getConnection());
        cartProduct = pDao.getCartProducts(cart_list);
        double total = pDao.getTotalCartPrice(cart_list);
        request.setAttribute("cart_list", cart_list);
        request.setAttribute("total", total);

    }

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"> 
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
        <style type="text/css">
            .table tbody td{
                vertical-align: middle;
            }

            .btn-incre, .btn-decre{
                box-shadow: none;
                font-size:20px;
                border-style: hidden;

            }

        </style>    
    </head>
    <body>
        <ul>
            <li><a href="index.jsp"><i class="fa fa-fw fa-home"></i>Home</a></li>
            <li><a href="login.jsp"><i class="fa fa-fw fa-user"></i>Log-in</a></li>
            <li><a href="register.jsp"><i class="fa-solid fa-user-plus"></i>Sign-up</a></li>
            <li><a href="cart.jsp"><i class="fa-solid fa-cart-arrow-down"></i>Cart<span class="badge bg-danger px-2">${cart_list.size()}</span></a></li>
        </ul>

        <div class="container">
            <div class="d-flex py-3">
                <h3>Total Price: £ ${(total>0)?total:0 }
                </h3>
                <a class ="mx-3 btn btn-success" href="checkout.jsp">Check Out</a>
            </div>
            <table class="table table-light">
                <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Category</th>
                        <th scope="col">Price</th>
                        <th scope="col">Buy Now</th>
                        <th scope="col">Cancel</th>
                    </tr>
                </thead>

                <tbody>
                    <%                        if (cart_list != null) {
                            for (Cart c : cartProduct) {%>
                    <tr>
                        <td><%= c.getName()%></td>
                        <td><%= c.getCategory()%></td>
                        <td><%= c.getPrice()%></td>
                        <td> 
                            <form action="order-now" method="post" class="form-inline">
                                <input type="hidden" name="id" value="<%= c.getProductid()%>" class="form-input">
                                <div class="input-group d-flex justify-content-between">
                                    <a class="btn btn-sm btn-decre" href="quan-incre-dec?action=decre&id=<%= c.getProductid()%>"><i class="fas fa-minus-square"></i></a>
                                    <input type="text" name="quantity" class="form-control" value="<%= c.getQuantity()%>" readonly>
                                    <a class="btn btn-sm btn-incre" href="quan-incre-dec?action=incre&id=<%= c.getProductid()%>"><i class="fas fa-plus-square"></i></a>

                                </div>
                                    <button type="submit" class="btn btn-success btn-sm">Buy</button>
                            </form>
                        </td>
                        <td><a class="btn btn-danger" href="remove-item?id=<%= c.getProductid()%>">Remove</a></td>
                    </tr>

                    <% }
                  }    
                    
                    %>

                </tbody>

            </table>
        </div>
    </body>
</html>
