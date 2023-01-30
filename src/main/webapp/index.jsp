<%@page import="com.ecart.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mycart-Home</title>
	<%@include file="components/common_css_js.jsp" %>

</head>
<body>
	
	<%@include file="components/navbar.jsp" %>
	<h1>hello world</h1>
	<h3>creating session factory object</h3>
	

	<%
	
		out.println(FactoryProvider.getFactory()+"<br/>");
	%>
	<a href="about.jsp">go to about</a>

</body>
</html>