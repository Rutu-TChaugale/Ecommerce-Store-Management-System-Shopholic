package com.sit.servlet;

import com.sit.dao.OrderDao;
import com.sit.dao.ProductDao;
import com.sit.model.Order;
import com.sit.model.Product;
import com.sit.model.User;
import com.sit.util.FactoryProvider;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("current-user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
        Product product = productDao.getProductById(productId);

        Order order = new Order();
        order.setUser(user);
        order.setProduct(product);
        order.setQuantity(quantity);
        order.setOrderDate(new Date());
        order.setStatus("Pending");

        OrderDao orderDao = new OrderDao(FactoryProvider.getFactory());
        orderDao.saveOrder(order);

        session.setAttribute("message", "Order placed successfully!");
        response.sendRedirect("order-history.jsp");
    }
}
