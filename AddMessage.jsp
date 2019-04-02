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
<title>Add Message</title>
</head>
<body>
<form method="get" action="AddMessage">
	<div class="container">
		<div class="card bg-primary text-dark">
			<div class="card-body">
				<h3>Add a new Message</h3>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">Language Index</div>
			<div class="panel-body">
				<input type="text" name="langIndex" />
			</div>
			<div class="panel-heading">Language Message</div>
			<div class="panel-body">
				<input type="text" name="lanMessage" />
			</div>
			
			<div class="panel-heading">
				<div class="card-body">
					<input type="submit" name="add" value="Add Message"
						class="btn btn-primary" />
					<a href="HelloWorldMultiLanguage.jsp">Home</a>
				</div>
			</div>
			
			
			
			<%
				if (session.getAttribute("result") != null) {
					if(session.getAttribute("result").equals("success")){
			%>
			<div class="alert alert-success alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>Success!</strong>Message Added Successfully
			</div>
			
			<%
			}else if(session.getAttribute("result").equals("database failure")){%>
				<div class="alert alert-warning alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>Error!</strong>Oops!Something went wrong.It might be because the language already exists. Please Contact system Administrator for further info.
			</div>
		
		<%	}else if(session.getAttribute("result").equals("Mandatory fields missing")){%>
			<div class="alert alert-warning alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>Error!</strong>Fill the mandatory fields!!!
			</div>
		<%}else{%>
			<div class="alert alert-warning alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<strong>Error!</strong>Fill the mandatory fields!!!
		</div>
			
	 <%	}	
				}
			%>
			


		</div>
		</div>
		</form>
</body>
</html>