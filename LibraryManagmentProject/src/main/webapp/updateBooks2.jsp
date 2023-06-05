<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>

<style>
body {
	background: linear-gradient(45deg, #ce1e53, #8f00c7);
    min-height: 100vh;
}
</style>

<jsp:include page="librarianNavbar.jsp" />


<%
String status = (String) request.getAttribute("updateBook");
%>
<input type="hidden" id="status" value="<%=status%>">

<script>
	//here putting out teh value end

	const status = document.getElementById("status");
	console.log(status);

	if (status.value == "success") {
		swal("Good job!", "Book Is updated", "success")
	} else if (status.value == "failure") {
		swal({
			title : "Error!",
			text : resultText,
			type : "error",
			confirmButtonText : "Cool"
		});
	}
	

	const deleteBook = document.getElementById("deleteBook");
	console.log(deleteBook);

	if (deleteBook.value == "success") {
		swal("Good job!", "Book Is updated", "success")
	} else if (deleteBook.value == "failure") {
		swal({
			title : "Error!",
			text : resultText,
			type : "error",
			confirmButtonText : "Cool"
		});
	}
	
</script>

<div class="container-fluid container-sm card"
	style="width: 800px; margin-top: 100px;">

	<div style="width: 700px; margin-left: 50px; margin-top: 30px;">
		<!-- style="width:700px" -->
		<form method="post" id="myForm" enctype='multipart/form-data'
			action="<%=request.getContextPath()%>/booksController/updatebook">
			<!-- 	<form id="myForm" enctype='multipart/form-data'
			> -->
			<h2 class="justify-content-center">Update Books</h2>

			<div class="form-outline mb-4">
				<input type="text" id="bookId" name="bookId" class="form-control" />
				<label class="form-label" for="form6Example3">Book ID</label>
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
						<input type="text" id="qty" name="qty" class="form-control" /> <label
							class="form-label" for="form6Example1">Quantity</label>
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
				<textarea class="form-control" name="description" id="description"
					rows="4"></textarea>
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

					<input type="file" accept="image/*" name="frontImage"
						class="form-control " onchange="previewImage()" id="frontImage" />

				</div>
				<!-- Image content -->
				<div class="col ">
					<div class="mb-4 d-flex justify-content-center">
						<img
							src="https://mdbootstrap.com/img/Photos/Others/placeholder.jpg"
							alt="example placeholder" id="backImageImg" style="width: 300px;" />
					</div>

					<input type="file" name="backImage" class="form-control"
						id="backImage" onchange="previewBackImage()" />

				</div>
			</div>

			<!-- Checkbox -->

			<!-- Submit button -->

			<div class="row mb-4">

				<div class="col">
					<button type="submit" class="btn btn-primary btn-block mb-4"
						style="width: 300px">Update</button>
				</div>
				<div class="col">

					<button type="button" id="deleteData"  class="btn btn-primary btn-block mb-4"
						 style="width: 300px">Delete</button>
				</div>
			</div>


		</form>
	</div>
</div>
<!-- MDB -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"></script>
<script src="
https://code.jquery.com/jquery-3.6.0.min.js">
	
</script>

<script src="<%=request.getContextPath()%>/js/updateBookScript.js"></script>

<script>
	const showImageButton = document.getElementById("frontImage");
	const myImage = document.getElementById("frontImageImg");

	function previewImage() {
		var file = showImageButton.files;

		if (file.length > 0) {
			var fileReader = new FileReader();
			fileReader.onload = function(event) {
				console.log(myImage)
				myImage.setAttribute("src", event.target.result);
			}

			fileReader.readAsDataURL(file[0]);
		}

	}

	const backImageButton = document.getElementById("backImage");
	const myImageBack = document.getElementById("backImageImg");

	function previewBackImage() {
		var file = backImageButton.files;

		if (file.length > 0) {
			var fileReader = new FileReader();
			fileReader.onload = function(event) {
				console.log(myImage)
				myImageBack.setAttribute("src", event.target.result);
			}

			fileReader.readAsDataURL(file[0]);
		}

	}

	var data = localStorage.getItem("data");
	
	var id = JSON.parse(data)
	
	console.log(id);
	$('#bookId').val(id.item.bookId);

	$('#bookTitle').val(id.item.title);

	$('#authorName').val(id.item.authorName);
	$('#qty').val(id.item.qty);
	$('#bookPrice').val(id.item.bookPrice);
	$('#category').val(id.item.catName);
	$('#edition').val(id.item.edition);
	$('#description').val(id.item.description);

	//$('#backImageImg').attr('src', `data:image/jpg;base64,${id.item.frontImg}`);
</script>


