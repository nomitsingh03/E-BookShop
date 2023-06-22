<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.DAO.*,java.util.*,com.entity.*,com.database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Books</title>
<%@include file="CSSandSCRIPT.jsp"%>
</head>
<body style="background-color: #e5e5e5;">
	<%@include file="navbar.jsp"%>
	<div class="container-fluid ">
		<div class="row p-5 justify-content-center">
			<div class="col-md-4 justify-content-center">
				<div class="card rounded-top">
					<div class="card-header text-center fs-3 ht rounded-top"
						style="background-color: rgba(77, 240, 99, 0.4);">Add Book</div>
					<%
                        int id = Integer.parseInt(request.getParameter("id"));
						BookDATA dao = new BookDATA(DBConnect.getConn());
						BookDetails b = dao.getBookById(id);
                        %>
					<div class="card-body">
						<form action="../editBooks" method="post">
							<input type="hidden" name="id" value="<%=b.getBookId()%>">
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Book
									Name</label> <input type="text" class="form-control"
									id="exampleInputPassword1" name="book_name"
									value="<%=b.getBookName()%>">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Author's
									Name</label> <input type="text" class="form-control"
									id="exampleInputPassword1" name="author_name"
									value="<%=b.getAuthor()%>">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Price</label>
								<input type="number" class="form-control"
									id="exampleInputPassword1" name="price"
									value="<%=b.getBookPrice()%>">
							</div>
							<div class="mb-3">
								<label for="inputState" class="form-label">Book Status</label> <select
									id="inputState" class="form-select" name="b_status">
									<%
                                  if("Active".equals(b.getBookStatus())){%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<% }else { %>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<% 
                                 }
                                  %>

								</select>
							</div>
							<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
								<button type="submit" class="btn btn-primary btn-md">Add</button>
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