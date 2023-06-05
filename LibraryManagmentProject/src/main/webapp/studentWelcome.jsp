<%@page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

<title>Bootstrap Navbar Dropdown Login and Signup Form with
	Social Buttons</title>


</head>

<body style="background-color: dark; font-size: 30px;">
	<c:choose>
		<c:when test="${empty studentObj }">

			<%-- <jsp:include page="index.jsp" /> --%>
			
			<jsp:forward page="index.jsp" />
		</c:when>
		<c:otherwise>

			
			<jsp:include page="studentNavbar.jsp" />
			<jsp:include page="searchNavbar.jsp" />
			<br>
			<jsp:include page="showBooksForStudent.jsp" />

		</c:otherwise>
	</c:choose>

	<!-- MDB -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"></script>
</body>
</html>
