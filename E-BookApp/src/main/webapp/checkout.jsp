<%@page import="java.util.List"%>
<%@page import="com.DAO.CartDATA"%>
<%@page import="com.database.DBConnect"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
<%@include file="Required/CSSandSCRIPT.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="Required/navbar.jsp"%>
	<c:if test="${empty userObject}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<c:if test="${not empty succMsg}">
		<div class="alert alert-success text-center" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session"/>
	</c:if>
	
	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
			<c:remove var="failedMsg" scope="session"/>
	</c:if>

	<div class="container">
		<div class="row p-5">
			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-success text-center">Your Selected Item</h3>
						<table class="table table-striped"">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>

							<tbody>

								<%
								User u = (User) session.getAttribute("userObject");

								CartDATA dao = new CartDATA(DBConnect.getConn());
								Double totalPrice = 0.0;
								List<Cart> list = dao.getBookByUser(u.getId());

								for (Cart c : list) {
									totalPrice = c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a href="remove_book?bid=<%=c.getBookId()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCartId() %>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<th>Total Price</th>
									<td></td>

									<td><%=totalPrice%></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-success text-center">Order Details</h3>
						<form action="order" method="post">
						<input type="hidden" value="${userObject.id}" name="id">
							<div class="row ms-1 me-1">
								<div class="col-md-6">
									<label for="inputName" class="form-label">Name</label> <input
										type="text" class="form-control" id="inputName" name="username" value="<%=u.getName() %>" readonly="readonly" required>
								</div>
								<div class="col-md-6">
									<label for="inputEmail" class="form-label">Email</label> <input
										type="email" class="form-control" id="inputEmail" name="email" value="<%=u.getEmail() %>" readonly="readonly" required>
								</div>
							</div>
							<div class="row m-1">
								<div class="col-md-6">
									<label for="inputM" class="form-label">Mobile No.</label> <input
										type="number" class="form-control" id="inputM" name="mobile" value="<%=u.getMobileNo() %>" readonly="readonly" required>
								</div>
								<div class="col-md-6">
									<label for="inputAddress" class="form-label">Address</label> <input
										type="text" class="form-control" name="add" id="inputAddress" required>
								</div>
							</div>
							<div class="row m-1">
								<div class="col-md-6">
									<label for="inputLand" class="form-label">Landmark</label> <input
										type="text" class="form-control" name="near" id="inputLand" required>
								</div>
								<div class="col-md-6">
									<label for="inputCity" class="form-label">City</label> <input
										type="text" class="form-control" name="city" id="inputCity" required>
								</div>
							</div>
							<div class="row m-1">
								<div class="col-md-6">
									<label for="inputState" class="form-label">State</label> <input
										type="text" class="form-control" name="state" id="inputState" required>
								</div>
								<div class="col-md-6">
									<label for="inputPin" class="form-label">Pincode</label> <input
										type="text" class="form-control" name="pin" id="inputPin" required>
								</div>
							</div>
							<div class="row m-1">
								<label>Payment Mode</label> <select class="form-control m-1" name="paymenttype" required>
									<option val="NoSelect">--Select--</option>
									<option val="COD">Cash On Delivery</option>
								</select>
							</div>
							<div class="text-center pt-2">
								<button class="btn btn-success">Order Now</button>
								<button class="btn btn-primary">Continue Shopping.</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>