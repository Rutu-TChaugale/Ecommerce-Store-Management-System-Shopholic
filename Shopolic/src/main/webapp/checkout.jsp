<%-- <!-- @Spuffyffets codes  --> 
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {

	session.setAttribute("message", "You are not logged in !! Login first to access checkout page");
	response.sendRedirect("login.jsp");
	return;

}
%>





<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Checkout</title>
<%@include file="components/common_css_js.jsp"%>

<script>
function placeOrder() {
    var myModal = new bootstrap.Modal(document.getElementById('orderSuccessModal'));
    myModal.show();
}

</script>


</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container">
		<div class="row mt-5">

			<div class="col-md-6">
				<!--card-->
				<div class="card">
					<div class="card-body">

						<h3 class="text-center mb-5">Your selected items</h3>

						<div class="cart-body"></div>
					</div>
				</div>

			</div>
			<div class="col-md-6">
				<!--form details-->
				<!--card-->
				<div class="card">
					<div class="card-body">

						<h3 class="text-center mb-5">Your details for order</h3>
						<form action="#!">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									value="<%=user.getUserEmail()%>" type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="name">Your name</label> <input
									value="<%=user.getUserName()%>" type="text"
									class="form-control" id="name" aria-describedby="emailHelp"
									placeholder="Enter name">
							</div>


							<div class="form-group">
								<label for="name">Your contact</label> <input
									value="<%=user.getUserPhone()%>" type="text"
									class="form-control" id="name" aria-describedby="emailHelp"
									placeholder="Enter contact number">
							</div>


							<div class="form-group">
								<label for="exampleFormControlTextarea1">Your shipping
									address</label>
								<textarea value="<%=user.getUserAddress()%>"
									class="form-control" id="exampleFormControlTextarea1"
									placeholder="Enter your address" rows="3"></textarea>
							</div>

							
							<div class="container text-center">
								<button type="button" class="btn btn-outline-success"
									onclick="placeOrder()">Order Now</button>
								<!-- <button class="btn btn-outline-primary" onclick="window.location.href='index.jsp'">Continue Shopping</button> -->
							</div>



						</form>

					</div>
				</div>
			</div>
		</div>

	</div>


	<%@include file="components/common_modals.jsp"%>

	<!-- Order Confirmation Modal -->
	<div class="modal fade" id="orderSuccessModal" tabindex="-1"
		aria-labelledby="orderSuccessModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Order Placed Successfully!</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-center">
					<p>Your order has been placed successfully!</p>
					<button class="btn btn-outline-primary" onclick="window.location.href='index.jsp'" data-bs-dismiss="modal">Continue
						Shopping</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
 --%>










<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
<%@include file="components/common_css_js.jsp"%>




<script>
	function placeOrder() {
		document.getElementById("orderForm").submit();
	}
</script>
</head>

<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "You are not logged in !! Login first to access checkout page");
	response.sendRedirect("login.jsp");
	return;
}
%>

<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-5">Your selected items</h3>
						<div class="cart-body"></div>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-5">Your details for order</h3>
						<form id="orderForm" action="OrderServlet" method="post">
							<input type="hidden" name="userId" value="<%=user.getUserId()%>">

							<div class="form-group">
								<label>Email address</label> <input
									value="<%=user.getUserEmail()%>" type="email" name="email"
									class="form-control" required>
							</div>

							<div class="form-group">
								<label>Your name</label> <input value="<%=user.getUserName()%>"
									type="text" name="name" class="form-control" required>
							</div>

							<div class="form-group">
								<label>Your contact</label> <input
									value="<%=user.getUserPhone()%>" type="text" name="contact"
									class="form-control" required>
							</div>

							<div class="form-group">
								<label>Your shipping address</label>
								<textarea name="address" class="form-control" required><%=user.getUserAddress()%></textarea>
							</div>

							<div class="container text-center">
								<button type="button" class="btn btn-outline-success"
									onclick="placeOrder()">Order Now</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="components/common_modals.jsp"%>

	<!-- Order Confirmation Modal -->
	<div class="modal fade" id="orderSuccessModal" tabindex="-1"
		aria-labelledby="orderSuccessModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Order Placed Successfully!</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-center">
					<p>Your order has been placed successfully!</p>
					<button class="btn btn-outline-primary"
						onclick="window.location.href='index.jsp'" data-bs-dismiss="modal">Continue
						Shopping</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html> 














<%-- 
  <%@page import="java.util.List" %>
<%@page import="com.sit.model.Product" %> <!-- Import your Product entity -->
<%@page import="com.sit.dao.ProductDao" %> <!-- Import DAO to fetch product details -->
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in! Login first to access the checkout page.");
        response.sendRedirect("login.jsp");
        return;
    }
    
    // Fetch cart items (assuming a List<Product> stored in session)
    List<Product> cartItems = (List<Product>) session.getAttribute("cart");
    if (cartItems == null || cartItems.isEmpty()) {
        session.setAttribute("message", "Your cart is empty! Add items first.");
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <%@include file="components/common_css_js.jsp"%>

    <script>
        function placeOrder() {
            document.getElementById("orderForm").submit();
        }
    </script>
</head>
<body>

    <%@include file="components/navbar.jsp"%>

    <div class="container">
        <div class="row mt-5">

            <!-- Selected Items Section -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center mb-4">Your Selected Items</h3>
                        <ul class="list-group">
                            <% 
                                double totalPrice = 0;
                                for (Product p : cartItems) { 
                                    totalPrice += p.getPriceAfterApplyingDiscount();
                            %>
                                <li class="list-group-item d-flex justify-content-between">
                                    <span><%= p.getpName() %> (₹<%= p.getPriceAfterApplyingDiscount() %>)</span>
                                    <span>Qty: 1</span>
                                </li>
                            <% } %>
                        </ul>
                        <h4 class="text-center mt-3">Total: ₹<%= totalPrice %></h4>
                    </div>
                </div>
            </div>

            <!-- User Details Form -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center mb-4">Your Details for Order</h3>
                        <form id="orderForm" action="OrderServlet" method="post">
                            <input type="hidden" name="userId" value="<%= user.getUserId() %>">

                            <div class="form-group">
                                <label>Email Address</label>
                                <input value="<%= user.getUserEmail() %>" type="email" name="email" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label>Your Name</label>
                                <input value="<%= user.getUserName() %>" type="text" name="name" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label>Your Contact</label>
                                <input value="<%= user.getUserPhone() %>" type="text" name="contact" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label>Your Shipping Address</label>
                                <textarea name="address" class="form-control" required><%= user.getUserAddress() %></textarea>
                            </div>

                            <div class="text-center">
                                <button type="button" class="btn btn-outline-success" onclick="placeOrder()">Order Now</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <%@include file="components/common_modals.jsp"%>

    <!-- Order Confirmation Modal -->
    <div class="modal fade" id="orderSuccessModal" tabindex="-1" aria-labelledby="orderSuccessModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Order Placed Successfully!</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <p>Your order has been placed successfully!</p>
                    <button class="btn btn-outline-primary" onclick="window.location.href='index.jsp'" data-bs-dismiss="modal">Continue Shopping</button>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
 --%>
