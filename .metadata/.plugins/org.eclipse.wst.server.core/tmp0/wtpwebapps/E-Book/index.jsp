<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.database.*, java.sql.Connection ,com.DAO.*,com.entity.*,java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %> 	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBOOK</title>
<%@include file="Required/CSSandSCRIPT.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/bg3.png");
	height: 20rem;
	width: 100%;
	background-position-x: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-hov:hover {
	background-color: rgb(181, 243, 181);
}

.pt-custom1 {
	padding-top: 3rem;
}
</style>
</head>
<body style="background-color: #e5e5e5;">
<%
User u = (User)session.getAttribute("userObject");
%>
	<%@include file="Required/navbar.jsp"%>
	<div class="position-relative sticky-sm-top " style="height: 21rem;">
		<div class="container-fluid back-img ">
			<h2 class="text-center text-dark ht pt-custom1 ">(KITABEN)</h2>
			<h1 class="text-center text-dark pt-2 ht">E-Book Management
				System</h1>
		</div>
		<div class="container-fluid bg-custom custom-1 position-absolute "
			style="top: 100%"></div>
	</div>
	<div class="container mt-3">
	
		<h3 class="text-center pb-2">Recent Book</h3>
		<div class="row ">
			<% 
			BookDATA dao = new BookDATA(DBConnect.getConn());
			List<BookDetails> list=dao.getRecentBook();
			for(BookDetails b : list){
			%>
			<div class="col-md-3">
				<div class="card crd-hov">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getBookPhotoName()%>"
							style="width: 160px; height: 200px;" class="img-thumbnail">
						<p><%=b.getBookName() %></p>
						<p><%=b.getAuthor() %></p>
						<%
						if(b.getBookCategory().equals("New")){
						%>
						<p>Categories: <%=b.getBookCategory() %></p>
						<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary btn-sm ">View Details</a> <a
							href="" class="btn btn-success btn-sm mt-1"><i
							class="fa-solid fa-cart-plus"></i> Add Cart</a> <a href=""
							class="btn btn-danger btn-sm mt-1"><i
							class="fa-solid fa-indian-rupee-sign"></i> <%=b.getBookPrice()%>/-</a>
						<%
						} else {
						%>
						<p>Categories: <%=b.getBookCategory() %></p>
						<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary btn-sm ">View Details</a> 
						 <a href=""	class="btn btn-danger btn-sm mt-1"><i
							class="fa-solid fa-indian-rupee-sign"></i> <%=b.getBookPrice()%>/-</a>
						<%
						}
						%>
					</div>
				</div>
			</div>
				<%
				}
				%>
		</div>
		<div class="text-center mt-4 mb-5">
			<a href="allrecentBooks.jsp" class="btn btn-success btn-sm">View All</a>
		</div>
	</div>

	<!-- New Book -->
	<hr>
	<div class="container mt-3">
		<h3 class="text-center pb-2">New Book</h3>
		<div class="row ">
			<% 
			BookDATA dao2 = new BookDATA(DBConnect.getConn());
			List<BookDetails> list1=dao2.getNewBook();
			for(BookDetails b : list1){
			%>
			<div class="col-md-3">
				<div class="card crd-hov">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getBookPhotoName()%>"
							style="width: 160px; height: 200px;" class="img-thumbnail">
						<p><%=b.getBookName() %></p>
						<p><%=b.getAuthor() %></p>
						<p>Categories: <%=b.getBookCategory() %></p>
						<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary btn-sm ">View Details</a>
						<%if(u==null) {%>
						 <a href="login.jsp" class="btn btn-success btn-sm mt-1"><i
							class="fa-solid fa-cart-plus"></i> Add Cart</a> 
							<%}else { %>
							<a href="cart?bid=<%= b.getBookId()%>&&uid=<%=u.getId() %>" class="btn btn-success btn-sm mt-1"><i
							class="fa-solid fa-cart-plus"></i> Add Cart</a>
							<%} %>
							<a href=""	class="btn btn-danger btn-sm mt-1"><i
							class="fa-solid fa-indian-rupee-sign"></i> <%=b.getBookPrice()%>/-</a>

					</div>
				</div>
			</div>
				<%
				}
				%>
			
		</div>
		<div class="text-center mt-4 mb-4">
			<a href="allnewbook.jsp" class="btn btn-success btn-sm">View All</a>
		</div>
	</div>
	
    <!-- Old Book -->
	<hr>
	<div class="container mt-3 ">
		<h3 class="text-center pb-2">Old Book</h3>
		<div class="row ">
			<% 
			BookDATA dao3 = new BookDATA(DBConnect.getConn());
			List<BookDetails> list3=dao3.getOldBook();
			for(BookDetails b : list3){
			%>
			<div class="col-md-3">
				<div class="card crd-hov">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getBookPhotoName()%>"
							style="width: 160px; height: 200px;" class="img-thumbnail">
						<p><%=b.getBookName() %></p>
						<p><%=b.getAuthor() %></p>
						<p>Categories: <%=b.getBookCategory() %></p>

						<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary btn-sm ">View Details</a> 
						<a href="" class="btn btn-danger btn-sm mt-1"><i
							class="fa-solid fa-indian-rupee-sign"></i> <%=b.getBookPrice()%>/-</a>

					</div>
				</div>
			</div>
				<%
				}
				%>
		</div>
		<div class="text-center mt-3 " style="margin-bottom: 80px;">
			<a href="allOldBooks.jsp" class="btn btn-success btn-sm">View All</a>
		</div>
		<hr>
		<div>
			<h2 class="text-dark text-center ht" >Thank
				You!</h2>
		</div>
	</div>
	<hr style="margin-bottom: 200px;">
	<%@include file="Required/footer.jsp"%>
</body>
</html>