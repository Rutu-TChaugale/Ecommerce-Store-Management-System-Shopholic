<!-- @Spuffyffets codes  --><%-- <%@page import="java.util.List"%>
<%@page import="com.sit.dao.ProductDao"%>
<%@page import="com.sit.model.Product"%>
<%@page import="com.sit.util.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
    List<Product> products = pdao.getAllProducts();
%>
<%@include file="components/common_css_js.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Products</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<%@include file="components/navbar.jsp"%>
    <div class="container">
        <h1 class="text-center">All Products</h1>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (Product p : products) { %>
                    <tr>
                        <td><%= p.getpId() %></td>
                        <td><img src="<%= p.getpPhoto() %>" width="50" height="50"></td>
                        <td><%= p.getpName() %></td>
                        <td>₹<%= p.getpPrice() %></td>
                        <td>
                            <a href="editProduct.jsp?pId=<%= p.getpId() %>" class="btn btn-warning">Edit</a>
                            <a href="deleteProduct?pId=<%= p.getpId() %>" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>


 --%>


<!-- @Spuffyffets codes  -->

<%@page import="java.util.List"%>
<%@page import="com.sit.dao.ProductDao"%>
<%@page import="com.sit.dao.CategoryDao"%>
<%@page import="com.sit.model.Product"%>
<%@page import="com.sit.model.Category"%>
<%@page import="com.sit.util.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
    List<Product> products = pdao.getAllProducts();

    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> categories = cdao.getAllCategories();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Products</title>
    <%@include file="components/common_css_js.jsp"%>
    <style>
        .product-image {
            width: 60px;
            height: 60px;
            border-radius: 5px;
            object-fit: cover;
        }
        .form-control-sm {
            width: auto;
            display: inline-block;
        }
        .action-buttons {
            display: flex;
            gap: 5px;
        }
    </style>
</head>
<body>
<%@include file="components/navbar.jsp"%>

    <div class="container mt-4">
        <h1 class="text-center mb-4">All Products</h1>
        <div class="table-responsive">
            <table class="table table-bordered table-hover text-center">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Discount</th>
                        <th>Quantity</th>
                        <th>Category</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Product p : products) { %>
                        <tr>
                            <!-- One form per product row -->
                            <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                                <td><%= p.getpId() %></td>
                                <td>
                                    <img src="<%= request.getContextPath() + "/img/products/" + p.getpPhoto() %>" class="product-image">

                                    <input type="file" name="pPhoto" class="form-control form-control-sm mt-1">
                                </td>
                                <td>
                                    <input type="text" name="pName" value="<%= p.getpName() %>" class="form-control form-control-sm">
                                </td>
                                <td>
                                    <textarea name="pDesc" class="form-control form-control-sm"><%= p.getpDesc() %></textarea>
                                </td>
                                <td>
                                    <input type="number" name="pPrice" value="<%= p.getpPrice() %>" class="form-control form-control-sm">
                                </td>
                                <td>
                                    <input type="number" name="pDiscount" value="<%= p.getpDiscount() %>" class="form-control form-control-sm">
                                </td>
                                <td>
                                    <input type="number" name="pQuantity" value="<%= p.getpQuantity() %>" class="form-control form-control-sm">
                                </td>
                                <td>
                                    <select name="categoryId" class="form-control form-control-sm">
                                        <% for (Category c : categories) { %>
                                            <option value="<%= c.getCategoryId() %>" <%= (p.getCategory().getCategoryId() == c.getCategoryId()) ? "selected" : "" %>>
                                                <%= c.getCategoryTitle() %>
                                            </option>
                                        <% } %>
                                    </select>
                                </td>
                                <td class="action-buttons">
                                    <!-- Hidden field to pass the product ID -->
                                    <input type="hidden" name="pId" value="<%= p.getpId() %>">
                                    <!-- Two submit buttons with different operation values -->
                                    <button type="submit" name="operation" value="updateproduct" class="btn btn-success btn-sm">Update</button>
                                    <button type="submit" name="operation" value="deleteproduct" class="btn btn-danger btn-sm">Delete</button>
                                </td>
                            </form>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
