<%@page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix = 'c'%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 shrink-to-fit=no">
<title>Bootstrap Navbar Dropdown Login and Signup Form with Social Buttons</title>
<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<link rel="stylesheet" href="<%= request.getContextPath()%>/css/commons-bootstrap.css">


  
</head>
<body>

<nav class="navbar navbar-inverse navbar-expand-sm sticky-top navbar-dark">
	<div class="navbar-header navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Library<b>Mangament</b></a>  		
		<button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
			<span class="navbar-toggler-icon"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
	</div>
	<!-- Collection of nav links, forms, and other content for toggling -->
	<div id="navbarCollapse" class="collapse navbar-collapse">
		<ul class="nav navbar-nav">
			<li><a href="#">Home</a></li>
			<li><a href="#">About</a></li>			
			
			<li class="active"><a href="#">Pricing</a></li>
			<li><a href="#">Blog</a></li>
			<li><a href="#">Contact</a></li>
			<li class="dropdown ">
				<a data-toggle="dropdown" aria-expanded="false"  aria-haspopup="true" class="dropdown-toggle " href="#">Books </a>
				<ul class="dropdown-menu dropdown-menu-lg-end " style="" aria-labelledby="navbarDropdown">					
					<li><a href="login.jsp">Add Books</a></li>
					<li><a href="#">Update Books</a></li>
					<li><a href="#">Delete Books</a></li>
					<li><a href="#">Digital Marketing</a></li>
				</ul>
			</li>
		</ul>
		<form class="navbar-form form-inline" action="./booksController/searchBookByAuthor" method="Get">
			<div class="input-group search-box">								
				<input type="text" id="search" name="authorName" class="form-control" placeholder="Search here...">
				<input type="hidden" id="search" name="redirected" class="form-control" value="">
				<span class="input-group-addon"><i class="material-icons">&#xE8B6;</i></span>
				
			</div>
			<button type="submit" class="btn btn-primary">Search</button>
		</form>
		<ul class="nav navbar-nav navbar-right">			
			<li>
			
				<c:choose>
					<c:when test="${empty studentObj }">
						<a  class="dropdown-toggle" href="login.jsp">Login</a>
					</c:when>
					<c:otherwise>
						<a   href="<%=request.getContextPath()%>/studentController/logout">Logout</a>
					</c:otherwise>
				</c:choose>
				
				<!-- <ul class="dropdown-menu form-wrapper">					
					<li>
						<form action="/examples/actions/confirmation.php" method="post">
							<p class="hint-text">Sign in with your social media account</p>
							<div class="form-group social-btn clearfix">
								<a href="#" class="btn btn-primary pull-left"><i class="fa fa-facebook"></i> Facebook</a>
								<a href="#" class="btn btn-info pull-right"><i class="fa fa-twitter"></i> Twitter</a>
							</div>
							<div class="or-seperator"><b>or</b></div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Username" required="required">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" placeholder="Password" required="required">
							</div>
							<input type="submit" class="btn btn-primary btn-block" value="Login">
							<div class="form-footer">
								<a href="#">Forgot Your password?</a>
							</div>
						</form>
					</li>
				</ul> -->
				
				
			</li>
			<li>
				
				
				
				<c:choose>
					<c:when test="${empty studentObj }">
						<a href="registration.jsp" data-toggle="dropdown" class="btn btn-primary dropdown-toggle get-started-btn mt-1 mb-1">Sign up</a>
					</c:when>
					<c:otherwise>
						<a href="#" data-toggle="dropdown" class="btn btn-primary dropdown-toggle get-started-btn mt-1 mb-1">${studentObj.getName()}</a>
					</c:otherwise>
				</c:choose>
				
				
				
				
				
				<!-- <ul class="dropdown-menu form-wrapper">					
					<li>
						<form action="/examples/actions/confirmation.php" method="post">
							<p class="hint-text">Fill in this form to create your account!</p>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Username" required="required">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" placeholder="Password" required="required">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" placeholder="Confirm Password" required="required">
							</div>
							<div class="form-group">
								<label class="checkbox-inline"><input type="checkbox" required="required"> I accept the <a href="#">Terms &amp; Conditions</a></label>
							</div>
							<input type="submit" class="btn btn-primary btn-block" value="Sign up">
						</form>
					</li>
				</ul> -->
			</li>
		</ul>
	</div>
</nav>

<!-- <nav class="navbar navbar-inverse">
	<div class="navbar-header navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Library<b>Mangament</b></a>  		
		<button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
			<span class="navbar-toggler-icon"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
	</div>
  <div class="container-fluid">
   
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="#">Page 1</a></li>
      <li><a href="#">Page 2</a></li>
      <li><a href="#">Page 3</a></li>
    </ul>
  </div>
</nav>
  
<div class="container">
  <h3>Inverted Navbar</h3>
  <p>An inverted navbar is black instead of gray.</p>
</div> -->

<script>
	// Prevent dropdown menu from closing when click inside the form
	$(document).on("click", ".navbar-right .dropdown-menu", function(e){
		e.stopPropagation();
	});
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<%= request.getContextPath()%>/js/scripts.js"></script>

</body>
</html>
