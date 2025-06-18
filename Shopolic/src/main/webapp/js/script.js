/* <!-- @Spuffyffets codes  --> */

function showLoginMessage() {
	alert("Please login first to do any action ");
	window.location.href = "login.jsp";
}


function showLoginMessageforcard() {
	alert("Please login first to see the product information.");
	window.location.href = "login.jsp";
}


function placeOrder() {

	setTimeout(() => {
		document.getElementById("orderSuccessMsg").style.display = "block";
	}, 500);
}


function add_to_cart(pid, pname, price) {

	let cart = localStorage.getItem("cart");
	if (cart == null) {
		//cart nhi aahe  
		let products = [];
		let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price }
		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		//        console.log("Product is added for the first time")
		showToast("Item is added to cart")
	} else {
		//cart allready aahe 
		let pcart = JSON.parse(cart);

		let oldProduct = pcart.find((item) => item.productId == pid)
		console.log(oldProduct)
		if (oldProduct) {
			//quantity increase karay sathi
			oldProduct.productQuantity = oldProduct.productQuantity + 1
			pcart.map((item) => {

				if (item.productId === oldProduct.productId) {
					item.productQuantity = oldProduct.productQuantity;
				}

			})
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("Product quantity is increased")
			showToast(oldProduct.productName + " quantity is increased , Quantity = " + oldProduct.productQuantity)

		} else {
			//productn add kele
			let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price }
			pcart.push(product)
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("Product is added")
			showToast("Product is added to cart")
		}


	}


	updateCart();

}

//update cart:

function updateCart() {
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	if (cart == null || cart.length == 0) {
		console.log("Cart is empty !!")
		$(".cart-items").html("( 0 )");
		$(".cart-body").html("<h3>Cart does not have any items </h3>");
		$(".checkout-btn").attr('disabled', true)
	} else {


		//there is some in cart to show
		console.log(cart)
		$(".cart-items").html(`( ${cart.length} )`);
		let table = `
            <table class='table'>
            <thead class='thread-light'>
                <tr>
                <th>Item Name </th>
                <th>Price </th>
                <th>Quantity </th>
                <th>Total Price </th>
                <th>Action</th>
                
        
                </tr>
        
            </thead>

        


            `;

		let totalPrice = 0;
		cart.map((item) => {


			table += `
                    <tr>
                        <td> ${item.productName} </td>
                        <td> ${item.productPrice} </td>
                        <td> ${item.productQuantity} </td>
                        <td> ${item.productQuantity * item.productPrice} </td>
                        <td> <button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button> </td>    
                     </tr>
                 `

			totalPrice += item.productPrice * item.productQuantity;

		})




		table = table + `
            <tr><td colspan='5' class='text-right font-weight-bold m-5'> Total Price : ${totalPrice} </td></tr>
         </table>`
		$(".cart-body").html(table);
		$(".checkout-btn").attr('disabled', false)
		console.log("removed")

	}

}


//delete item 
function deleteItemFromCart(pid) {
	let cart = JSON.parse(localStorage.getItem('cart'));

	let newcart = cart.filter((item) => item.productId != pid)

	localStorage.setItem('cart', JSON.stringify(newcart))

	updateCart();

	showToast("Item is removed from cart ")

}


$(document).ready(function() {

	updateCart()
})


function showToast(content) {
	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(() => {
		$("#toast").removeClass("display");
	}, 2000);
}


function goToCheckout() {

	window.location = "checkout.jsp"

}

function fetchProductDetails(productId) {


	$.ajax({
		url: 'GetProductDetailsServlet',
		type: 'GET',
		data: { productId: productId },
		success: function(response) {

			$('#updateProductId').val(response.productId);
			$('#updateProductName').val(response.productName);
			$('#updateProductDesc').val(response.productDesc);
			$('#updateProductPrice').val(response.productPrice);
			$('#updateProductDiscount').val(response.productDiscount);
			$('#updateProductQuantity').val(response.productQuantity);
			$('#updateProductCategory').val(response.categoryId);

		},
		error: function(xhr, status, error) {
			console.error("Error fetching product details: ", error);
		}
	});
}


function placeOrder() {
	var myModal = new bootstrap.Modal(document.getElementById('orderSuccessModal'));
	myModal.show();
}	


/*=========================================================================*/



//wishlist sathi
function add_to_wishlist(pid, pname, price) {
	let wishlist = localStorage.getItem("wishlist");

	if (wishlist == null) {

		let products = [];
		let product = { productId: pid, productName: pname, productPrice: price };
		products.push(product);
		localStorage.setItem("wishlist", JSON.stringify(products));
		showToast("Item added to wishlist");
	} else {

		let pwishlist = JSON.parse(wishlist);
		let existingProduct = pwishlist.find(item => item.productId === pid);

		if (existingProduct) {
			showToast(`${pname} is already in your wishlist`);
		} else {
			let product = { productId: pid, productName: pname, productPrice: price };
			pwishlist.push(product);
			localStorage.setItem("wishlist", JSON.stringify(pwishlist));
			showToast("Item added to wishlist");
		}
	}
	updateWishlist();
}



function updateWishlist() {
	let wishlist = localStorage.getItem("wishlist");
	let wishlistItems = JSON.parse(wishlist);

	if (wishlistItems == null || wishlistItems.length === 0) {
		$(".wishlist-items").html("( 0 )");
		$(".wishlist-body").html("<h3>No items in wishlist</h3>")
		$(".checkout-btn").attr('disabled', true);
	} else {
		let table = `
            <table class='table'>
            <thead class='thead-light'>
                <tr>
                    <th>Item Name</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
        `;

		wishlistItems.forEach(item => {
			table += `
                <tr>
                    <td>${item.productName}</td>
                    <td>${item.productPrice}</td>
                    <td><button onclick='removeItemFromWishlist(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
                </tr>
            `;
		});

		table += `</tbody></table>`;
		$(".wishlist-body").html(table);
		$(".wishlist-items").html(`(${wishlistItems.length})`);
	}


	$('#wishlist').modal('show');
}



function removeItemFromWishlist(pid) {
	let wishlist = JSON.parse(localStorage.getItem("wishlist"));
	let updatedWishlist = wishlist.filter(item => item.productId !== pid);
	localStorage.setItem("wishlist", JSON.stringify(updatedWishlist));
	updateWishlist(); 
	showToast("Item removed from wishlist");
}

//   toast notifications disel
function showToast(content) {
	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(() => {
		$("#toast").removeClass("display");
	}, 2000);
}


