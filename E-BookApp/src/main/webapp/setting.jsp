<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Setting</title>
<%@include file="Required/CSSandSCRIPT.jsp"%>
<style type="text/css">
.crd1:hover{
    background-color: rgb(181, 243, 181);
}
a{
	text-decoration: none;
	color: black;
}
</style>
</head>
<body style="background-color: #e5e5e5">
<c:if test="${empty userObject}">
<c:redirect url="login.jsp"/>
</c:if>
	<%@include file="Required/navbar.jsp"%>
	<div class="container">
		<h3 class="text-center">Hello, ${userObject.name}</h3>
		<div class="row p-5">
			<div class="col-md-4">
				<a href="sell_book.jsp">
				<div class="card border-1 border-primary crd1">
					<div class="card-body text-center ">
						<div class="text-primary ">
							<i class="fas fa-book-open fa-3x"></i>
						</div>
						<h4>Sell Book</h4>
					</div>
				</div>
				</a>
			</div>
				<div class="col-md-4">
				<a href="old_book.jsp">
				<div class="card border-1 border-info crd1">
					<div class="card-body text-center ">
						<div class="text-info ">
							<i class="fas fa-book-open fa-3x"></i>
						</div>
						<h4>Old Books</h4>
					</div>
				</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="edit_profile.jsp">
				<div class="card border-1 border-danger crd1">
					<div class="card-body text-center ">
						<div class="text-danger ">
							<i class="fas fa-edit fa-3x"></i>
						</div>
						<h4>Edit Profile</h4>
					</div>
				</div>
				</a>
			</div>
		</div>
		<div class="row p-5">
			
			<div class="col-md-6">
				<a href="order.jsp">
				<div class="card border-1 border-warning crd1">
					<div class="card-body text-center ">
						<div class="text-warning ">
							<i class="fas fa-box-open fa-3x"></i>
						</div>
						<h4>My Order</h4>
						<p>Track your Order</p>
					</div>
				</div>
				</a>
			</div>
			<div class="col-md-6">
				<a href="helpline.jsp">
				<div class="card border-1 border-primary crd1">
					<div class="card-body text-center ">
						<div class="text-primary">
							<i class="fa-solid fa-circle-user fa-3x"></i>
						</div>
						<h4>Help Ceter</h4>
						<p>24*7 Service</p>
					</div>
				</div>
				</a>
			</div>
		</div>
	</div>
	<%@include file="Required/footer.jsp"%>
</body>
</html>