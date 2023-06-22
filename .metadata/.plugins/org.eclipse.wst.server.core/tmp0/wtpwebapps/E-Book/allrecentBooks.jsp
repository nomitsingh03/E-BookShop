<%@page import="com.entity.BookDetails"%>
<%@page import="com.database.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDATA"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recent Books</title>
<%@include file="Required/CSSandSCRIPT.jsp"%>
<style type="text/css">
.crd-hov:hover {
	background-color: rgb(181, 243, 181);
}

.pt-custom1 {
	padding-top: 3rem;
}
</style>
</head>
<body>
	<%@include file="Required/navbar.jsp"%>
	<div class="container mt-3 ">
		<h3 class="text-center pb-2">Recent Books</h3>
		<div class="row ">
			<%
			BookDATA dao = new BookDATA(DBConnect.getConn());
			List<BookDetails> list = dao.getAllRecentBooks();
			for (BookDetails b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-hov">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getBookPhotoName()%>"
							style="width: 160px; height: 200px;" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<%
						if(b.getBookCategory().equals("Old")){
						%>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>

						<a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-primary btn-sm ">View Details</a> <a
							href="" class="btn btn-danger btn-sm mt-1"><i
							class="fa-solid fa-indian-rupee-sign"></i> <%=b.getBookPrice()%>/-</a>
							<%
						} else {
							%>
							<p>
							Categories:
							<%=b.getBookCategory()%></p>

						<a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-primary btn-sm ">View Details</a> <a
							href="" class="btn btn-success btn-sm mt-1"><i
							class="fa-solid fa-cart-plus"></i> Add Cart</a> <a
							href="" class="btn btn-danger btn-sm mt-1"><i
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
	</div>
</body>
</html>