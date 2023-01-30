<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User-MyCart</title>
	<%@include file="components/common_css_js.jsp" %>

</head>
<body>
	
	<%@include file="components/navbar.jsp" %>
	
	<div class="container-fluid">
		
		<div class="row mt-5">
		<div class="col-md-4 offset-md-4">
		
			<div class="card">
			
				<%@include file="components/messsage.jsp" %>
				
				<div class="card-body px-5">
					
					<h1 class="text-center">SIGN UP HERE</h1>
			
			<form action="RegisterServlet" method="post">
			
				<div class="mb-3">
    				<label for="name" class="form-label">User Name</label>
    				<input name="user_name" type="text" class="form-control" id="name" placeholder="Enter Your Name" required>
  				</div>
  				
  				<div class="mb-3">
    				<label for="email" class="form-label">User Email</label>
    				<input name="user_email" type="email" class="form-control" id="email" 
    				placeholder="Enter Your Email" aria-describedby="emailHelp" required>
  				</div>
  				
  				<div class="mb-3">
    				<label for="password" class="form-label">User Password</label>
    				<input name="user_pass" type="password" class="form-control" id="password" placeholder="Set Your password" required>
  				</div>
  				
  				<div class="mb-3">
    				<label for="phone" class="form-label">Contact</label>
    				<input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter Your Phone Number" required>
  				</div>
  				<div class="mb-3">
    				<label for="address" class="form-label" required>Address</label>
    				<textarea name="user_address" class="form-control" placeholder="Enter Your Address"></textarea>
  				</div>
  				
  				<div class="text-center">
  					<button class="btn btn-outline-success" type="submit">Register</button>
  					<button class="btn btn-outline-primary" type="reset">Reset</button>
  				</div>
        		
			</form>
				
				</div>
			
			</div>
			
			
		
		</div>
	
	</div>
	
	</div>
	
	

</body>
</html>