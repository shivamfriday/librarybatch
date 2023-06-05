<%@page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix = 'c'%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
 
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Bootstrap Navbar Dropdown Login and Signup Form with Social Buttons</title>

<!-- Font Awesome -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
  rel="stylesheet"
/>
<!-- Google Fonts -->
<link
  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
  rel="stylesheet"
/>
<!-- MDB -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.css"
  rel="stylesheet"
/>
 
 
 <!-- Font Awesome -->



  
</head>
<body style="background:dark; font-size:30px;">
  
  <%-- <jsp:include page="navbar.jsp" /> --%>
  
	<c:choose>
		<c:when test="${empty libObj }">
		
			<jsp:include page="index.jsp" />
		</c:when>
		<c:otherwise>
			
			<jsp:include page="librarianNavbar.jsp" />
			<br>
			<br>
			<jsp:include page="searchNavbar.jsp" />
			<br>
			<jsp:include page="showBooks2.jsp" />
			<%-- <jsp:include page="tempo.jsp" /> --%>
		</c:otherwise>
	</c:choose>
  <<%-- jsp:include page="addBooks.jsp" /> --%>

<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"
></script>
  

</body>
</html>                                                        