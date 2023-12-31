<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<%@include file="Required/CSSandSCRIPT.jsp"%>
</head>
<body style="background-color: #e5e5e5;">
	<%@include file="Required/navbar.jsp"%>
	<div class="container">
		<div class="row p-5 justify-content-center">
			<div class="col-md-4 justify-content-center">
				<div class="card rounded-top">
					<div class="card-header text-center fs-3 ht rounded-top"
						style="background-color: rgba(77, 240, 99, 0.4);">Edit
						Profile</div>
					<c:if test="${not empty succMsg}">
						<p class="text-center text-success mt-1 pt-1">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>
					<c:if test="${not empty failedMsg}">
						<p class="text-center text-success mt-1 pt-1">${failedMsg}</p>
						<c:remove var="failedMsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="update_profile" method="post"
							enctype="form-data">
							<input type="hidden" value="${userObject.id }" name="id">
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Name</label>
								<input type="text" class="form-control"
									id="exampleInputPassword1" name="username"
									value="${userObject.name}">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Email</label>
								<input type="email" class="form-control"
									id="exampleInputPassword1" name="email"
									value="${userObject.email }">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Mobile
									No.</label> <input type="number" class="form-control"
									id="exampleInputPassword1" name="mobile"
									value="${userObject.mobileNo }">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" name="password">
							</div>

							<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
								<button type="submit" class="btn btn-primary btn-md">Update</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid text-center text-white p-3 mt-5"
		style="background-color: #077267;">
		<h5 class="ht">Design and Developed by Shinom 2023</h5>
	</div>
</body>
</html>