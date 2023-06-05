<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ page isELIgnored="false"%>

<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="in.ineuron.model.*"%>



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
  font-size:15px;
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

<div class="row row-cols-3 g-4 justify-content-center" style="margin-top:130px">
	<c:forEach items="${getAllBooks}" var="item">
		<div class="col" style="width: 25rem; font-size: 15px">
			<div class="card h-100">

				<%
				//byte[] byteImg = ((Books)(pageContext.findAttribute("item"))).getFrontImage();
				//System.out.println("getting the all data1111111111111");
				Books item2 = (Books) pageContext.getAttribute("item");

				//byte[] byte = item2.getFrontImage();

				String encodeImg = Base64.getEncoder().encodeToString(item2.getFrontImage());
				String pic = "data:image/jsp;base64," + encodeImg;
				
				%>
				<img src="<%=pic%>" class="card-img-top"
					alt="Hollywood Sign on The Hill"
					style="height: 35 rem; mwidth: 35 rem; overflow: hidden">
				<div class="card-body">
					<h5 class="card-title">
						<b>Book Title : <c:out value="${item.getTitle()}" /></b>
					</h5>
					<p class="card-text">
						<b>Book Description :</b>
						<c:out value="${item.getDescription()}" />
					</p>
				</div>
				<ul class="list-group list-group-light list-group-small">
				<li class="list-group-item px-4"><b>Book Id:</b> <c:out
							value="${item.getBookId()}" /></li>
					<li class="list-group-item px-4"><b>Author Name:</b> <c:out
							value="${item.getAuthorName()}" /></li>
					<li class="list-group-item px-4"><b>Category Name:</b> <c:out
							value="${item.getCatName()}" /></li>
					<li class="list-group-item px-4"><b>Edition:</b> <c:out
							value="${item.getEdition()}" /></li>
					<li class="list-group-item px-4"><b>Quantity:</b> <c:out
							value="${item.getQty()}" /></li>

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

<%-- <jsp:include page="tempo.jsp" /> --%>

<!-- here modal starts -------------------------------------------- -->
<!-- 	<div class="modal modalNew" id="modal1" 
		 style="position:fixed;  z-index:2 display:none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">New message</h5>
					<button data-close-button type="button" class="btn-close" data-mdb-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">Recipient:</label>
							<input type="text" class="form-control" id="recipient-name" />
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">Message:</label>
							<textarea class="form-control" id="message-text"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-mdb-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Send message</button>
				</div>
			</div>
		</div>
	</div> -->
	<%-- 
	<div class="modal1" id="modal">
    <!-- <div class="modal-header">
      <div class="title">Example Modal</div>
      <button data-close-button class="close-button">&times;</button>
    </div>
    <div class="modal-body">
      Lorem ipsum dolor sit amet consectetur adipisicing elit. Esse quod alias ut illo doloremque eum ipsum obcaecati distinctio debitis reiciendis quae quia soluta totam doloribus quos nesciunt necessitatibus, consectetur quisquam accusamus ex, dolorum, dicta vel? Nostrum voluptatem totam, molestiae rem at ad autem dolor ex aperiam. Amet assumenda eos architecto, dolor placeat deserunt voluptatibus tenetur sint officiis perferendis atque! Voluptatem maxime eius eum dolorem dolor exercitationem quis iusto totam! Repudiandae nobis nesciunt sequi iure! Eligendi, eius libero. Ex, repellat sapiente!
    </div> -->
    <form method="Post" action="<%= request.getContextPath()%>/librarianController/assignBookToStudent">
    <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">ENTER STUDNET ID FOR ASSIGNING A BOOK</h5>
					<button data-close-button type="button" class="close-button" 
						></button>
				</div>
				<div class="modal-body">
					
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label" >Book Id:</label>
							<input type="text" class="form-control" id="modalBookId" name="modalBookId"/>
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">Student Id:</label>
							<input class="form-control" id="studentId" name="studentId"></input>
						</div>
					
				</div>
				<div class="modal-footer">
				
					<button type="button" data-close-button class="btn btn-secondary close-button"
						>Close</button>
					<button type="submit" class="btn btn-primary">Send message</button>
			
				</div>
				
			</div>
		</div>
		 </form>
  </div>
 
	
	<div  id="overlay"></div> --%>
	
	
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"
></script>s

<script src="<%= request.getContextPath()%>/js/scripts.js"></script>

<!-- <script>
const exampleModal = document.getElementById('exampleModal');
exampleModal.addEventListener('show.mdb.modal', (e) => {
  // Button that triggered the modal
  const button = e.relatedTarget;
  // Extract info from data-mdb-* attributes
  const recipient = button.getAttribute('data-mdb-whatever');
  // If necessary, you could initiate an AJAX request here
  // and then do the updating in a callback.
  //
  // Update the modal's content.
  const modalTitle = exampleModal.querySelector('.modal-title');
  const modalBodyInput = exampleModal.querySelector('.modal-body input');

  modalTitle.textContent = `New message to ${recipient}`;
  modalBodyInput.value = recipient;
});
</script>
 -->
 
 <!-- <script>
 	$(document).ready(function({
 		console.log("page is ready...");
 		$("#myform").on('submit',function(event){
 			event.preventDefault();
 			
 			var f = $(this).serialize();
 			
 			$.ajax({
 				url : "";
 				data : f,
 				type : 'get',
 				success : function(data,textStatus,jqXHR){
 					console.log("sucess is coming");
 				},
 				error : function(jqHXR,textStatus,errorThrown){
 					console.log("error is coming");
 				}
 			})
 			
 			
 		})
 		
 		
 	}))
 	
 </script> -->
 
 <script
	src="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.min.js"></script>

<script type="text/javascript">
	
</script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
	
</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js">
	
</script>



