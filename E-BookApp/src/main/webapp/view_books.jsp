<%@page import="com.entity.BookDetails"%>
<%@page import="com.database.DBConnect"%>
<%@page import="com.DAO.BookDATA"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Details</title>
<%@include file="Required/CSSandSCRIPT.jsp"%>
</head>
<body style="background-color: #e5e5e5;">
	<%@include file="Required/navbar.jsp"%>
	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDATA dao = new BookDATA(DBConnect.getConn());
	BookDetails b =  dao.getBookById(bid);
	%>
	<div class="container ">
		<div class="row ht mt-5">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img alt="image" class="m-3" src="book/<%=b.getBookPhotoName() %>"
					style="width: 120px; height: 140px;"><br>
				<h5>
					Book Name: <span class="text-success fs-5"><%=b.getBookName() %></span>
				</h5>
				<h5>
					Author Name: <span class="text-success"><%=b.getAuthor() %></span>
				</h5>
				<h5>
					Category: <span class="text-success"><%=b.getBookCategory() %></span>
				</h5>
			</div>
			<%
			if(b.getBookCategory().equals("New")){
			%>
			<div class="col-md-6 text-center p-3 border bg-white">
				<h3><%=b.getBookName() %></h3>
				
				<div class="row mt-5 pe-5 ps-5 m-4"><hr>
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fas fa-money-bill-wave fa-2x"></i><br>
						<h5>Cash On Delivery</h5>
					</div>
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fas fa-undo-alt fa-2x "></i><br>
						<h5>Return Available</h5>
					</div>
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fas fa-truck-moving fa-2x "></i><br>
						<h5>Free Shipping</h5>
					</div><hr>
				</div>
				<div class="row ht mt-4 justify-content-center pe-5 ps-5">
					<div class="col-md-6 ">
					<a href="" class="btn btn-primary btn-sm mt-1"><i
						class="fa-solid fa-cart-plus"></i> Add Cart</a> </div>
						<div class="col-md-6"><a href=""
						class="btn btn-danger btn-sm mt-1"><i
						class="fa-solid fa-indian-rupee-sign"></i> <%=b.getBookPrice() %>/-</a></div>
				</div>
			</div>
			<%} else { %>
			<div class="col-md-6 text-center p-3 border bg-white ">
				<h3><%=b.getBookName() %></h3>
				<h5>Contact to Seller: <span class="text-primary"><%=b.getAuthor() %></span></h5>
				<h5><i class="far fa-envelope"></i> Email: <span class="text-primary"><%=b.getUserEmail() %></span></h5>
				<div class="row mt-5 pe-5 ps-5"><hr>
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fas fa-money-bill-wave fa-2x"></i><br>
						<h5>Cash On Delivery</h5>
					</div>
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fas fa-undo-alt fa-2x "></i><br>
						<h5>Return Available</h5>
					</div>
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fas fa-truck-moving fa-2x "></i><br>
						<h5>Free Shipping</h5>
					</div><hr>
				</div>
				<div class="row ht mt-4 justify-content-center pe-5 ps-5">
					<div class="col-md"><a href="" class="btn btn-primary btn-sm mt-1"><i
						class="fa-solid fa-cart-plus"></i> Continue Shopping..</a> 
						</div><div class="col-md"><a href=""
						class="btn btn-danger btn-sm mt-1"><i
						class="fa-solid fa-indian-rupee-sign"></i> <%=b.getBookPrice() %>/-</a></div>
				</div>
			</div>
			<%} %>
		</div>

	</div>
</body>
</html>