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

<! DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap 4 Footer with Social icons</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

<link
	href="<%=request.getContextPath()%>/css/tableCss.css"
	rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<style>

</style>



<c:choose>
	<c:when test="${empty libObj }">

		<%-- <jsp:include page="index.jsp" /> --%>
		<%
		String redirectURL = "index.jsp";
		response.sendRedirect(redirectURL);
		%>

	</c:when>
	<c:otherwise>

		<jsp:include page="navbar2.html" />

	</c:otherwise>
</c:choose>

<%
String  status = (String)request.getAttribute("updateBook");
String  deleteBook = (String)request.getAttribute("deleteBook");

%>
<input type="hidden" id="status"
				value="<%=status%>">
<input type="hidden" id="deleteBook"
				value="<%=deleteBook%>">

<script>
const status = document.getElementById("status");
console.log(status);

 if(status.value=="success"){
	swal("Good job!", "Book Is updated", "success")
}else if(status.value=="failure"){
	swal({
		title: "Error!",
		text: resultText,
		type: "error",
		confirmButtonText: "Cool"
	});
} 
 
 
 const deleteBook = document.getElementById("deleteBook");
 console.log(deleteBook);

  if(deleteBook.value=="success"){
 	swal("Good job!", "Book Is Deleted", "success")
 	//location.reload();
 }else if(deleteBook.value=="failure"){
 	swal({
 		title: "Error!",
 		text: resultText,
 		type: "error",
 		confirmButtonText: "Cool"
 	});
 } 
	

</script>

<body>

	<div class="container" style="margin-top: 50px;">
		<div class="row py-5">
			<div class="col-12">
				<table id="example" class="table1 table-hover1 responsive1 nowrap1"
					style="width: 100%">
					<thead>
						<h2>Please Click on Update button for Updating a Book</h2>
						<tr>
							<th>Book Id</th>
							<th>Author Name</th>
							<th>Category</th>
							<th>Edition</th>
							<th>Update</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sessionScope.getAllBooks}" var="item">
							<%
							Books item2 = (Books) pageContext.getAttribute("item");

							//byte[] byte = item2.getFrontImage();

							String encodeImg = Base64.getEncoder().encodeToString(item2.getFrontImage());
							String frontImg = "data:image/jsp;base64," + encodeImg;
							//System.out.println(pic);
							//JSONObject jsonObject = new JSONObject(IOUtils.toString(encodeImg, StandardCharsets.UTF_8));
							String encodeBackImg = Base64.getEncoder().encodeToString(item2.getBackImage());
							String backImg = "data:image/jsp;base64," + encodeBackImg;
							//JSONObject testV=new JSONObject(backImg);
							//System.out.println(testV);
							//JSONObject testV=new JSONObject(new String(encodeImg));
							ObjectMapper Obj = new ObjectMapper();
							ObjectMapper Obj2 = new ObjectMapper();
							ObjectNode objNode = Obj.createObjectNode();

							objNode.put("frontImgeBlob", frontImg);
							objNode.put("backImgeBlob", backImg);
							objNode.putPOJO("item", pageContext.getAttribute("item"));
							//objNode.put("item",pageContext.getAttribute("item"));
							System.out.println(objNode);

							//String jsonStr = Obj.writeValueAsString(pageContext.getAttribute("item"));
							String jsonStr = Obj.writeValueAsString(objNode);

							//jsonStr = jsonStr+"$#frontImg#$"+frontImg+"$#backImg#$"+backImg;

							System.out.println("json=" + pageContext.getAttribute("item"));
							System.out.println(jsonStr);
							//System.out.println(frontImg);
							%>

							<tr>
								<td><a href="#">
										<div class="d-flex align-items-center">
											<div class="avatar avatar-blue mr-3">EB</div>

											<div class="">
												<p class="font-weight-bold mb-0" id="bookId">
													<c:out value="${item.getBookId()}" />
												</p>
												<p class="text-muted mb-0">
													<c:out value="${item.getTitle()}" />
												</p>
											</div>
										</div>
								</a></td>
								<td><c:out value="${item.getAuthorName()}" /></td>
								<td><c:out value="${item.getCatName()}" /></td>
								<td><c:out value="${item.getEdition()}" /></td>
								<td>
									<button class="btn btn-sm btn-icon btn-scuccess edit"
										data-modal-target="#modal" onclick=goto() value='<%=jsonStr%>' type="button">Update</button>
								</td>
								<td>
									<div class="dropdown">
										<button class="btn btn-sm btn-icon btn-scuccess" type="button"
											id="dropdownMenuButton2" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">
											<i class="bx bx-dots-horizontal-rounded"
												data-toggle="tooltip" data-placement="top" title="Actions"></i>Action
										</button>
										<div class="dropdown-menu"
											aria-labelledby="dropdownMenuButton2">
											<a class="dropdown-item open-profile" id='<%=jsonStr%>' href="#"><i
												class="bx bxs-pencil mr-2 " ></i> Show Profile</a> <a
												class="dropdown-item text-danger remove-button" id="${item.getBookId()}" href="#"><i
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

	<!-- Here we are showing the modal -->



	<div class="modal1" id="modal">

		<%-- <form id="myForm3" enctype='multipart/form-data' method="POST" action="<%=request.getContextPath()%>/booksController/updatebook"> --%>
		<form id="myForm3" enctype='multipart/form-data' >
			<input type="hidden" id="urlParam"
				value="<%=request.getContextPath()%>">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">ENTER STUDNET
							ID FOR ASSIGNING A BOOK</h5>
						<button data-close-button type="button" class="close-button"></button>
					</div>
					<div class="modal-body">

						<!-- 	<div class="mb-3">
					
						<label for="recipient-name" class="col-form-label">Book
							Id:</label> <input type="text" class="form-control" id="modalBookId"
							name="modalBookId" />
					</div>
					<div class="mb-3">
						<label for="message-text" class="col-form-label">Student
							Id:</label> <input class="form-control" id="studentId" name="studentId"></input>
					</div> -->


						<!-- Here other form************ -->
						<div class="form-outline mb-4">
							<input type="text" id="modalBookId" name="bookId"
								class="form-control" /> <label class="form-label"
								for="form6Example3">Book ID</label>
						</div>
						<div class="form-outline mb-4">
							<input type="text" id="bookTitle" name="bookTitle"
								class="form-control" /> <label class="form-label"
								for="form6Example3">Book Title</label>
						</div>

						<div class="form-outline mb-4">
							<input type="text" id="authorName" name="authorName"
								class="form-control" /> <label class="form-label"
								for="form6Example4">Author Name</label>
						</div>
						<!-- 2 column grid layout with text inputs for the first and last names -->
						<div class="row mb-4">

							<div class="col">
								<div class="form-outline">
									<input type="text" id="qty" name="qty" class="form-control" />
									<label class="form-label" for="form6Example1">Quantity</label>
								</div>
							</div>
							<div class="col">
								<div class="form-outline">
									<input type="text" id="bookPrice" name="bookPrice"
										class="form-control" /> <label class="form-label"
										for="form6Example2">Price</label>
								</div>
							</div>
						</div>

						<div class="row mb-4">

							<div class="col">
								<div class="form-outline">
									<input type="text" id="category" name="category"
										class="form-control" /> <label class="form-label"
										for="form6Example1">Category</label>
								</div>
							</div>
							<div class="col">
								<div class="form-outline">
									<input type="text" id="edition" name="edition"
										class="form-control" /> <label class="form-label"
										for="form6Example2">Edition</label>
								</div>
							</div>
						</div>



						<!-- Message input -->
						<div class="form-outline mb-4">
							<textarea class="form-control" id="description"
								name="description" id="description" rows="4"></textarea>
							<label class="form-label" for="form6Example7">Description
								information</label>
						</div>


						<div class="row mb-4">
							<!-- Image content -->
							<div class="col">
								<div class="mb-4 d-flex justify-content-center">
									<img
										src="https://mdbootstrap.com/img/Photos/Others/placeholder.jpg"
										alt="https://mdbootstrap.com/img/Photos/Others/placeholder.jpg"
										id="frontImageImg" style="width: 300px;" />
								</div>
								<!-- <div class="d-flex justify-content-center">
						<div class="btn btn-primary btn-rounded"> -->
								<!-- <label class="form-label text-white m-1" for="customFile1">Choose
								Front Image</label> -->
								<input type="file" accept="image/*" name="frontImage"
									class="form-control " onchange="previewImage()" id="frontImage" />
								<!-- 	</div>
					</div> -->
							</div>
							<!-- Image content -->
							<div class="col ">
								<div class="mb-4 d-flex justify-content-center">
									<img
										src="https://mdbootstrap.com/img/Photos/Others/placeholder.jpg"
										alt="example placeholder" id="backImageImg"
										style="width: 300px;" />
								</div>
								<!-- <div class="d-flex justify-content-center"> -->
								<!-- <div class="btn btn-primary btn-rounded"> -->
								<!-- <label class="form-label text-white m-1" for="customFile1">Choose
								Back Imnage</label> -->
								<input type="file" name="backImage" class="form-control"
									id="backImage" onchange="previewBackImage()" />
								<!-- </div> -->
								<!-- </div> -->
							</div>
						</div>

						<!-- Here other form************ -->

					</div>
					<div class="modal-footer">

						<button type="button" data-close-button
							class="btn btn-secondary close-button" id="closeModal">Close</button>
						<button type="submit" id="submitBtn" onclick=""
							class="btn btn-primary">Send message</button>

					</div>

				</div>
			</div>
		</form>
	</div>


	<div id="overlay"></div>
	<script src="<%=request.getContextPath()%>/js/modalScript.js"></script>
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
</body>
</html>
