<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %> 	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<%@include file="CSSandSCRIPT.jsp"%>
<style>
.crd1:hover{
    background-color: rgb(181, 243, 181);
}
a{
	text-decoration: none;
	color: black;
}
</style>
</head>
<body style="background-color:#e5e5e5;">
<%@ include file="navbar.jsp" %>
<c:if test="${empty userObject}">
<c:redirect url="../login.jsp"/>
</c:if>
<div class="container" style="height:70vh;">
	<div class="row m-3 px-5 pt-5">
		<div class="col-md-6">
		<a href="add_books.jsp">
			<div class="card border-4 border-success crd1">
				<div class="card-body text-center">
					<i class="fa-solid fa-square-plus fs-1 text-primary"></i><br>
					<h4>Add Books</h4>
				</div>
			</div>
			</a>
		</div>
		<div class="col-md-6">
			<a href="all_books.jsp">
			<div class="card border-4 border-success crd1">
				<div class="card-body text-center">
					<i class="fa-solid fa-book-open fs-1 text-danger"></i><br>
					<h4>All Books</h4>
				</div>
			</div>
		</a>
		</div>
		</div>
		<div class="row mx-3 px-5">
		<div class="col-md-6">
			<a href="order.jsp">
			<div class="card border-4 border-success crd1">
				<div class="card-body text-center">
					<i class="fa-solid fa-box-open fs-1 text-warning"></i><br>
					<h4>Orders</h4>
				</div>
			</div>
			</a>
		</div>
		<div class="col-md-6">
		<a data-bs-toggle="modal" data-bs-target="#exampleModal">
			<div class="card border-4 border-success crd1">
				<div class="card-body text-center">
					<i class="fa-solid fa-right-from-bracket fs-1 text-success"></i><br>
					<h4>Logout</h4>
				</div>
			</div>
			</a>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center">
        <h4>Do you want Logout</h4>
      
      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <a href="../logout" type="button" class="btn btn-success">Logout</a>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>