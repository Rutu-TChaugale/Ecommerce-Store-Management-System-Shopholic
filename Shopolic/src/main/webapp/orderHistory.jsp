<%@ page import="java.util.List" %>
<%@ page import="com.sit.model.Order" %>
<%@ page import="com.sit.model.User" %>
<%@ page import="com.sit.dao.OrderDao" %>
<%@ page import="com.sit.util.FactoryProvider" %>
<%@ page session="true" %>

<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    OrderDao orderDao = new OrderDao(FactoryProvider.getFactory());
    List<Order> orders = orderDao.getOrdersByUser(user);
%>

<h2>Order History</h2>
<table border="1">
    <tr>
        <th>Order ID</th>
        <th>Product Name</th>
        <th>Quantity</th>
        <th>Date</th>
        <th>Status</th>
    </tr>
    <% for (Order order : orders) { %>
        <tr>
            <td><%= order.getOrderId() %></td>
            <td><%= order.getProduct().getpName() %></td>
            <td><%= order.getQuantity() %></td>
            <td><%= order.getOrderDate() %></td>
            <td><%= order.getStatus() %></td>
        </tr>
    <% } %>
</table>
