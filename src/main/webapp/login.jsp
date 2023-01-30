<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
			<title>User Login - MyCart</title>

				<%@include file="components/common_css_js.jsp" %>
	
	</head>
	<body>
		
		<%@include file="components/navbar.jsp" %>
		
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3">
				
					
				<div class="card mt-5">
					<div class="card-header custom-bg text-white">
						<h1 class="text-center">Login here</h1>
					</div>
					
					<div class="card-body">
					
						<%@include file="components/messsage.jsp" %>
						
						<form action="LoginServlet" method="post">
							  <div class="mb-3">
							    <label for="exampleInputEmail1" class="form-label">Email address</label>
							    <input name="email" type="email" class="form-control" placeholder="Enter Your Email Adddress"
							    id="exampleInputEmail1" aria-describedby="emailHelp" required>
							    <div id="emailHelp"  class="form-text">never share your email with anyone else.</div>
							  </div>
							  
							  <div class="mb-3">
							    <label for="exampleInputPassword1" class="form-label">Password</label>
							    <input name="password" type="password" 
							    class="form-control" id="exampleInputPassword1" placeholder="Enter Your Password" required>
							  </div>
							  
							  <div>
							  	<a href="register.jsp">click, here to register</a>
							  </div>
							  
							  <br>
							  <div class="caontainer text-center">
							  	<button type="submit" class="btn btn-primary custom-bg border-0">Login</button>
							  	<button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
							  </div>
							  
						</form>
						
					</div>
					
					<div class="card-footer">
						
					</div>
				
				</div>
				
	
				</div>
			
			</div>
		
		</div>
		
		
	</body>
</html>