<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form by Colorlib</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
</head>
<body>
	<%-- <jsp:include page="navbar.jsp" /> --%>
	<jsp:include page="navbar3.jsp" />
	
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>" />

	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="<%=request.getContextPath()%>/images/signin-image.jpg"
								alt="sing up image">
						</figure>
						<a href="registration.jsp" class="signup-image-link">Create an
							account</a>
					</div>

					<div class="signin-form">
						<h2 class="form-title">Admin Sign In</h2>
						<form method="Post" action="./librarianController/loginLibrarian"
							class="register-form" id="login-form">

							<!-- <div class="form-group ">
								<input class="form-check-input" type="radio"
									name="flexRadioDefault" id="flexRadioDefault1"> <label
									class="form-check-label" for="flexRadioDefault1">
									Default radio </label>
							</div>
							<div class="form-group ">
								<input class="form-check-input" type="radio"
									name="flexRadioDefault" id="flexRadioDefault2" checked>
								<label class="form-check-label" for="flexRadioDefault2">
									Default checked radio </label>
							</div> -->

							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="email" id="username" placeholder="Your Name" />
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password"
									placeholder="Password" />
							</div>
							<!-- <div class="form-group">
								<input type="checkbox" name="remember-me" id="remember-me"
									class="agree-term" /> <label for="remember-me"
									class="label-agree-term"><span><span></span></span>Remember
									me</label>
							</div> -->
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
						<div class="social-login">
							<span class="social-label">Or login with</span>
							<ul class="socials">
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-facebook"></i></a></li>
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-twitter"></i></a></li>
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-google"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-2.0.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>

	<script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-2.0.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>



	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>


	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "failure") {
			console.log("failure")
			swal("Sorry", "Wrong Username and Password", "failed");
		}

		//here another script

		window.onload = function() {
			var tblFruits = document.getElementById("tblFruits");
			var chks = tblFruits.getElementsByTagName("INPUT");
			for (var i = 0; i < chks.length; i++) {
				chks[i].onclick = function() {
					for (var i = 0; i < chks.length; i++) {
						if (chks[i] != this && this.checked) {
							chks[i].checked = false;
						}
					}
				};
			}
		};
	</script>



</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>