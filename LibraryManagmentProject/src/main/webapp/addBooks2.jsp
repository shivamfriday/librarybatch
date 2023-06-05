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
	
	

<script src="
https://code.jquery.com/jquery-3.6.0.min.js">
	
</script>
<style>
body {
	
	background: linear-gradient(45deg, #ce1e53, #8f00c7);
    min-height: 100vh;
	
	
}


</style>	
	
<jsp:include page="librarianNavbar.jsp" />



<div class="container-fluid container-sm card"
	style="width: 800px; margin-top: 100px;">

	<div style="width: 700px; margin-left: 50px; margin-top: 30px;">
		<!-- style="width:700px" -->
		<form method="post" enctype='multipart/form-data'
			action="<%=request.getContextPath()%>/booksController/addBooks">
			<h2 class="justify-content-center">Add Books</h2>
			
			<div class="form-outline mb-4">
				<input type="text" id="form6Example3" name="bookId" class="form-control" /> <label
					class="form-label"  for="form6Example3">Book
					ID</label>
			</div>
			<div class="form-outline mb-4">
				<input type="text" id="form6Example3" name="bookTitle" class="form-control" /> <label
					class="form-label"  for="form6Example3">Book
					Title</label>
			</div>

			<div class="form-outline mb-4">
				<input type="text" id="form6Example4" name="authorName" class="form-control" /> <label
					class="form-label"  for="form6Example4">Author
					Name</label>
			</div>
			<!-- 2 column grid layout with text inputs for the first and last names -->
			<div class="row mb-4">

				<div class="col">
					<div class="form-outline">
						<input type="text" id="form6Example1" name="qty" class="form-control" /> <label
							class="form-label"  for="form6Example1">Quantity</label>
					</div>
				</div>
				<div class="col">
					<div class="form-outline">
						<input type="text" id="form6Example2" name="bookPrice" class="form-control" /> <label
							class="form-label"  for="form6Example2">Price</label>
					</div>
				</div>
			</div>

			<div class="row mb-4">

				<div class="col">
					<div class="form-outline">
						<input type="text" id="form6Example1" name="category" class="form-control" /> <label
							class="form-label"  for="form6Example1">Category</label>
					</div>
				</div>
				<div class="col">
					<div class="form-outline">
						<input type="text" id="form6Example2"  name="edition" class="form-control" /> <label
							class="form-label" for="form6Example2">Edition</label>
					</div>
				</div>
			</div>



			<!-- Message input -->
			<div class="form-outline mb-4">
				<textarea class="form-control" name="description" id="form6Example7"
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
							alt="example placeholder" id="backImageImg" style="width: 300px;" />
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

			<!-- Checkbox -->

			<!-- Submit button -->
			<button type="submit" class="btn btn-primary btn-block mb-4">Place
				order</button>
		</form>
	</div>
</div>
<!-- MDB -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"></script>


<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"></script>

<!-- This is sweetalert script -->
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


</script>
