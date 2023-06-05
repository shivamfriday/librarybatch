<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ page isELIgnored="false"%>

<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="in.ineuron.model.*"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="java.lang.Object"%>
<%@ page import="org.apache.tomcat.util.http.fileupload.IOUtils"%>
<%@ page import="java.nio.charset.StandardCharsets"%>

<%@ page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@ page import="com.fasterxml.jackson.databind.node.ObjectNode"%>

<%@ page import="java.util.Date" import="java.time.* "
	import="in.ineuron.model.IssuedBooks" import="java.text.*"
	import="java.io.*" import="java.util.*" import="java.time.ZoneId" import="java.time.LocalDateTime"%>

<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
	
</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js">
	
</script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">
<script
	src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js">
	
</script>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<!-- <script src="
https://code.jquery.com/jquery-3.6.0.min.js">
	
</script> -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<style>
body {
	/* min-height: 100vh;
	background-color: dark;
	background-image: linear-gradient(147deg, #FFE53B 0%, #FF2525 100%); */
	
	background: linear-gradient(45deg, #ce1e53, #8f00c7);
    min-height: 100vh;
}

.table {
	border-spacing: 0 0.85rem !important;
}

.table .dropdown {
	display: inline-block;
}

.table td {
	vertical-align: middle;
	margin-bottom: 10px;
	border: none;
}

.table th {
	vertical-align: middle;
	margin-bottom: 10px;
	border: none;
}

.table thead tr {
	border: none;
	font-size: 12px;
	letter-spacing: 1px;
	text-transform: uppercase;
	background: transparent;
}

.table thead th {
	border: none;
	font-size: 12px;
	letter-spacing: 1px;
	text-transform: uppercase;
	background: transparent;
}

.table td {
	background: #fff;
}

.table td:first-child {
	border-top-left-radius: 10px;
	border-bottom-left-radius: 10px;
}

.table td:last-child {
	border-top-right-radius: 10px;
	border-bottom-right-radius: 10px;
}

.avatar {
	width: 2.75rem;
	height: 2.75rem;
	line-height: 3rem;
	border-radius: 50%;
	display: inline-block;
	background: transparent;
	position: relative;
	text-align: center;
	color: #868e96;
	font-weight: 700;
	vertical-align: bottom;
	font-size: 1rem;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.avatar-sm {
	width: 2.5rem;
	height: 2.5rem;
	font-size: 0.83333rem;
	line-height: 1.5;
}

.avatar-img {
	width: 100%;
	height: 100%;
	-o-object-fit: cover;
	object-fit: cover;
}

.avatar-blue {
	background-color: #c8d9f1;
	color: #467fcf;
}

table.dataTable.dtr-inline.collapsed>tbody>tr[role="row"]>td:first-child:before,
	table.dataTable.dtr-inline.collapsed>tbody>tr[role="row"]>th:first-child:before
	{
	top: 28px;
	left: 14px;
	border: none;
	box-shadow: none;
}

table.dataTable.dtr-inline.collapsed>tbody>tr[role="row"]>td:first-child
	{
	padding-left: 48px;
}

table.dataTable.dtr-inline.collapsed>tbody>tr[role="row"]>th:first-child
	{
	padding-left: 48px;
}

table.dataTable>tbody>tr.child ul.dtr-details {
	width: 100%;
}

table.dataTable>tbody>tr.child span.dtr-title {
	min-width: 50%;
}

table.dataTable.dtr-inline.collapsed>tbody>tr>td.child, table.dataTable.dtr-inline.collapsed>tbody>tr>th.child,
	table.dataTable.dtr-inline.collapsed>tbody>tr>td.dataTables_empty {
	padding: 0.75rem 1rem 0.125rem;
}

div.dataTables_wrapper div.dataTables_length label, div.dataTables_wrapper div.dataTables_filter label
	{
	margin-bottom: 0;
}

@media ( max-width : 767px) {
	div.dataTables_wrapper div.dataTables_paginate ul.pagination {
		-ms-flex-pack: center !important;
		justify-content: center !important;
		margin-top: 1rem;
	}
}

.btn-icon {
	background: #fff;
}

.btn-icon .bx {
	font-size: 20px;
}

.btn .bx {
	vertical-align: middle;
	font-size: 20px;
}

.dropdown-menu {
	padding: 0.25rem 0;
}

.dropdown-item {
	padding: 0.5rem 1rem;
}

.badge {
	padding: 0.5em 0.75em;
}

.badge-success-alt {
	background-color: #d7f2c2;
	color: #7bd235;
}

.table a {
	color: #212529;
}

.table a:hover, .table a:focus {
	text-decoration: none;
}

table.dataTable {
	margin-top: 12px !important;
}

.icon>.bx {
	display: block;
	min-width: 1.5em;
	min-height: 1.5em;
	text-align: center;
	font-size: 1.0625rem;
}

.btn {
	font-size: 0.9375rem;
	font-weight: 500;
	padding: 0.5rem 0.75rem;
}

.avatar-blue {
	background-color: #c8d9f1;
	color: #467fcf;
}

.avatar-pink {
	background-color: #fcd3e1;
	color: #f66d9b;
}

*, *::after, *::before {
	box-sizing: border-box;
}

.modal1 {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%) scale(0);
	transition: 200ms ease-in-out;
	border: 1px solid black;
	border-radius: 10px;
	z-index: 10;
	background-color: white;
	width: 600px;
	max-width: 80%;
	font-size: 15px;
}

.modal1.active {
	transform: translate(-50%, -50%) scale(1);
}

.modal-header {
	padding: 10px 15px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-bottom: 1px solid black;
}

.modal-header .title {
	font-size: 15PX;
	font-weight: bold;
}

.modal-header .close-button {
	cursor: pointer;
	border: none;
	outline: none;
	background: none;
	font-size: 15PX;
	font-weight: bold;
}

.modal-body {
	padding: 10px 15px;
	max-height: calc(100vh - 210px);
	overflow-y: auto;
}

#overlay {
	position: fixed;
	opacity: 0;
	transition: 200ms ease-in-out;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(0, 0, 0, .5);
	pointer-events: none;
}

#overlay.active {
	opacity: 1;
	pointer-events: all;
}

.swal2-container {
	z-index: 20000 !important;
}
</style>



</head>


<%!public String calculateFine(LocalDateTime issue_endDate) {
		try {
			
			ZoneId zoneId = ZoneId.systemDefault();
			
			Date d1 = Date.from(issue_endDate.atZone(zoneId).toInstant());
			
			//Date d1 = issue_endDate;
			Date d2 = new java.util.Date();
			LocalDate date1 = LocalDate.of(d1.getYear(), d1.getMonth(), d1.getDate());
			LocalDate now = LocalDate.now();

			Period differnce = Period.between(date1, now);
			int no_of_days = differnce.getDays();
			if (no_of_days < 0) {
				return "0";
			} else {
				return String.valueOf((no_of_days) * 10);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "0";

	}
	
	
	%>


<c:choose>
	<c:when test="${empty libObj }">

		<jsp:include page="index.jsp" />
	</c:when>
	<c:otherwise>

		<%-- <jsp:include page="studentNavbar.jsp" /> --%>
		<jsp:include page="librarianNavbar.jsp" />
		<body>
			<div id="div1" style="margin-top:100px">
				<!-- Credit card form -->
				<section>
					<div class="row">
						<div class="col-md-8 mb-4">
							<div class="card mb-4" style="width: 500px; margin-left: 500px">
								<div class="card-header py-3">
									<h5 class="mb-0">Enter Student Id</h5>
								</div>
								<div class="card-body">
									<form id="myForm">

										<!-- Text input -->
										<div class="form-outline mb-4">
											<input type="text" id="studentId" class="form-control" /> <label
												class="form-label" for="form6Example3">Student Id</label>
										</div>




										<button id="buttonToggle"
											class="btn btn-primary btn-lg btn-block" type="button">
											Continue to checkout</button>
									</form>
								</div>
							</div>
						</div>


					</div>
				</section>


			</div>
			<!-- <div id="div2" style="display: none;"> -->
			<div class="container" style="margin-top: 50px; display: none;"
				id="div2">
				<div class="row py-5">
					<div class="col-12">
						<table id="example" class="table table-hover responsive nowrap"
							style="width: 100%">
							<thead>
								<h2 style="text-align:center">Submit A Book and Fine </h2>
								<hr style="border-top: 1px solid red;" class="text-dark">
								<tr>
									<th>Book Id</th>
									<th>Author Name</th>
									<th>Category</th>
									<th>Edition</th>
									<th>Fine</th>
									<th>Update</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${sessionScope.issuedBooks}" var="item">
									<%
									IssuedBooks item2 = (IssuedBooks) pageContext.getAttribute("item");

									//byte[] byte = item2.getFrontImage();

									//String encodeImg = Base64.getEncoder().encodeToString(item2.getFrontImage());
									//String frontImg = "data:image/jsp;base64," + encodeImg;
									//System.out.println(pic);
									//JSONObject jsonObject = new JSONObject(IOUtils.toString(encodeImg, StandardCharsets.UTF_8));
									//String encodeBackImg = Base64.getEncoder().encodeToString(item2.getBackImage());
									//String backImg = "data:image/jsp;base64," + encodeBackImg;
									//JSONObject testV=new JSONObject(backImg);
									//System.out.println(testV);
									//JSONObject testV=new JSONObject(new String(encodeImg));
									//ObjectMapper Obj = new ObjectMapper();
									//ObjectMapper Obj2 = new ObjectMapper();
									//ObjectNode objNode = Obj.createObjectNode();

									//objNode.put("", frontImg);
									//objNode.put("backImgeBlob", backImg);
									//objNode.putPOJO("item", pageContext.getAttribute("item"));
									//objNode.put("item",pageContext.getAttribute("item"));
									//System.out.println("object node = "+objNode);

									//String jsonStr = Obj.writeValueAsString(pageContext.getAttribute("item"));
									//String jsonStr = Obj.writeValueAsString(objNode);

									//jsonStr = jsonStr+"$#frontImg#$"+frontImg+"$#backImg#$"+backImg;

									//System.out.println("json=" + pageContext.getAttribute("item"));
									//System.out.println(jsonStr); 
									//System.out.println(frontImg);
									%>

									<tr>
										<td><a href="#">
												<div class="d-flex align-items-center">
													<div class="avatar avatar-blue mr-3">EB</div>

													<div class="">
														<p class="font-weight-bold mb-0" id="bookId">
															<c:out value="${item.getBook().getBookId()}" />
														</p>
														<p class="text-muted mb-0">
															<c:out value="${item.getBook().getTitle()}" />
														</p>
													</div>
												</div>
										</a></td>
										<td><c:out value="${item.getBook().getAuthorName()}" /></td>
										<td><c:out value="${item.getBook().getCatName()}" /></td>
										<td><c:out value="${item.getBook().getEdition()}" /></td>
										<td><%=calculateFine(item2.getIssueEndDate())%></td>
										<td>
											<button
												class="btn btn-sm btn-icon btn-scuccess edit submitButton"
												data-modal-target="#modal" id="${item.getStudentId()}"
												value="${item.getBook().getBookId()}" type="button">Submit
												Book and Fine</button>
										</td>
										<td>
											<div class="dropdown">
												<button class="btn btn-sm btn-icon btn-scuccess"
													type="button" id="dropdownMenuButton2"
													data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false">
													<i class="bx bx-dots-horizontal-rounded"
														data-toggle="tooltip" data-placement="top" title="Actions"></i>Action
												</button>
												<div class="dropdown-menu"
													aria-labelledby="dropdownMenuButton2">
													<a class="dropdown-item open-profile"
														id="${item.getBook()}" href="#"><i
														class="bx bxs-pencil mr-2 "></i> Show Profile</a> <a
														class="dropdown-item text-danger remove-button"
														id="${item.getBook().getBookId()}" href="#"><i
														class="bx bxs-trash mr-2"></i> Remove</a>
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="container text-center">
				<div class="row py-5">
					<div class="col-12"></div>
				</div>
			</div>



			

			<script>
				$(document).ready(
						function() {
							$("#example").DataTable({
								aaSorting : [],
								responsive : true,
								columnDefs : [ {
									responsivePriority : 1,
									targets : 0
								}, {
									responsivePriority : 2,
									targets : -1
								} ]
							});
							$(".dataTables_filter input").attr("placeholder",
									"Search here...").css({
								width : "300px",
								display : "inline-block"
							});
							$('[data-toggle="tooltip"]').tooltip();
						});
			</script>


			<script src="<%=request.getContextPath()%>/js/studentService.js"></script>


		</body>

	</c:otherwise>
</c:choose>


</html>