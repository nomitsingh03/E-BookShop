<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.DAO.*,java.util.*,com.entity.*,com.database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Books</title>
<%@include file="CSSandSCRIPT.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty userObject}">
	<c:redirect url="../login.jsp"/>
	</c:if>
	<h3 class="text-center pt-4 ht">Welcome Admin</h3>
	<c:if test="${not empty succMsg}">
		<p class="text-center text-success mt-1 pt-1">${succMsg}</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedMsg}">
		<p class="text-center text-danger mt-1 pt-1">${failedMsg}</p>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<table class="table table-hover">
		<thead class="bg-primary text-light">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Category</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			BookDATA dao = new BookDATA(DBConnect.getConn());
			List<BookDetails> list = dao.getAllBooks();
			for (BookDetails b : list) {
			%>


			<tr class="ht">
				<th><%=b.getBookId()%></th>
				<td><img alt="" src="../book/<%=b.getBookPhotoName()%>"
					style="width: 50px; height: 50px;"></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getBookPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getBookStatus()%></td>
				<td><a href="edit_books.jsp?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a> 
					 <a href="../delete?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop"><i class="fa-solid fa-trash-can"></i> Delete</a>
					<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center">
        <h4>Do you want to delete Book
        </h4><br>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <a href="../delete?id=<%=b.getBookId()%>"
					class="btn btn-danger">Confirm</a>
      </div>
      <div class="modal-footer"></div>
      </div>
    </div>
</div></td>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>

</body>
</html>