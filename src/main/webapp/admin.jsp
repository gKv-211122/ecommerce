<%@page import="com.ecart.entities.User"%>
<%


	User user = (User)session.getAttribute("current-user");
	if(user == null) {
		
		session.setAttribute("message", "You are not logged in !! Login first");
		response.sendRedirect("login.jsp");
		return;
		
	} else {
		
		if(user.getUserType().equals("normal")) {
			
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

	<%@include file="components/common_css_js.jsp" %>
	
</head>
<body>
		<%@include file="components/navbar.jsp" %>
		
			<div class="container">
				<div class="row mt-3">
					
					<!-- first col -->
					<div class="col-md-4">
					
	
					</div>
					
					<!-- first second -->
					<div class="col-md-4">
					
	
					</div>
					
					<!-- first third -->
					<div class="col-md-4">
					
	
					</div>
				
				</div>
			
			</div>
	
</body>
</html>



























































