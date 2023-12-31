<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Address</title>
<%@include file="Required/CSSandSCRIPT.jsp"%>
</head>
<body style="background-color: #e5e5e5;">
	<%@include file="Required/navbar.jsp"%>
	<div class="container">
		<div class="row p-5 justify-content-center">
			<div class="col-md-6 justify-content-center">
				<div class="card rounded-top">
					<div class="card-header text-center fs-3 ht rounded-top"
						style="background-color: rgba(77, 240, 99, 0.4);">Add Address
						Book</div>
					<div class="card-body">
					<div class="row m-1">
						<div class="col-md-6">
							<label for="inputAddress" class="form-label">Address</label> <input
								type="text" class="form-control" id="inputAddress">
						</div>
					
						<div class="col-md-6">
							<label for="inputLand" class="form-label">Landmark</label> <input
								type="text" class="form-control" id="inputLand">
						</div>
						</div>
						<div class="row m-1">
						<div class="col-md-4">
							<label for="inputCity" class="form-label">City</label> <input
								type="text" class="form-control" id="inputCity">
						</div>
					
						<div class="col-md-4">
							<label for="inputState" class="form-label">State</label> <input
								type="text" class="form-control" id="inputState">
						</div>
						<div class="col-md-4">
							<label for="inputPin" class="form-label">Pincode</label> <input
								type="text" class="form-control" id="inputPin">
						</div>
					</div><hr class=" mt-4">
                             	<div class="text-center">
								<button type="submit" class="btn btn-success btn-md">Add Address</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>