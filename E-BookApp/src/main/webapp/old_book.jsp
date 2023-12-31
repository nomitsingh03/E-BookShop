<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.database.DBConnect"%>
<%@page import="com.DAO.BookDATA"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Old Book</title>
<%@include file="Required/CSSandSCRIPT.jsp"%>
</head>
<body style="background-color: #e5e5e5">
	<%@include file="Required/navbar.jsp"%>
	
		<c:if test="${not empty succMsg}">
		<div class="alert alert-success text-center">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>
		<c:if test="${not empty failedMsg}">
			<div class="alert alert-success text-center">${failedMsg}</div>
			<c:remove var="failedMsg" scope="session" />
		</c:if>
	
	<div class="container">
		<div class="row p-5">
			<div class="card bg-white">
				<div class="card-body">
					<h3 class="text-success text-center">Your Selected Item</h3>
					<table class="table table-striped"">
						<thead>
							<tr>
								<th scope="col">Book Name</th>
								<th scope="col">Author</th>
								<th scope="col">Price</th>
								<th scope="col">Category</th>
								<th scope="col">Delete</th>
							</tr>
						</thead>

						<tbody>
							<%
							User u = (User) session.getAttribute("userObject");
							String email = u.getEmail();
							BookDATA dao = new BookDATA(DBConnect.getConn());
							List<BookDetails> list = dao.getBookByOld(email, "Old");
							for (BookDetails b : list) {
							%>
							<tr>
								<th scope="row"><%=b.getBookName()%></th>
								<td><%=b.getAuthor()%></td>
								<td><%=b.getBookPrice()%></td>
								<td><%=b.getBookCategory()%></td>
								<td><a
									href="delete_old_book?em=<%=email%>&&bid=<%=b.getBookId()%>"
									class="btn btn-sm btn-danger">Delete</a></td>
							</tr>
							<%
							}
							%>
						
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>