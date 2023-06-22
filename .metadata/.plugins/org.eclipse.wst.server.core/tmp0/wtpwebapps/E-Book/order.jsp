<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.database.DBConnect"%>
<%@page import="com.DAO.BookOrderDATA"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order History</title>
<%@include file="Required/CSSandSCRIPT.jsp"%>
</head>
<body style="background-color: #e5e5e5;">
<c:if test="${empty userObject}">
<c:redirect url="login.jsp"/>
</c:if>
<%@include file="Required/navbar.jsp"%>
<h3 class="text-center pt-4 ht">Order History</h3>
<div class="m-3">
<table class="table table-bordered border-dark table-striped table-hover text-center">
  <thead class="bg-primary border-light text-light text-center">
    <tr>
      <th scope="col">Order ID</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <!-- <th scope="col">Address</th> -->
      <th scope="col">Mobile No.</th>
      <th scope="col">Book Name, Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Mode</th>
    </tr>
  </thead>
  <tbody>
  <%
  User u = (User)session.getAttribute("userObject");
  BookOrderDATA dao = new BookOrderDATA(DBConnect.getConn());
  List<BookOrder> blist = dao.getBook(u.getEmail());
  for(BookOrder b: blist){
  %>
    <tr class="ht">
      <th scope="row"><%=b.getOrderId() %></th>
      <td><%=b.getUserName()%></td>
      <td><%=b.getEmail() %></td>
      <%-- <td><%=b.getFullAddress() %></td> --%>
      <td><%=b.getMobile() %></td>
      <td><%=b.getBookName()%>,<span class="text-primary">Author:<%=b.getAuthor()%></span></td>
      
       <td><%=b.getPrice()%></td>
      <td><%=b.getPayment()%></td>
    </tr>
   <%
  }
   %>
  </tbody>
</table>
</div>
</body>
</html>