<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %> 	
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@include file="Required/CSSandSCRIPT.jsp"%>
</head>
<body>
<body style="background-color: #a3b5b2">
	<%@include file="Required/navbar.jsp"%>
	<div class="container-fluid vh-90">
		<div class="row justify-content-center">
			<div class="col-md-8 col-lg-4 justify-content-center">
				<div class="card mt-4 p-3"
					style="border-radius: 1.2rem; box-shadow: 0px 0px 15px 2px #5f9490">
					<div class="card-header text-center fs-3 ht"
						style="background-color: rgba(77, 240, 99, 0.4); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">Login
						Page</div>
						<c:if test="${not empty failedmsg}">
						<p class="text-center text-danger mt-1 pt-1">${failedmsg}</p>
						<c:remove var="failedmsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
						<p class="text-center text-success mt-1 pt-1 fs-5">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
						</c:if>
					<div class="card-body ht">
						
						<form class="mx-1 mx-md-4" action="login" method="post">
							<p class="text-center fs-5 ht p-3">-Enter Details-</p>


							<div class="d-flex flex-row align-items-center mb-4">
								<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
								<div class="form-outline flex-fill mb-0">
									<input type="email" id="form3Example3c" class="form-control" name="email"/>
									<label class="form-label" for="form3Example3c">
										Email</label>
								</div>
							</div>

							<div class="d-flex flex-row align-items-center mb-4">
								<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
								<div class="form-outline flex-fill mb-0">
									<input type="password" id="form3Example4c" class="form-control" name="password"/>
									<label class="form-label" for="form3Example4c">Password</label>
								</div>
							</div>
							<div class="row mb-4">
								<div class="col justify-content-center">
									<!-- Simple link -->
									<a href="#!" class="text-decoration-none">Forgot password?</a>
								</div>
							</div>
							<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
								<button type="submit" class="btn btn-primary btn-md">Login</button>
							</div>							<!-- Register buttons -->
							<div class="text-center">
								<p>
									Not a member? <a href="register.jsp" class="text-decoration-none">Register</a>
								</p>
								<!-- <p>or sign up with:</p>
								<button type="button" class="btn btn-link btn-floating mx-1">
									<i class="fab fa-facebook-f"></i>
								</button>

								<button type="button" class="btn btn-link btn-floating mx-1">
									<i class="fab fa-google"></i>
								</button>

								<button type="button" class="btn btn-link btn-floating mx-1">
									<i class="fab fa-twitter"></i>
								</button>

								<button type="button" class="btn btn-link btn-floating mx-1">
									<i class="fab fa-github"></i>
								</button> -->
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="Required/footer.jsp"%>
</body>
</html>