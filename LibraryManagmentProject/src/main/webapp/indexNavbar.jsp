<!-- Navbar -->
<%@page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
	style="font-size: 15px">
	<%-- <form method="post" enctype='multipart/form-data'
		action="<%=request.getContextPath()%>/studentController/booksTakeByStudent"> --%>
	<!-- Container wrapper -->
	<input type="hidden" id="contextPath"
		value="<%=request.getContextPath()%>">
	<div class="container-fluid">
		<!-- Toggle button -->
		<button class="navbar-toggler" type="button"
			data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Collapsible wrapper -->
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<!-- Navbar brand -->
			<a class="navbar-brand"
				href="<%=request.getContextPath()%>/studentWelcome.jsp">Library<b
				style="color: green">Mangament</b></a>


			<%-- 			<a class="navbar-brand mt-2 mt-lg-0" href="<%=request.getContextPath()%>/studentWelcome.jsp">Library
				Managment System </a> --%>

		<!-- 	<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link " id="studentService"
					href="" id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Student Service </a></li>
			</ul> -->
			<!-- Notifications -->

			<!-- Avatar -->
		<%-- 		<div class="dropdown">
				<a class="dropdown-toggle d-flex align-items-center hidden-arrow"
					href="#" id="navbarDropdownMenuAvatar" role="button"
					data-mdb-toggle="dropdown" aria-expanded="false"> <img
					src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp"
					class="rounded-circle" height="25"
					alt="Black and White Portrait of a Man" loading="lazy" />
				</a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdownMenuAvatar">
					<li><a class="dropdown-item" href="#">My profile</a></li>
					<li><a class="dropdown-item" href="#">Settings</a></li>
					<li><a class="dropdown-item"
						href="<%=request.getContextPath()%>/logout.jsp">Logout</a></li>
					<li><a class="dropdown-item" href="#">Student service</a></li>
				</ul>
			</div> --%>

			<div class="d-flex align-items-center" style="position: relative;float: right;">


			<%-- 	<ul class="nav navbar-nav">
					<li class="nav-item text-center" id="signup-btn"><a href="#"
						class="nav-link" data-toggle="modal" data-target="#"><span
							class="fa fa-user"></span><span
							class="d-none d-sm-inline d-xl-block px-1"><c:out
									value="Register" /> </span></a></li>
					<li class="nav-item text-center" id="login-btn"><a
						href="<%=request.getContextPath()%>/index.jsp" class="nav-link"
						data-toggle="modal" data-target="#"><span
							class="fa fa-sign-in"></span><span
							class="d-none d-sm-inline d-xl-block px-1">Log In</span></a></li>
				</ul>
 --%>


			



				<!-- <button type="button" class="btn btn-link px-3 me-2">Login
				</button> -->


			</div>
		</div>

	</div>

</nav>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/studentJs.js"></script>

