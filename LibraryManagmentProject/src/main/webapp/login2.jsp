<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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

<link rel="stylesheet" type="text/css"
	href="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.css">

<script
	src="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.min.js"></script>


<script
	src="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.12/dist/sweetalert2.all.min.js
"></script>
<link
	href="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.12/dist/sweetalert2.min.css
"
	rel="stylesheet">

<title>Insert title here</title>
</head>
<body>
	<div class="container" style="width: 500px; margin-top: 100px;">
		<!-- Pills navs -->
		<ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
			<li class="nav-item" role="presentation"><a
				class="nav-link active" id="tab-login" data-mdb-toggle="pill"
				href="#pills-login" role="tab" aria-controls="pills-login"
				aria-selected="true">Admin Login</a></li>
			<li class="nav-item" role="presentation"><a class="nav-link"
				id="tab-register" data-mdb-toggle="pill" href="#pills-register"
				role="tab" aria-controls="pills-register" aria-selected="false">User
					Login</a></li>
		</ul>
		<!-- Pills navs -->

		<!-- Pills content -->
		<div class="tab-content">
			<div class="tab-pane fade show active" id="pills-login"
				role="tabpanel" aria-labelledby="tab-login">
				<%--  <form method="Post" id="myAdminForm" action="<%=request.getContextPath()%>/librarianController/loginLibrarian"> --%>
				<form id="myAdminForm">
					<div class="text-center mb-3">
						<p>Sign in with:</p>
						<button type="button" class="btn btn-link btn-floating mx-1">
							<i class=s"fabfa-facebook-f"></i>
						</button>

						<button type="button" class="btn btn-link btn-floating mx-1">
							<i class="fab fa-google"></i>
						</button>

						<button type="button" class="btn btn-link btn-floating mx-1">
							<i class="fab fa-twitter"></i>
						</button>

						<button type="button" class="btn btn-link btn-floating mx-1">
							<i class="fab fa-github"></i>
						</button>
					</div>

					<p class="text-center">or:</p>

					<!-- Email input -->
					<div class="form-outline mb-4">
						<input type="email" name="email" id="loginName"
							class="form-control" /> <label class="form-label"
							for="loginName">Email or username</label>
					</div>

					<!-- Password input -->
					<div class="form-outline mb-4">
						<input type="password" name="password" id="loginPassword"
							class="form-control" /> <label class="form-label"
							for="loginPassword">Password</label>
					</div>

					<!-- 2 column grid layout -->
					<div class="row mb-4">
						<div class="col-md-6 d-flex justify-content-center">
							<!-- Checkbox -->
							<div class="form-check mb-3 mb-md-0">
								<input class="form-check-input" type="checkbox" value=""
									id="loginCheck" checked /> <label class="form-check-label"
									for="loginCheck"> Remember me </label>
							</div>
						</div>

						<div class="col-md-6 d-flex justify-content-center">
							<!-- Simple link -->
							<a href="<%=request.getContextPath()%>/forgotPassword.jsp">Forgot
								password?</a>
						</div>
					</div>

					<!-- Submit button -->
					<button type="button" class="btn btn-primary btn-block mb-4"
						id="adminLogin">Sign in</button>

					<!-- Register buttons -->
					<div class="text-center">
						<p>
							Not a member? <a href="#!">Register</a>
						</p>
					</div>
				</form>
			</div>
			<div class="tab-pane fade" id="pills-register" role="tabpanel"
				aria-labelledby="tab-register">
				<form id="studentLoginForm">

					<div class="text-center mb-3">
						<p>Sign in with:</p>
						<button type="button" class="btn btn-link btn-floating mx-1">
							<i class="fab fa-facebook-f"></i>
						</button>

						<button type="button" class="btn btn-link btn-floating mx-1">
							<i class="fab fa-google"></i>
						</button>

						<button type="button" class="btn btn-link btn-floating mx-1">
							<i class="fab fa-twitter"></i>
						</button>

						<button type="button" class="btn btn-link btn-floating mx-1">
							<i class="fab fa-github"></i>
						</button>
					</div>

					<p class="text-center">or:</p>

					<!-- Email input -->
					<div class="form-outline mb-4">
						<input type="text" name="studentId" id="loginName"
							class="form-control" /> <label class="form-label"
							for="loginName">Email or username</label>
					</div>

					<!-- Password input -->
					<div class="form-outline mb-4">
						<input type="password" name="password" id="loginPassword"
							class="form-control" /> <label class="form-label"
							for="loginPassword">Password</label>
					</div>

					<!-- 2 column grid layout -->
					<div class="row mb-4">
						<div class="col-md-6 d-flex justify-content-center">
							<!-- Checkbox -->
							<div class="form-check mb-3 mb-md-0">
								<input class="form-check-input" type="checkbox" value=""
									id="loginCheck" checked /> <label class="form-check-label"
									for="loginCheck"> Remember me </label>
							</div>
						</div>

						<div class="col-md-6 d-flex justify-content-center">
							<!-- Simple link -->
							<a href="#">Forgot password? Contact your librarian he will
								update your password</a>
						</div>
					</div>

					<!-- Submit button -->
					<button type="button" id="studentLogin"
						class="btn btn-primary btn-block mb-4">Sign in</button>

					<!-- Register buttons -->
					<div class="text-center">
						<p>
							Not a member? <a
								href="<%=request.getContextPath()%>/studentRegistraion.jsp">Register</a>
						</p>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Pills content -->

	<!-- MDB -->
	<script src="<%=request.getContextPath()%>/js/loginJs.js"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
		
	</script>

	<script src="
https://code.jquery.com/jquery-3.6.0.min.js">
		
	</script>
	<script
		src="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.min.js"></script>


	<script
		src="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.12/dist/sweetalert2.all.min.js
"></script>

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"></script>
</body>
</html>