<%@ page import="java.util.List, com.sit.dao.ProductDao, com.sit.model.Product, com.sit.util.FactoryProvider" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    int productId = Integer.parseInt(request.getParameter("productId"));
    ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
    Product product = productDao.getProductById(productId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= product.getpName() %></title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <div class="container">
        <div class="row">
            <div class="col-md-6 text-center">
                <img src="img/products/<%=product.getpPhoto()%>" class="img-fluid" alt="Product Image">
            </div>
            <div class="col-md-6">
                <h2><%= product.getpName() %></h2>
                <p><%= product.getpDesc() %></p>
                <h4>Price: ₹<%= product.getPriceAfterApplyingDiscount() %></h4>
                <h6 class="text-muted">
                    MRP: <strike>₹<%= product.getpPrice() %></strike> (<%= product.getpDiscount() %>% OFF)
                </h6>

                <button class="btn custom-bg text-white" onclick="addToCart(<%=product.getpId()%>)">Add to Cart</button>
                <button class="btn btn-outline-success">Buy Now</button>
                <button class="btn custom-bg text-white" onclick="addToWishlist(<%=product.getpId()%>)">
                    <i class="fa fa-heart"></i> Add to Wishlist
                </button>
            </div>
        </div>
    </div>

</body>
</html>
