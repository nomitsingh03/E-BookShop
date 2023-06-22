<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %> 	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Books</title>
<%@include file="CSSandSCRIPT.jsp"%>
</head>
<body style="background-color:#e5e5e5;">
    <%@include file="navbar.jsp"%>
    <c:if test="${empty userObject}">
	<c:redirect url="../login.jsp"/>
	</c:if>
    <div class="container-fluid " >
        <div class="row p-5 justify-content-center">
            <div class="col-md-4 justify-content-center">
                <div class="card rounded-top">
                    <div class="card-header text-center fs-3 ht rounded-top"
						style="background-color: rgba(77, 240, 99, 0.4);">Add
						Book</div>
						<c:if test="${not empty succMsg}">
						<p class="text-center text-success mt-1 pt-1">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty failedMsg}">
						<p class="text-center text-danger mt-1 pt-1">${failedMsg}</p>
						<c:remove var="failedMsg" scope="session" />
						</c:if>
                    <div class="card-body">
                        <form action="../addBooks" method="post" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Book Name</label>
                                <input type="text" class="form-control" id="exampleInputPassword1" name="book_name">
                              </div>
                              <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Author's Name</label>
                                <input type="text" class="form-control" id="exampleInputPassword1" name="author_name">
                              </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Price</label>
                                <input type="number" class="form-control" id="exampleInputPassword1" name="price">
                              </div>
                            <div class="mb-3">
                                <label for="inputState" class="form-label">Book Categories</label>
                                <select id="inputState" class="form-select" name="b_category">
                                  <option selected>--Select--</option>
                                  <option value="New">New Book</option>
                                </select>
                              </div>
                              <div class="mb-3">
                                <label for="inputState" class="form-label">Book Status</label>
                                <select id="inputState" class="form-select" name="b_status">
                                  <option selected>--Select--</option>
                                  <option value="Active">Active</option>
                                  <option value="Inactive">Inactive</option>
                                </select>
                              </div>
                              <div class="mb-3">
                                <label for="formFile" class="form-label">Upload Photo</label>
                                <input class="form-control" type="file" id="formFile" name="b_img">
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