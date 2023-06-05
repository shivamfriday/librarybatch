<%@page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix = 'c'%>
<!DOCTYPE html>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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

/* Importing fonts from Google */
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap')
	;

/* Reseting */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	background: linear-gradient(45deg, #ce1e53, #8f00c7);
	min-height: 100vh;
}

body::-webkit-scrollbar {
	display: none;
}

.wrapper {
	max-width: 800px;
	margin: 80px auto;
	padding: 30px 45px;
	box-shadow: 5px 25px 35px #3535356b;
}

.wrapper label {
	display: block;
	padding-bottom: 0.2rem;
}

.wrapper .form .row {
	padding: 0.6rem 0;
}

.wrapper .form .row .form-control {
	box-shadow: none;
}

.wrapper .form .option {
	position: relative;
	padding-left: 20px;
	cursor: pointer;
}

.wrapper .form .option input {
	opacity: 0;
}

.wrapper .form .checkmark {
	position: absolute;
	top: 1px;
	left: 0;
	height: 20px;
	width: 20px;
	border: 1px solid #bbb;
	border-radius: 50%;
}

.wrapper .form .option input:checked ~.checkmark:after {
	display: block;
}

.wrapper .form .option:hover .checkmark {
	background: #f3f3f3;
}

.wrapper .form .option .checkmark:after {
	content: "";
	width: 10px;
	height: 10px;
	display: block;
	background: linear-gradient(45deg, #ce1e53, #8f00c7);
	position: absolute;
	top: 50%;
	left: 50%;
	border-radius: 50%;
	transform: translate(-50%, -50%) scale(0);
	transition: 300ms ease-in-out 0s;
}

.wrapper .form .option input[type="radio"]:checked ~.checkmark {
	background: #fff;
	transition: 300ms ease-in-out 0s;
}

.wrapper .form .option input[type="radio"]:checked ~.checkmark:after {
	transform: translate(-50%, -50%) scale(1);
}

#sub {
	display: block;
	width: 100%;
	border: 1px solid #ddd;
	padding: 10px;
	border-radius: 5px;
	color: #333;
}

#sub:focus {
	outline: none;
}

@media ( max-width : 768.5px) {
	.wrapper {
		margin: 30px;
	}
	.wrapper .form .row {
		padding: 0;
	}
}

@media ( max-width : 400px) {
	.wrapper {
		padding: 25px;
		margin: 20px;
	}
}
</style>

<jsp:include page="indexNavbar.jsp" />

<div class="wrapper rounded bg-white" style="margin-top:100px;">
	<form id="myForm">
		<div class="h3">Librarian Registration Form</div>

		<div class="form">
			<div class="row">
				<div class="col-md-6 mt-md-0 mt-3">
					<label>Librarian Id:</label> <input readonly type="text"
						name="librarianId" style="width: 600px" id="librarianId"
						class="form-control" required>
				</div>

			</div>

			<div>

				<input type="hidden" id="studentId2" class="form-control">
				<div class="row">
					<div class="col-md-6 mt-md-0 mt-3">
						<label>First Name</label> <input type="text" name="firstName"
							id="firstName" class="form-control" required>
					</div>
					<div class="col-md-6 mt-md-0 mt-3">
						<label>Last Name</label> <input type="text" name="lastName"
							id="lastName" class="form-control" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 mt-md-0 mt-3">
						<label>Birthday</label> <input type="date" name="date" id="dob"
							class="form-control" required>
					</div>
					<div class="col-md-6 mt-md-0 mt-3">
						<label>Gender</label>
						<div class="d-flex align-items-center mt-2">
							<label class="option"> <input type="radio" id="male"
								name="radio" value="M">Male <span class="checkmark"></span>
							</label> <label class="option ms-4" style="margin-left: 5px;"> <input
								id="female" value="F" type="radio" name="radio">Female <span
								class="checkmark"></span>
							</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 mt-md-0 mt-3">
						<label>Email</label> <input id="email" name="email" type="email"
							class="form-control" required>
					</div>
					<div class="col-md-6 mt-md-0 mt-3">
						<label>Phone Number</label> <input id="mobile" name="mobile"
							type="tel" class="form-control" required>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6 mt-md-0 mt-3">
						<label>Password</label> <input id="password" name="password"
							type="email" class="form-control" required>
					</div>
					<div class="col-md-6 mt-md-0 mt-3">
						<label>Confirm Password</label> <input id="confirmPassword"
							name="confirmPassword" type="tel" class="form-control" required>
					</div>
				</div>

			
				<div class="btn btn-primary mt-3" id="submitFormButton">Submit</div>

			</div>

		</div>
	</form>
</div>




<script src="<%=request.getContextPath()%>/js/registerLibrarian.js"></script>


<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"
></script>








