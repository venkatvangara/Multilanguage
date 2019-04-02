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

<title>First Jsp Program</title>
</head>
<body>
	<%
		String cookie = fetchCookies(request.getCookies(), "LANG");
	%>
	<form method="post" action="Login">

		<div class="container">
			<div class="card bg-primary text-dark">
				<div class="card-body">
					<h3>Please Enter Your login Information</h3>
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
				<div class="panel-heading">
					<div class="card-body">
						<input type="submit" name="submit" value="submit"
							class="btn btn-primary" /> <span>&nbsp<a
							href="NewUser.jsp">New User?</a></span>
					</div>

				</div>
			</div>
			<%
				if (session.getAttribute("message") != null) {
			%>
			<div class="alert alert-danger alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>Error!</strong>
				<%=session.getAttribute("message")%>


			</div>
			<%
				}
			%>

			<%
				if (session.getAttribute("Result") != null) {
					
					if (session.getAttribute("Result").equals("Success")) {

						System.out.print("In IF:" + session.getAttribute("Result").equals("Success"));
			%>
			<div class="alert alert-success alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>Info!</strong> <strong></strong> User Created
				Successfully!!.
			</div>
			<%
				
					} else if (session.getAttribute("Result").equals("UserName Exists")) {
						System.out.print("Else If");
			%>

			<div class="alert alert-danger alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>Info!</strong> UserName Already Exists!!!
			</div>

			<%
				} else {
					System.out.print("Else");
					System.out.print("Session"+session.getAttribute("Result"));
					
					
			%>
			<div class="alert alert-danger alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>Info!</strong> Oops! Something went wrong.User not
				Created.Please Contact the system Administrator for further queries.
			</div>
			<%
				}
				}
			%>


			<%
				if (cookie == null) {
			%>
			<div class="alert alert-info alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>Info!</strong> This site uses cookies. By continuing to
				browse this site, you are agreeing to our use of cookies

				<%
					session.invalidate();
					}
				%>




				<%!public String fetchCookies(Cookie[] cookies, String value) {
		if (cookies == null) {
			return null;
		} else {
			for (Cookie cook : cookies) {
				if (cook.getName().equals("LANG")) {
					return cook.getValue();
				}
			}
		}
		return null;
	}%>
			</div>

		</div>
</body>
</html>