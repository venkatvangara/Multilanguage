<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<form method="post" action="AddUser">
	<div class="container">
		<div class="card bg-primary text-dark">
			<div class="card-body">
				<h3>Enter the User Details</h3>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">UserName</div>
			<div class="panel-body">
				<input type="text" name="username" />
			</div>
			<div class="panel-heading">Password</div>
			<div class="panel-body">
				<input type="password" name="password" />
			</div>
			<div class="panel-heading">Confirm Password</div>
			<div class="panel-body">
				<input type="password" name="cnfpassword" />
			</div>
			<div class="panel-heading">Email</div>
			<div class="panel-body">
				<input type="email" name="email" />
			</div>
			<div class="panel-heading">
				<div class="card-body">
					<input type="submit" name="add" value="Add User"
						class="btn btn-primary" />
				</div>
			</div>
			
			<%
				if (session.getAttribute("messageValidate") != null) {
			%>
			<div class="alert alert-warning alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>Error!</strong>
				<%=session.getAttribute("messageValidate")%>
           

			</div>
			<%
				}
			%>
			


		</div>
		</div>
		</form>
</body>
</html>