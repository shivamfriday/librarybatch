<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix = 'c'%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form by Colorlib</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="<%= request.getContextPath()%>/fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css">

<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<input type="hidden" id="status" value="<%= request.getAttribute("status")%>"/>
	<div class="main bg-light">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container bg-light" >
				<div class="signup-content">
					<div class="signup-form bg-light">
						<h2 class="form-title">Sign up</h2>
					
						<form method="post" action="./librarianController/addLibrarian" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="Id"><i
									class="zmdi zmdi-account material-icons-name"></i></label> 
									<input class="form-control"
									type="text" name="stud_id" id="Id" placeholder="Your student id" />
							</div>
							
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									class="form-control" type="text" name="name" id="name" placeholder="Your Name" />
							</div>
						 <div class="form-row"> 
							<div class="form-group col-md-6" >
							    
								<label >Department:</label>
									   
									<select name="dept" id="dept" class="form-control"> 
										<option selected>Choose...</option> 
										<option value="CSE">CSE</option>  
										<option value="ECE">ECE</option>  
										<option value="CIVIL">CIVIL</option>  
										<option value="MECH">MECH</option>  
										<option value="EEE">EEE</option>   
							     </select>  
							</div>
							<div class="form-group col-md-6">
								<label for="section">Section</label>
									<select name="section" id="section" class="form-control">
										<option selected>Choose...</option>	  
									  <option value="A">A</option>  
									  <option value="B">B</option>  
									  <option value="C">C</option>  
									  <option value="D">D</option>   
									</select>  
							</div>
						 </div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									class="form-control" type="email" name="email" id="email" placeholder="Your Email" />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									 class="form-control" type="password" name="password" id="password" placeholder="Password" />
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Repeat your password" class="form-control" />
							</div>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="text" name="mobile" id="contact"
									placeholder="Contact no" class="form-control" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term form-control" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="<%= request.getContextPath()%>/images/signup-image.jpg" alt="sing up image">
						</figure>
						<a href="Studentlogin.jsp" class="signup-image-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section> 


	</div>
	<!-- JS -->
	<script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-2.0.0.min.js"></script>
	<script src="<%= request.getContextPath()%>/js/main.js"></script>

    
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>  
	
	
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if(status=="success"){
			console.log("success")
			swal("Congrats","Account Created Successfully","success");
		}
	</script>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>