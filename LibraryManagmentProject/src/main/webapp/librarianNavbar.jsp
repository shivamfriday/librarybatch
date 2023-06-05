<!-- Navbar -->
<%@page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
	style="font-size: 15px">
	<!-- Container wrapper -->
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
			<!-- Left links -->
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
			

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Book Service </a>
					<div class="dropdown-menu dropdown-menu-end"  aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="<%=request.getContextPath()%>/librarianWelcome.jsp">Show Books</a> 
						<a class="dropdown-item" href="<%=request.getContextPath()%>/addBooks2.jsp">Add Books</a> 
						<a class="dropdown-item" href="<%=request.getContextPath()%>/updateBooks3.jsp">Update Books</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
					
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Student Service </a>
					<div class="dropdown-menu dropdown-menu-end" style="z-index:2" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="updateStudent.jsp">Update Student</a> <a
							class="dropdown-item" href="#">Delete Student</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="<%=request.getContextPath()%>/studentService.jsp">Show Student Books</a>
					</div></li>
			</ul>
			<!-- Left links -->
		</div>
		<!-- Collapsible wrapper -->

		<!-- Right elements -->
		<div class="d-flex align-items-center">


			<!-- Icon -->

			<!-- Notifications -->

			<!-- Avatar -->
			<%-- <div class="dropdown">
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

			<div class="d-flex align-items-center">
			<c:choose>
					<c:when test="${empty libObj }">
						<button type="button" class="btn btn-link px-3 me-2">Login
						</button>
					</c:when>
					<c:otherwise>
				<ul class="nav navbar-nav">
					<!-- <li class="nav-item text-center" id="signup-btn"><a href="#"
						class="nav-link" data-toggle="modal" data-target="#"><span
							class="fa fa-user"></span><span
							class="d-none d-sm-inline d-xl-block px-1">Sign Up</span></a></li> -->
					<li class="nav-item text-center" id="login-btn"><a type="button" href="<%=request.getContextPath()%>/logout.jsp"
						class="nav-link" ><span
							class="fa fa-sign-in"></span><span
							class="d-none d-sm-inline d-xl-block px-1">Log Out</span></a></li>
				</ul>
					
					</c:otherwise>
				</c:choose>

				<!-- <button type="button" class="btn btn-link px-3 me-2">Login
				</button> -->


			</div>
		</div>
		<!-- Right elements -->
	</div>
	<!-- Container wrapper -->
</nav>
<!-- Navbar -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

