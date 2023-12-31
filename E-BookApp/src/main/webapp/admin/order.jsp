<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order History</title>
<%@include file="CSSandSCRIPT.jsp"%>
</head>
<body>
<%@ include file="navbar.jsp" %>
<h3 class="text-center pt-4 ht">Order History</h3>
<table class="table table-bordered table-hover">
  <thead class="bg-dark text-light">
    <tr>
      <th scope="col">Order ID</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
      <th scope="col">Mobile No.</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Mode</th>
    </tr>
  </thead>
  <tbody>
    <tr class="ht">
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
       <td>Mark</td>
      <td>Otto</td>
       <td>@mdo</td>
       <td>Mark</td>
      <td>Otto</td>
    </tr>
    <tr class="ht">
      <th scope="row">2</th>
       <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
       <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
       <td>Mark</td>
      <td>Otto</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
       <td>Mark</td>
      <td>Otto</td>
       <td>@mdo</td>
       <td>Mark</td>
      <td>Otto</td>
    </tr>
  </tbody>
</table>

</body>
</html>