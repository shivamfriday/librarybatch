<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ page isELIgnored="false"%>

<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="in.ineuron.model.*"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap Navbar Dropdown Login and Signup Form with
	Social Buttons</title>
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

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
<body>

	<%-- <jsp:include page="navbar.jsp" /> --%>

	<%-- <jsp:include page="./booksController/searchBookByAuthor" /> --%>

	<c:if test="${empty searchBook }">
		<%
		System.out.println("getting the all data1111111111111");
		%>
	</c:if>

	<div class="container " style="">
		<!-- <div class="col-md-8">
			<div class="row mt-4">
				<div class="col-md-12"> -->
		<div class="row row-cols-1 row-cols-md-3 g-4 ">
			<c:forEach items="${getAllBooks}" var="item">

				<div class="col" style="margin-bottom: 20px;">

					<div class="card h-100" style="width: 24rem;">



						<%
						//byte[] byteImg = ((Books)(pageContext.findAttribute("item"))).getFrontImage();
						System.out.println("getting the all data1111111111111");
						Books item2 = (Books) pageContext.getAttribute("item");

						//byte[] byte = item2.getFrontImage();

						String encodeImg = Base64.getEncoder().encodeToString(item2.getFrontImage());
						String pic = "data:image/jsp;base64," + encodeImg;
						System.out.println("getting the all data");
						%>
						<%-- <% String encodeImg = Base64.getEncoder().encodeToString(pageContext.getAttribute("img")); %> --%>

						<img src="<%=pic%>" class="card-img-top" alt="No image "
							style="max-height: 550px; max-width: 550px; overflow: hidden">
						<div class="card-body">
							<h5 class="card-title">
								<b><c:out value="${item.getTitle()}" /></b>
							</h5>
							<p class="card-text">
								<c:out value="${item.getDescription()}" />
							</p>
						</div>
						<ul class="list-group list-group-flush">
							<!-- <li class="list-group-item"></li> -->
							<li class="list-group-item"><c:out
									value="${item.getAuthorName()}" /></li>
							<li class="list-group-item">Vestibulum at eros</li>
						</ul>
						<form action="" method="Get">
							<div class="card-body">

								<button type="button" class="btn btn-primary modal-open"
									data-toggle="modal" id="${item.getBookId()}"
									data-target="#modal12">Assign Book</button>



							<!-- 	<a href="#" data-toggle="modal" data-target="#modal12"
									class="card-link modal-open">Book Details</a> <a href="#"
									class="card-link">Assign Book</a> -->
							</div>
						</form>
					</div>
				</div>

				<!-- Here we are showing the model(popup window for show book details butto)  -->


			</c:forEach>

		</div>
		<!-- 		</div>
			</div>
		</div> -->


	</div>




	<div class="modal fade "  id="modal12"
		tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Assign A book
						To Student</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
				</div>
				<div class="modal-body">
					<p>ASSIGN A BOOK TO STUDENT BY INSERTING HIS/HER ID:</p>
					<input type="text" class="form-control" placeholder="STUDENT ID" />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
<!-- span new  -->



	<!-- MDB -->
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"
></script>

	<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script defer
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
		integrity="sha384-JjS
		mVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
		integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
		crossorigin="anonymous"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> -->
		
		<script src="<%= request.getContextPath()%>/js/scripts.js"></script>

</body>
</html>
