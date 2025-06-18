<!-- @Spuffyffets codes  -->
<%-- <%@page import="com.sit.util.Helper"%>
<%@page import="com.sit.model.Category"%>
<%@page import="com.sit.dao.CategoryDao"%>
<%@page import="com.sit.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.sit.dao.ProductDao"%>
<%@page import="com.sit.util.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyCart - Home</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>

	<%@include file="components/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row mt-3 mx-2">

			<%
			String cat = request.getParameter("category");
			//out.println(cat);

			ProductDao dao = new ProductDao(FactoryProvider.getFactory());
			List<Product> list = null;

			if (cat == null || cat.trim().equals("all")) {
				list = dao.getAllProducts();

			} else {

				int cid = Integer.parseInt(cat.trim());
				list = dao.getAllProductsById(cid);

			}

			CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
			List<Category> clist = cdao.getCategories();
			%>



			<!--show categories-->
			<div class="col-md-2">


				<div class="list-group mt-4">

					<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action active"> All
						Products </a>




					<%
					for (Category c : clist) {
					%>



					<a href="index.jsp?category=<%=c.getCategoryId()%>"
						class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>


					<%
					}
					%>



				</div>


			</div>

			<!--show products-->
			<div class="col-md-10">


				<!--row-->
				<div class="row mt-4">

					<!--col:12-->
					<div class="col-md-12">

						<div class="card-columns">

							<!--traversing products-->

							<%
							for (Product p : list) {
							%>


							<!--product card-->
							<div class="card product-card">
								<div class="container text-center">
									<img src="img/products/<%=p.getpPhoto()%>"
										style="max-height: 200px; max-width: 100%; width: auto;"
										class="card-img-top m-2" alt="Product Image">
								</div>

								<div class="card-body">

									<h5 class="card-title"><%=p.getpName()%></h5>

									<p class="card-text">
										<%=Helper.get10Words(p.getpDesc())%>

									</p>

								</div>

								<div class="card-footer text-center">
									<button class="btn custom-bg text-white"
										onclick="add_to_cart(<%=p.getpId()%>, '<%=p.getpName()%>',<%=p.getPriceAfterApplyingDiscount()%>)">Add
										to Cart</button>
									<button class="btn  btn-outline-success ">
										&#8377;
										<%=p.getPriceAfterApplyingDiscount()%>/- <span
											class="text-secondary discount-label"> &#8377; <%=p.getpPrice()%>
											, <%=p.getpDiscount()%>% off
										</span>
									</button>

								</div>



							</div>






							<%
							}

							if (list.size() == 0) {
							out.println("<h3>No item in this category</h3>");
							}
							%>


						</div>



					</div>

				</div>



			</div>

		</div>
	</div>



	<%@include file="components/common_modals.jsp"%>

</body>
</html>
 --%>








<!-- @Spuffyffets codes  -->

<%@page import="com.sit.util.Helper"%>
<%@page import="com.sit.model.Category"%>
<%@page import="com.sit.dao.CategoryDao"%>
<%@page import="com.sit.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.sit.dao.ProductDao"%>
<%@page import="com.sit.util.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shopolic-Home</title>
<%@include file="components/common_css_js.jsp"%>

<style>
.wishlist-btn {
	position: absolute;
	top: 10px;
	right: 10px;
	background-color: transparent;
	border: 2px solid #263238;
	border-radius: 50%;
	padding: 6px;
	font-size: 18px;
	color: #aa00ff;
	transition: all 0.3s ease;
	cursor: pointer;
	z-index: 10;
}

.wishlist-btn:hover {
	background-color: #aa00ff;
	border-color: #ff4081;
	color: #fff;
}

.wishlist-btn i {
	margin: 0;
	font-size: 18px; 
}
.carousel-container {
    margin-left: -1px; 
    
}



.carousel-item img {	
    width: 100%;
    height: 200px; 
    object-fit: cover; 
    object-position: center;
}

</style>
</head>
<body>

	<%@include file="components/navbar.jsp"%>
	
	
	
	<div class="container-fluid">
		<div class="row mt-3 mx-2">

			<%
			String cat = request.getParameter("category");
			//out.println(cat);

			ProductDao dao = new ProductDao(FactoryProvider.getFactory());
			List<Product> list = null;

			if (cat == null || cat.trim().equals("all")) {
				list = dao.getAllProducts();

			} else {

				int cid = Integer.parseInt(cat.trim());
				list = dao.getAllProductsById(cid);

			}

			CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
			List<Category> clist = cdao.getCategories();
			%>

			<!-- Show categories -->
			<div class="col-md-2">
				<div class="list-group mt-4">
					<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action active"> All
						Products </a>
					<%
					for (Category c : clist) {
					%>
					<a href="index.jsp?category=<%=c.getCategoryId()%>"
						class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
					<%
					}
					%>
				</div>
			</div>
			
			
			
			
			 <div class="col-md-10">
            <!-- Carousel -->
            <div class="carousel-container">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="img/products/001.webp" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="img/products/002.webp" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="img/products/003.webp" alt="Third slide">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
			
			
			
		

			<!-- Show products -->
			<div class="col-md-13">
				<!-- Row -->
				<div class="row mt-4">
					<!-- Col:12 -->
					<div class="col-md-12">
						<div class="card-columns">

							<!-- Static Products -->
							<!-- <div class="card product-card">
								<div class="container text-center">
									<img src="img/products/earbus.jpg"
										style="max-height: 200px; max-width: 100%; width: auto;"
										class="card-img-top m-2" alt="Earbuds">
								</div>
								<div class="card-body">
									<h5 class="card-title">Earbuds</h5>
									<p class="card-text">Experience crystal-clear sound with
										our premium wireless earbuds. Designed for comfort and
										long-lasting battery life.</p>
								</div>
								<div class="card-footer text-center">
									<button class="btn custom-bg text-white"
										onclick="showLoginMessage()">Add to Cart</button>
									<button class="btn btn-outline-success">
										₹999/- <span class="text-secondary discount-label">
											₹1299, 23% off </span>
									</button>
									<button class="btn custom-bg text-white"
										onclick="showLoginMessage()">
										<i class="fa fa-heart"></i>
									</button>
								</div>
							</div> -->

							<!-- <div class="card product-card">
								<div class="container text-center">
									<img src="img/products/women kurti.jpeg"
										style="max-height: 200px; max-width: 100%; width: auto;"
										class="card-img-top m-2" alt="Women's Kurti">
								</div>
								<div class="card-body">
									<h5 class="card-title">Women’s Kurti</h5>
									<p class="card-text">Embrace elegance with our stylish
										women’s kurti, made from high-quality, breathable
										fabric.degisn is good look is good all good
								</div>
								<div class="card-footer text-center">
									<button class="btn custom-bg text-white"
										onclick="showLoginMessage()">Add to Cart</button>
									<button class="btn btn-outline-success">
										₹1499/- <span class="text-secondary discount-label">
											₹1999, 25% off </span>
									</button>
									<button class="btn custom-bg text-white"
										onclick="showLoginMessage()">
										<i class="fa fa-heart"></i>
									</button>
								</div>
							</div> -->
<!-- 
							<div class="card product-card">
								<div class="container text-center">
									<img src="img/products/laptop.png"
										style="max-height: 200px; max-width: 100%; width: auto;"
										class="card-img-top m-2" alt="Laptop">
								</div>
								<div class="card-body">
									<h5 class="card-title">Laptop</h5>
									<p class="card-text">Elevate your productivity with our
										high-performance laptop featuring a powerful processor and
										stunning display.</p>
								</div>
								<div class="card-footer text-center">
									<button class="btn custom-bg text-white"
										onclick="showLoginMessage()">Add to Cart</button>
									<button class="btn btn-outline-success">
										₹24999/- <span class="text-secondary discount-label">
											₹29999, 16% off </span>
									</button>
									<button class="btn custom-bg text-white"
										onclick="showLoginMessage()">
										<i class="fa fa-heart"></i>
									</button>
								</div>
							</div> -->

							<!-- <div class="card product-card">
								<div class="container text-center">
									<img src="img/products/watch.webp"
										style="max-height: 200px; max-width: 100%; width: auto;"
										class="card-img-top m-2" alt="Earbuds">
								</div>
								<div class="card-body">
									<h5 class="card-title">Premium Smartwatch with Health
										Tracker</h5>
									<p class="card-text">tay ahead with this stylish smartwatch
										featuring heart rate Water-resistant design with a
										long-lasting battery.</p>
								</div>
								<div class="card-footer text-center">
									<button class="btn custom-bg text-white"
										onclick="showLoginMessage()">Add to Cart</button>
									<button class="btn btn-outline-success">
										₹2000.0/- <span class="text-secondary discount-label">
											₹2500.0, 20% off </span>
									</button>
									<button class="btn custom-bg text-white"
										onclick="showLoginMessage()">
										<i class="fa fa-heart"></i>
									</button>
								</div>
							</div> -->

							<!-- <div class="card product-card">
								<div class="container text-center">
									<img src="img/products/tv.webp"
										style="max-height: 200px; max-width: 100%; width: auto;"
										class="card-img-top m-2" alt="Earbuds">
								</div>
								<div class="card-body">
									<h5 class="card-title">55-inch 4K Smart TV</h5>
									<p class="card-text">Enjoy an immersive viewing experience
										with this 55-inch 4K Ultra HD Smart TV. Comes with built-in
										streaming apps, Dolby Vision.</p>
								</div>
								<div class="card-footer text-center">
									<button class="btn custom-bg text-white"
										onclick="showLoginMessage()">Add to Cart</button>
									<button class="btn btn-outline-success">
										₹36000.0/- <span class="text-secondary discount-label">
											₹40000.0, 10% off </span>
									</button>
									<button class="btn custom-bg text-white"
										onclick="showLoginMessage()">
										<i class="fa fa-heart"></i>
									</button>
								</div>
							</div> -->

							<!-- <div class="card product-card">
								<div class="container text-center">
									<img src="img/products/NIKE+REVOLUTION+7.png"
										style="max-height: 200px; max-width: 100%; width: auto;"
										class="card-img-top m-2" alt="Earbuds">
								</div>
								<div class="card-body">
									<h5 class="card-title">Men's Running Shoes</h5>
									<p class="card-text">Lightweight and comfortable running
										shoes designed for all-day wear. The breathable mesh upper
										ensures airflow, while the cushioned sole provides excellent
										support for jogging, walking.</p>
								</div>
								<div class="card-footer text-center">
									<button class="btn custom-bg text-white"
										onclick="showLoginMessage()">Add to Cart</button>
									<button class="btn btn-outline-success">
										₹1080/- <span class="text-secondary discount-label">
											₹1299, 23% off </span>
									</button>
									<button class="btn custom-bg text-white"
										onclick="showLoginMessage()">
										<i class="fa fa-heart"></i>
									</button>
								</div>
							</div> -->

							<!-- Traversing Dynamic Products -->
							<%
							for (Product p : list) {
							%>
							<!-- Dynamic Product Card -->
							<%-- <div class="card product-card">
								<div class="container text-center">
									<img src="img/products/<%=p.getpPhoto()%>" style="max-height: 200px; max-width: 100%; width: auto;" class="card-img-top m-2" alt="Product Image">
								</div>
								<div class="card-body">
									<h5 class="card-title"><%=p.getpName()%></h5>
									<p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>
								</div>
								<div class="card-footer text-center">
									<button class="btn custom-bg text-white" onclick="showLoginMessage()">Add to Cart</button>
									<button class="btn btn-outline-success">₹<%=p.getPriceAfterApplyingDiscount()%>/- <span class="text-secondary discount-label"> ₹<%=p.getpPrice()%>, <%=p.getpDiscount()%>% off </span></button>
								</div>
							</div>  --%>




							<div class="card product-card"  style="position: relative;">
								<div class="container text-center" onclick="showLoginMessageforcard()">
									<img src="img/products/<%=p.getpPhoto()%>"
										style="max-height: 200px; max-width: 100%; width: auto;"
										class="card-img-top m-2" alt="Product Image">
								</div>
								<div class="card-body">
									<h5 class="card-title"><%=p.getpName()%></h5>
									<p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>
								</div>
								<div class="card-footer text-center">
									<button class="btn custom-bg text-white"
										onclick="showLoginMessage()">Add to Cart</button>
									<button class="btn btn-outline-success" onclick="showLoginMessage()">
										₹<%=p.getPriceAfterApplyingDiscount()%>/- <span
											class="text-secondary discount-label" > ₹<%=p.getpPrice()%>,
											<%=p.getpDiscount()%>% off
										</span>
									</button>
									<!-- Wishlist Button -->
									<button class="btn custom-bg text-white"
										onclick="showLoginMessage()">
										<i class="fa fa-heart"></i>
									</button>
								</div>
							</div>
							<%-- <button class="btn wishlist-btn"
								onclick="addToWishlist(<%=p.getpId()%>)"  onclick="showLoginMessage()">
								<i class="fa fa-heart"></i>
							</button> --%>





							<%
							}

							if (list.size() == 0) {
							out.println("<h3>No item in this category</h3>");
							}
							%>

						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<%@include file="components/common_modals.jsp"%>

</body>
</html>
