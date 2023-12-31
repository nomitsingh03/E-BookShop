<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.database.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDATA"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Books</title>
<%@include file="Required/CSSandSCRIPT.jsp"%>
<style type="text/css">
.crd-hov:hover {
	background-color: rgb(181, 243, 181);
}

.pt-custom1 {
	padding-top: 3rem;
}
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
	
	<c:if test="${not empty addCart1}">
		<div id="toast">${addCart1}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
        </script>
		<c:remove var="addCart1"/>
	</c:if>
	<%
User u = (User)session.getAttribute("userObject");
%>
	<%@include file="Required/navbar.jsp"%>
	<div class="container mt-3 ">
		<h3 class="text-center pb-2">New Books</h3>
		<div class="row ">
			<%
			BookDATA dao3 = new BookDATA(DBConnect.getConn());
			List<BookDetails> list3 = dao3.getAllNewBooks();
			for (BookDetails b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-hov">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getBookPhotoName()%>"
							style="width: 140px; height: 180px;" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>

						<a href="view_books.jsp?bid=<%=b.getBookId()%>"
							class="btn btn-primary btn-sm ">View Details</a> <a href="cart?bid=<%= b.getBookId()%>&&uid=<%=u.getId() %>"
							class="btn btn-success btn-sm mt-1"><i
							class="fa-solid fa-cart-plus"></i> Add Cart</a> <a href=""
							class="btn btn-danger btn-sm mt-1"><i
							class="fa-solid fa-indian-rupee-sign"></i> <%=b.getBookPrice()%>/-</a>

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