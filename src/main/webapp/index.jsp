<%@page import="javax.swing.plaf.metal.MetalBorders.Flush3DBorder"%>
<%@page import="com.ecart.helper.Helper"%>
<%@page import="com.ecart.entities.Category"%>
<%@page import="com.ecart.dao.CategoryDao"%>
<%@page import="com.ecart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.ecart.dao.ProductDao"%>
<%@page import="com.ecart.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mycart-Home</title>
<%@include file="components/common_css_js.jsp"%>
<%@include file="css/style.css" %>

</head>
<body>

	<%@include file="components/navbar.jsp"%>
	
	<div class="container-fluid">
	
	<div class="row mt-3 mx-2">

		<%
		
		String cat = request.getParameter("category");
		/* out.println(cat); */
		
		ProductDao dao = new ProductDao(FactoryProvider.getFactory());
		List<Product> list = null;
		
		
		
		if(cat == null || cat.trim().equals("all")) {
			
			 list = dao.getAllProducts();
			 
		}
		
		else {
			
			int cid = Integer.parseInt(cat.trim());
			list = dao.getAllProductsById(cid);
		}  
		  
		
		
		
		
		/* list = dao.getAllProducts(); */
		CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
		List<Category> clist = cdao.getCategory();
		%>

		<!-- show categories -->
		<div class="col-md-2">

			<div class="list-group mt-4">

				<a href="index.jsp?category=all" class="list-group-item list-group-item-action active"
					aria-current="true"> All Products </a>

				<%
				for (Category c : clist) {
				%>
				<a href="index.jsp?category=<%= c.getCategoryId() %>" 
					class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>


				<%
				}
				
					if(list.size() == 0) {
						
						out.println("<h3>No item in this category</h3>");
					}
				
				
					
				
				
				%>

			</div>

		</div>


		<!-- show products -->
		<div class="col-md-10">

			<!-- row -->
			<div class="row mt-3">

				<!-- col:12 -->
				<div class="col-md-12">

					<div class="card-columns d-flex flex-wrap fluid">

						<!-- traversing products -->
						<%
						for (Product p : list) {
						%>


						<div class="card m-2" style="width: 22rem;">

							<div class="container text-center">
								<img src="img/products/<%=p.getpPhoto()%>"
									class="card-img-top m-2" alt="img..."
									style="max-height: 200px; max-width: 100%; width: auto;">

							</div>

							<div class="card-body">
								<h5 class="card-title"><%=Helper.get20Words(p.getpName())%></h5>
								<p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>
								
								
							    <div class="card-footer">
									<button class="btn custom-bg text-white">Add to cart</button>
									<button class="btn btn-outline-primary"> &#8377; <%=p.getpPrice()%>/- 
										<span class="text-secondary discount-label">
										<%= p.getpDiscount()%>% off</span> </button>

								</div> 

							</div>


						</div>


						<%
						}
						%>




					</div>


				</div>

			</div>

		</div>


	</div>
	
	</div>

</body>
</html>