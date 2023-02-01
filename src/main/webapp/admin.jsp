<%@page import="java.util.List"%>
<%@page import="com.ecart.dao.CategoryDao"%>
<%@page import="com.ecart.helper.FactoryProvider"%>
<%@page import="com.ecart.entities.Category"%>
<%@page import="com.ecart.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {

	session.setAttribute("message", "You are not logged in !! Login first");
	response.sendRedirect("login.jsp");
	return;

} else {

	if (user.getUserType().equals("normal")) {

		session.setAttribute("message", "You are not admin ! Do not access this page !!");
		response.sendRedirect("login.jsp");
	}
}
%>





<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>

<%@include file="components/common_css_js.jsp"%>

<style>
.card {
	border: 1px solid #8e24aa;
}

.card:hover {
	background: #ffcdd2;
	cursor: pointer;
}
</style>

</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container">

		<div class="container-fluid mt-3 text-center">
			<%@include file="components/messsage.jsp"%>

		</div>

		<!-- first row -->
		<div class="row mt-3">

			<!-- first col -->
			<div class="col-md-4">

				<!-- first box -->
				<div class="card">
					<div class="card-body text-center">

						<!-- img insertion -->
						<div class="container">
							<img class="img-fluid rounded-circle" style="max-width: 100px"
								src="img\man.png" alt="user_icon">
						</div>

						<h1>2344</h1>
						<h1 class="text-uppercase text-muted">Users</h1>

					</div>

				</div>

			</div>

			<!-- second col -->
			<div class="col-md-4">

				<!-- second box -->
				<div class="card">
					<div class="card-body text-center">

						<!-- img insertion -->
						<div class="container">
							<img class="img-fluid rounded-circle" style="max-width: 100px"
								src="img\delivery-box.png" alt="user_icon">
						</div>

						<h1>2344</h1>
						<h1 class="text-uppercase text-muted">products</h1>

					</div>

				</div>


			</div>

			<!-- third col -->


			<div class="col-md-4">

				<!-- third box -->
				<div class="card">
					<div class="card-body text-center">

						<!-- img insertion -->
						<div class="container">
							<img class="img-fluid" style="max-width: 100px"
								src="img\list.png" alt="user_icon">
						</div>

						<h1>2344</h1>
						<h1 class="text-uppercase text-muted">categories</h1>

					</div>

				</div>


			</div>

		</div>

		<!-- second row -->
		<div class="row mt-3">

			<!-- second row : first column -->
			<div class="col-md-6">

				<div class="card" data-bs-toggle="modal"
					data-bs-target="#add-category-modal">

					<div class="card-body text-center">

						<!-- img insertion -->
						<div class="container">
							<img class="img-fluid" style="max-width: 100px"
								src="img\keys.png" alt="user_icon">
						</div>

						<p class="mt-2">click here to add new category</p>
						<h1 class="text-uppercase text-muted">Add Category</h1>

					</div>

				</div>

			</div>



			<!-- second row : second column -->
			<div class="col-md-6">
				<div class="card" data-bs-toggle="modal"
					data-bs-target="#add-product-modal">

					<div class="card-body text-center">

						<!-- img insertion -->
						<div class="container">
							<img class="img-fluid" style="max-width: 100px"
								src="img\plus.png" alt="user_icon">
						</div>

						<p class="mt-2">click here to add product</p>
						<h1 class="text-uppercase text-muted">Add Product</h1>

					</div>

				</div>

			</div>


		</div>

	</div>

	<!-- add category modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">

		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill category
						details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="ProductOperationServlet" method="post">

						<input type="hidden" name="operation" value="addcategory">

						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter category title" required="required" />
						</div>
						<br>

						<div class="form-group">
							<textarea calss="" name="catDescription" class="form-control"
								placeholder="Enter category description" required="required"></textarea>

						</div>
						<br>
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>

						</div>


					</form>

				</div>
			</div>
		</div>
	</div>



	<!-- end category modal -->


	<!-- ----------------------------------------------------------------------------------------------------------- -->

	<!-- start product modal -->

	<!-- Button trigger modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">

		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Product
						details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

						<input type="hidden" name="operation" value="addproduct">

						<div class="form-group">

							<input type="text" class="form-control" name="pName"
								placeholder="Enter product title" required="required" />

						</div>
						<br>

						<div class="form-group">
							<textarea calss="" name="pDes" class="form-control"
								placeholder="Enter product description" required="required"></textarea>

						</div>
						<br>
						<div class="form-group">
							<input type="number" class="form-control" name="pPrice"
								placeholder="Enter product price" required="required" />

						</div>
						<br>
						<div class="form-group">
							<input type="number" class="form-control" name="pDiscount"
								placeholder="Enter product discount" required="required" />

						</div>
						<br>
						<div class="form-group">
							<input type="number" class="form-control" name="pQuantity"
								placeholder="Enter product quantity" required="required" />

						</div>
						<br>
						
						<%
						CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
						List<Category> list = categoryDao.getCategory();
						
						%>
						
						<div class="form-group">
						
							
						
							<select name="catId" class="form-control" id="">
								<%
									for(Category c: list) {
									
								
							
								%>
								<option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>
						
								<%} %>
							</select>
						</div>
						<br>
						<div class="form-group">
							<label for="pPic">Select Picture of product</label>
							<br>
							<input type="file" id="pPic" name="pPic" required="required">
						</div>
						
						
						
						
						
						<br>
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Product</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>

						</div>


					</form>

				</div>
			</div>
		</div>
	</div>
	
	<!-- end product modal -->
</body>
</html>



























































