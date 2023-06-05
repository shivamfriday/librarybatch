<%@page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<title>Bootstrap Navbar Dropdown Login and Signup Form with
	Social Buttons</title>
</head>


<body>
	<jsp:include page="librarianNavbar.jsp" />
	<div class="container">

		<section class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">ADD BOOKS</h3>
			</div>
			<div class="panel-body">

				<form method="post" enctype='multipart/form-data'
					action="./booksController/addBooks" class="form-horizontal"
					role="form">

					<div class="form-group"></div>
					<!-- form-group // -->
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">Book ID</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="bookId" id="bookID"
								placeholder="Name or company name"
								value="${GenerateShortUUID.next()}">
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">Book
							Title</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="bookTitle"
								id="bookTitle" placeholder="Name or company name">
						</div>
					</div>
					<!-- form-group // -->
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">Author
							Name</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="authorName"
								id="name" placeholder="Author
Name">
						</div>
					</div>
					<!-- form-group // -->
					<div class="form-group">
						<label for="about" class="col-sm-3 control-label">Description</label>
						<div class="col-sm-9">
							<textarea class="form-control" name="description"></textarea>
						</div>
					</div>
					<!-- form-group // -->
					<div class="form-group">
						<label for="qty" class="col-sm-3 control-label">Category</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="category"
								id="category" placeholder="Category">
						</div>
					</div>
					<!-- form-group // -->
					<div class="form-group">
						<label for="qty" class="col-sm-3 control-label">Quantity</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="qty" id="qty"
								placeholder="Quantity">
						</div>
					</div>
					<!-- form-group // -->
					<div class="form-group">
						<label for="qty" class="col-sm-3 control-label">Edition</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="edition"
								id="edition" placeholder="edition">
						</div>
					</div>
					<!-- form-group // -->

					<div class="form-group">
						<label for="qty" class="col-sm-3 control-label">Price</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="bookPrice"
								id="price" placeholder="Price">
						</div>
					</div>
					<!-- form-group // -->


					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">Upload
							The Image</label>
						<div class="col-sm-3">
							<label class="control-label small" for="file_img"> </label>Front
							Image:<input type="file" name="frontImage">
						</div>
						<div class="col-sm-3">
							<label class="control-label small" for="file_img">Back
								Image:</label> <input type="file" name="backImage">
						</div>
					</div>
					<!-- form-group // -->


					<!--   <div class="form-group">
    <label for="tech" class="col-sm-3 control-label"></label>
    <div class="col-sm-3">
   <select class="form-control">
	<option value=""></option>
	<option value="texnolog2"> 2</option>
	<option value="texnolog3"> 3</option>
   </select>
    </div>
  </div> form-group // -->
					<hr>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-9">
							<button type="submit" class="btn btn-primary">SAVE</button>
						</div>
					</div>
					<!-- form-group // -->
				</form>

			</div>
			<!-- panel-body // -->
		</section>
		<!-- panel// -->


	</div>

<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"
></script>

</body>
</html>
<!-- container// -->