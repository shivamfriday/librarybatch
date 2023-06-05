<%@page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Bootstrap Navbar Dropdown Login and Signup Form with
	Social Buttons</title>
<%-- <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/commons-bootstrap.css">
 --%>


<!-- Font Awesome -->

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet" />
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<!-- MDB -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.css"
	rel="stylesheet" />


<script>
	// Prevent dropdown menu from closing when click inside the form
	$(document).on("click", ".navbar-right .dropdown-menu", function(e) {
		e.stopPropagation();
	});
</script>

</head>
<body style="background: dark;">

	<%-- <%
						session.invalidate();
						response.sendRedirect("index.jsp");
						%> --%>

	<%-- <jsp:include page="navbar.jsp" /> --%>

	<c:if test="${not empty libObj }">
		<%
		response.sendRedirect("librarianWelcome.jsp");
		%>
	</c:if>
	
	
	<c:if test="${not empty studentObj }">
		<%
		response.sendRedirect("studentWelcome.jsp");
		%>
	</c:if>
	
	<jsp:include page="indexNavbar.jsp" />
			<jsp:include page="login2.jsp" />
	
	<%-- <c:choose>
		<c:when test="${empty libObj }">

			<jsp:include page="indexNavbar.jsp" />
			<jsp:include page="login2.jsp" />
		</c:when>
		<c:otherwise>
			<a href="<%=request.getContextPath()%>/librarianController/logout">Logout</a>
			<jsp:include page="librarianWelcome.jsp" />
			<jsp:include page="showBooks.jsp" />
		</c:otherwise>
	</c:choose> --%>





	<!-- MDB -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"></script>

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"></script>

</body>
</html>
