<%@page import="java.util.ArrayList"%>
<%@page import="fr.esigelec.jee.Dao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%
	/*
	jsp:forward method interupts the executiion of current class and then moves to the targetted page directly this 
	avoids the Null Pointer Exception since session is not populted yet. Where as sendRedirect continues the execution 
	of the same page and redirects after that.
	*/

	if (session.getAttribute("UserName") == null || session.getAttribute("UserName").equals("")) {
%>
<jsp:forward page="LoginForm.jsp" />
<!--response.sendRedirect("LoginFormhtml");  -->

<%
	}

	Cookie cookie;
	Dao data = new Dao();
	String message = "";
	String link = "";
	String link2 = "";
	String cookieMsg = "";
	String userName = session.getAttribute("UserName").toString();
	String context = request.getParameter("lang");
	String cookieStr = fetchCookies(request.getCookies(), "LANG");
	Cookie cookiecont;
	ArrayList<String> languages=new ArrayList<>();
	languages=data.getLanguages();

	boolean fFlag = false;

	if (context != null) {

		context = request.getParameter("lang");

		cookie = new Cookie("LANG", context);

		response.addCookie(cookie);

	} else if (cookieStr != null) {

		context = this.fetchCookies(request.getCookies(), "LANG");

	} else {

		context = data.getLanguages().get(0);
		cookie = new Cookie("LANG", context);
		response.addCookie(cookie);
		fFlag = true;

	}

	response.setContentType("text/HTML");
	response.getWriter().append("<html><head></head><body>");

	
		message = data.getMessage(context);
		cookieMsg = "This site uses cookies. By continuing to browse this site, you are agreeing to our use of cookies";


%>
<title><%=message%></title>
</head>
<body>


	<nav class="navbar bg-light">
	<div class="container-fluid">
		<div class="navbar-header">
			<h3>
				<span class="glyphicon glyphicon-user"></span><%=userName%></h3>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li><h3>
					<a href="logout"> Logout <span class="glyphicon glyphicon-off"></span></a>
				</h3></li>
		</ul>
	</div>
	</nav>


	<h1 class="text-center">
		<%=message%>
	</h1>
	<br>
	<div class="container text-center">
    <div class="col-xs-12 col-xs-offset-0 col-sm-offset-3 col-sm-6">
	<div class="btn-group">
	<%for(String lang:languages) {
	if(!context.equalsIgnoreCase(lang)){		
	%>
	<input type=button class="btn btn-default btn-ms input-block-level btn-inline" value=<%=lang.toUpperCase()%> onclick=window.location.href="http://localhost:8080/HelloWorld2/HelloWorldMultiLanguage.jsp?lang=<%=lang.toUpperCase()%>" />
	<%} }%>	
	</div>
	</div>
	</div>
    <div class="container text-center"><a href="AddMessage.jsp">Add Message</a>&nbsp&nbsp<a href="EditMessage.jsp">Edit Message</a></div>
	<div class="text-center"><jsp:include page="footer.jsp"></jsp:include></div>

	<%
		if (fFlag) {
	%>
	<div style="position: relative;"width: 1000px; height: 1000px;></div>
	<div class="alert alert-info alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>Info!</strong> <%=cookieMsg%>
			</div>
			
	
	
	<%
		}

		session.setAttribute("cookie", cookieStr);
		session.setAttribute("cookieMsg", cookieMsg);
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



</body>
</html>