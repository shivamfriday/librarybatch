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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

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
	
	
		<ul class="nav navbar-nav navbar-right" style="margin-left:900px;">			
			<li>
			
				
				
			<a href="index.jsp"  class="btn btn-primary  get-started-btn mt-1 mb-1">User</a>
			
				
				
			</li>
		
			<li>
				<a href="librarianLogin.jsp"  class="btn btn-primary d get-started-btn mt-1 mb-1">Admin</a>
				
			</li>
		</ul>
	</div>
</nav>



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
