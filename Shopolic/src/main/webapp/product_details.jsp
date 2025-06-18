<%@page import="com.sit.dao.ProductDao"%>
<%@page import="com.sit.model.Product"%>
<%@page import="com.sit.util.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Product Details</title>
<%@include file="components/common_css_js.jsp"%>

<style>
.product-container {
	max-width: 1000px;
	margin: auto;
	padding: 20px;
}

/* Larger product image */
.product-img {
	width: 100%;
	max-height: 500px;
	object-fit: cover;
	border-radius: 10px;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
}

.price-container {
	font-size: 1.5rem;
	font-weight: bold;
	color: #28a745;
}

.original-price {
	font-size: 1.2rem;
	text-decoration: line-through;
	color: gray;
}

.discount-text {
	font-size: 1.2rem;
	color: red;
	font-weight: bold;
}

/* Increased gap between buttons */
.btn-group-custom {
	display: flex;
	flex-direction: column;
	gap: 15px;
}

.btn-custom {
	width: 100%;
	font-size: 1.2rem;
	padding: 12px;
	border-radius: 8px;
}

.btn-custom:hover {
	transform: scale(1.05);
	transition: all 0.3s ease;
}

.product-image {
	width: 100%;
	max-height: 400px;
	transition: transform 0.3s ease-in-out;
}

.product-image:hover {
	transform: scale(1.5);
	cursor: zoom-in;
}
</style>
</head>
<body>

	<%@include file="components/navbar.jsp"%>

	<div class="container product-container mt-5">
		<%
		int pid = Integer.parseInt(request.getParameter("pid"));
		ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
		Product product = pdao.getProductById(pid);

		if (product != null) {
		%>

		<div class="row">
			<!-- Product Image on the Left -->
			<div class="col-md-6">
				<img src="img/products/<%=product.getpPhoto()%>"
					class="product-image" style="margin-left: -50px"
					; alt="<%=product.getpName()%>">
			</div>

			<!-- Product Details on the Right -->
			<div class="col-md-6">
				<h2 class="mb-3"><%=product.getpName()%></h2>
				<p class="text-muted"><%=product.getpDesc()%></p>

				<!-- Pricing -->
				<div class="mb-4">
					<span class="price-container">₹<%=product.getPriceAfterApplyingDiscount()%></span>
					<span class="original-price">₹<%=product.getpPrice()%></span> <span
						class="discount-text">(<%=product.getpDiscount()%>% off)
					</span>
				</div>

				<!-- Action Buttons with More Space -->
				<div class="btn-group-custom">
					<button class="btn btn-warning btn-custom text-white"
						onclick="add_to_cart(<%=product.getpId()%>, '<%=product.getpName()%>', <%=product.getPriceAfterApplyingDiscount()%>)">
						🛒 Add to Cart</button>

					<button class="btn btn-success btn-custom"
						onclick="window.location.href='checkout.jsp?pid=<%=product.getpId()%>&name=<%=product.getpName()%>&price=<%=product.getPriceAfterApplyingDiscount()%>'">
						⚡ Buy Now</button>
				</div>
			</div>
		</div>

		<%
		} else {
		%>
		<h3 class="text-danger text-center mt-5">Product not found!</h3>
		<%
		}
		%>

	</div>

	<%@include file="components/common_modals.jsp"%>

</body>
</html>
