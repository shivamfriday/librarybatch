<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.Date" import="java.time.* "
	import="in.ineuron.model.IssuedBooks" import="java.text.*"
	import="java.io.*" import="java.util.*" import="java.time.ZoneId" import="java.time.LocalDateTime"%>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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


<style>
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
	width: 500px;
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
</style>



<%-- <c:if test="${empty searchBook }">
	<%
	System.out.println("getting the all data1111111111111");
	%>
</c:if> --%>

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


<jsp:include page="studentNavbar.jsp" />
<div class="row row-cols-3 g-4 justify-content-center">
	<c:forEach items="${issuedBooks}" var="item">
		<div class="col" style="width: 25rem; font-size: 15px">
			<div class="card h-100" style="margin-top:100px">

				<%
				//byte[] byteImg = ((Books)(pageContext.findAttribute("item"))).getFrontImage();
				//System.out.println("getting the all data1111111111111");
				IssuedBooks item2 = (IssuedBooks) pageContext.getAttribute("item");
				%>
				<div class="card-body">
					<h5 class="card-title">
						<b>Book Title : <c:out value="${item.getBook().getTitle()}" /></b>
					</h5>
					<p class="card-text">
						<b>Book Description :</b>
						<c:out value="${item.getBook().getDescription()}" />
					</p>
				</div>
				<ul class="list-group list-group-light list-group-small">
					<li class="list-group-item px-4"><b>Book Id:</b> <c:out
							value="${item.getBookId()}" /></li>
					<li class="list-group-item px-4"><b>Author Name:</b> <c:out
							value="${item.getBook().getAuthorName()}" /></li>
					<li class="list-group-item px-4"><b>Category Name:</b> <c:out
							value="${item.getBook().getCatName()}" /></li>
					<li class="list-group-item px-4"><b>Issued Date:</b> <c:out
							value="${item.getIssueDate()}" /></li>
					<li class="list-group-item px-4"><b>Issued EndDate:</b> <c:out
							value="${item.getIssueEndDate()}" /></li>
					<li class="list-group-item px-4"><b>Fine Amount:</b> <%=calculateFine(item2.getIssueEndDate())%></li>

					<%-- <c:if test="${item.getReturnDate() ne null}">
 						<li class="list-group-item px-4"><b>Status:</b> Book Is submitted</li>
					</c:if> --%>
					
					<c:choose>
					  <c:when test="${item.getReturnDate() ne null}">
					   <li class="list-group-item px-4" style="color:green"><b>Status:</b> Book Is submitted</li>
					  </c:when>
					 
					  <c:otherwise>
					    <li class="list-group-item px-4" style="color:red"><b>Status:</b> Book Is not submitted</li>
					  </c:otherwise>
					</c:choose>


				</ul>
				<div class="card-body">
					<!-- <a href="#" class="card-link">Card link</a> <a href="#"
						class="card-link">Another link</a> -->
					<%-- <button type="button" class="btn btn-primary"
						data-modal-target="#modal" value="${item.getBookId()}">Assign Book
						</button> --%>
					<!-- 					<button type="button" class="btn btn-primary"
						data-mdb-toggle="modal" data-mdb-target="#exampleModal" data-mdb-whatever="@getbootstrap">Openmodal
						for getbootstrap</button> -->
				</div>
			</div>
		</div>




	</c:forEach>



</div>





