<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %> 	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<%@include file="Required/CSSandSCRIPT.jsp"%>
</head>
<body style="background-color: #a3b5b2">
	<%@include file="Required/navbar.jsp"%>
	<div class="container-fluid vh-90">
		<div class="row justify-content-center">
			<div class="col-md-8 col-lg-5 justify-content-center">
				<div class="card mt-4 p-3"
					style="border-radius: 1.2rem; box-shadow: 0px 0px 15px 2px #5f9490">
					<div class="card-header text-center fs-3 ht"
						style="background-color: rgba(77, 240, 99, 0.4); border-top-left-radius: 1rem; border-top-right-radius: 1rem;">Registration
						Page</div>
						<c:if test="${not empty succmsg}">
						<p class="text-center text-success mt-1 pt-1">${succmsg}</p>
						<c:remove var="succmsg" scope="session"/>
						</c:if>
						<c:if test="${not empty failedmsg}">
						<p class="text-center text-danger mt-1 pt-1">${failedmsg}</p>
						<c:remove var="failedmsg" scope="session" />
						</c:if>
					<div class="card-body ht">

						<form class="mx-1 mx-md-4" action="register" method="post">
							<h5 class="text-center fs-4 ht p-3 pt-1">-Enter Details-</h5>
							<div class="d-flex flex-row align-items-center mb-4 mt-1">
								<i class="fas fa-user fa-lg me-3 fa-fw"></i>
								<div class="form-outline flex-fill mb-0">
									<input type="text" id="form3Example1c" class="form-control"  required="required" name="fname"/>
									<label class="form-label" for="form3Example1c">Your
										Name</label>
								</div>
							</div>

							<div class="d-flex flex-row align-items-center mb-4">
								<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
								<div class="form-outline flex-fill mb-0">
									<input type="email" id="form3Example2c" class="form-control" required="required" name="email"/>
									<label class="form-label" for="form3Example2c">Your
										Email</label>
								</div>
							</div>

              <div class="d-flex flex-row align-items-center mb-4">
								<i class="fas fa-mobile-screen fa-lg me-3 fa-fw"></i>
								<div class="form-outline flex-fill mb-0">
									<input type="number" id="form3Example3c" class="form-control" required="required" name="mobile"/>
									<label class="form-label" for="form3Example3c">Mobile
										No.</label>
								</div>
							</div>

							<div class="d-flex flex-row align-items-center mb-4">
								<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
								<div class="form-outline flex-fill mb-0">
									<input type="password" id="form3Example4c" class="form-control" required="required" name="password"/>
									<label class="form-label" for="form3Example4c">Password</label>
								</div>
							</div>

							<div class="d-flex flex-row align-items-center mb-4">
								<i class="fas fa-key fa-lg me-3 fa-fw"></i>
								<div class="form-outline flex-fill mb-0">
									<input type="password" id="form3Example4cd"
										class="form-control" required name="confirmpassword" /> <label class="form-label"
										for="form3Example4cd">Confirm password</label>
								</div>
							</div>

							<div class="form-check d-flex justify-content-center mb-5">
								<input class="form-check-input me-2" type="checkbox" value=""
									name="check" id="form2Example3c" /> <label class="form-check-label"
									for="form2Example3"> I agree all statements in <a
									href="#!">Terms of service</a>
								</label>
							</div>

							<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
								<button type="submit" class="btn btn-primary btn-md">Register</button>
							</div>
							<div class="d-flex justify-content-center mb-5">
									<!-- Simple link -->
									<p class="ht">Already Registered ? <a href="login.jsp" class="text-decoration-none">Go for Login</a></p>
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