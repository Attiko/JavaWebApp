<%-- 
    Document   : orders
    Created on : 16 Aug 2022, 18:42:20
    Author     : oladimeji
--%>

<%@page import="com.ecommerce.loginpack.model.Order"%>
<%@page import="com.ecommerce.dao.OrderDao"%>
<%@page import="com.ecommerce.loginpack.model.UserModelClass"%>
<%@page import="com.ecommerce.connection.DbConnection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ecommerce.loginpack.model.Cart"%>
<%@page import="java.util.List"%>
<%

    UserModelClass auth = (UserModelClass) request.getSession().getAttribute("auth");
    List<Order> orders = null;
    if (auth != null) {
        request.setAttribute("auth", auth);
        orders = new OrderDao(DbConnection.getConnection()).userOrders(auth.getId());
        //order = orderDao.userOrders(auth.getId());
    } else {
        //response.sendRedirect("login.jsp");
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"> 
        <link rel="stylesheet" type="text/css" href="style.css"> 
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">

        <title>JSP Page</title>
    </head>
    <body>
        <ul>
            <li><a href="index.jsp"><i class="fa fa-fw fa-home"></i>Home</a></li>
            <li><a href="login.jsp"><i class="fa fa-fw fa-user"></i>Log-in</a></li>
            <li><a href="register.jsp"><i class="fa-solid fa-user-plus"></i>Sign-up</a></li>
            <li><a href="cart.jsp"><i class="fa-solid fa-cart-arrow-down"></i>Cart<span class="badge bg-danger px-2">${cart_list.size()}</span></a></li>
        </ul>

        <div class="container">
            <div class="card-header my-3">All Orders</div>
            <table class="table table-light">
                <thead>
                    <tr>
                        <th scope="col">Date</th>
                        <th scope="col">Name</th>
                        <th scope="col">Category</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Price</th>
                        <th scope="col">Cancel</th>
                    </tr>
                </thead>
                <tbody>


                    <%                               
                     if (orders != null) {
                          for (Order o : orders) {%>
                    <tr>
                        <td><%=o.getDate()%></td>
                        <td><%=o.getName()%></td>
                        <td><%=o.getCategory()%></td>
                        <td><%=o.getQuantity()%></td>
                        <td><%=o.getPrice()%></td>
                        <td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
                    </tr>
                    <%}
                        }
                    %>

                </tbody>
            </table>
        </div>
    </body>
</html>
