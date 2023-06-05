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

<jsp:include page="studentNavbar.jsp" />

<div class="wrapper rounded bg-white" style="margin-top:100px;">
	<form id="myForm">
		<div class="h3">Student Registration Form</div>

		<div class="form">
			<div class="row">
				<div class="col-md-6 mt-md-0 mt-3">
					<label>Student Id:</label> <input readonly type="text"
						name="studentId" style="width: 600px" id="studentId"
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

				<div class=" my-md-2 my-3" id="selectOption">
					<label>Subject</label> <select id="sub" name="department" required>
						<option value="" selected hidden>Choose Option</option>
						<option value="B.tech">B.tech</option>
						<option value="B.Sc">B.Sc</option>
						<option value="M.Sc">M.Sc</option>
						<option value="M.tech">M.tech</option>
						<option value="BCA">BCA</option>
						<option value="MCA">MCA</option>
						<option value="B.com">B.com</option>
						<option value="M.com">M.com</option>
					</select>
				</div>
				<div class="btn btn-primary mt-3" id="submitFormButton">Submit</div>

			</div>

		</div>
	</form>
</div>




<script src="<%=request.getContextPath()%>/js/registerStudent.js"></script>


<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"
></script>








<%--   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  
  <jsp:include page="librarianNavbar.jsp" />
  
  <div class="container">
  <div class="py-5 text-center">
    
    <h2>Checkout form</h2>
    <p class="lead">Below is an example form built entirely with Bootstrap’s form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p>
  </div>

  <div class="row">
    <div class="col-md-4 order-md-2 mb-4">
      <h4 class="d-flex justify-content-between align-items-center mb-3">
        <span class="text-muted">Your cart</span>
        <span class="badge badge-secondary badge-pill">3</span>
      </h4>
      <ul class="list-group mb-3">
        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div>
            <h6 class="my-0">Product name</h6>
            <small class="text-muted">Brief description</small>
          </div>
          <span class="text-muted">$12</span>
        </li>
        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div>
            <h6 class="my-0">Second product</h6>
            <small class="text-muted">Brief description</small>
          </div>
          <span class="text-muted">$8</span>
        </li>
        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div>
            <h6 class="my-0">Third item</h6>
            <small class="text-muted">Brief description</small>
          </div>
          <span class="text-muted">$5</span>
        </li>
        <li class="list-group-item d-flex justify-content-between bg-light">
          <div class="text-success">
            <h6 class="my-0">Promo code</h6>
            <small>EXAMPLECODE</small>
          </div>
          <span class="text-success">-$5</span>
        </li>
        <li class="list-group-item d-flex justify-content-between">
          <span>Total (USD)</span>
          <strong>$20</strong>
        </li>
      </ul>

      <form class="card p-2">
        <div class="input-group">
          <input type="text" class="form-control" placeholder="Promo code">
          <div class="input-group-append">
            <button type="submit" class="btn btn-secondary">Redeem</button>
          </div>
        </div>
      </form>
    </div>
    <div class="col-md-8 order-md-1">
      <h4 class="mb-3">Billing address</h4>
      <form class="needs-validation" novalidate>
        <div class="row">
          <div class="col-md-6 mb-3">
            <label for="firstName">First name</label>
            <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
            <div class="invalid-feedback">
              Valid first name is required.
            </div>
          </div>
          <div class="col-md-6 mb-3">
            <label for="lastName">Last name</label>
            <input type="text" class="form-control" id="lastName" placeholder="" value="" required>
            <div class="invalid-feedback">
              Valid last name is required.
            </div>
          </div>
        </div>

        <div class="mb-3">
          <label for="username">Username</label>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text">@</span>
            </div>
            <input type="text" class="form-control" id="username" placeholder="Username" required>
            <div class="invalid-feedback" style="width: 100%;">
              Your username is required.
            </div>
          </div>
        </div>

        <div class="mb-3">
          <label for="email">Email <span class="text-muted">(Optional)</span></label>
          <input type="email" class="form-control" id="email" placeholder="you@example.com">
          <div class="invalid-feedback">
            Please enter a valid email address for shipping updates.
          </div>
        </div>

        <div class="mb-3">
          <label for="address">Address</label>
          <input type="text" class="form-control" id="address" placeholder="1234 Main St" required>
          <div class="invalid-feedback">
            Please enter your shipping address.
          </div>
        </div>

        <div class="mb-3">
          <label for="address2">Address 2 <span class="text-muted">(Optional)</span></label>
          <input type="text" class="form-control" id="address2" placeholder="Apartment or suite">
        </div>

        <div class="row">
          <div class="col-md-5 mb-3">
            <label for="country">Country</label>
            <select class="custom-select d-block w-100" id="country" required>
              <option value="">Choose...</option>
              <option>United States</option>
            </select>
            <div class="invalid-feedback">
              Please select a valid country.
            </div>
          </div>
          <div class="col-md-4 mb-3">
            <label for="state">State</label>
            <select class="custom-select d-block w-100" id="state" required>
              <option value="">Choose...</option>
              <option>California</option>
            </select>
            <div class="invalid-feedback">
              Please provide a valid state.
            </div>
          </div>
          <div class="col-md-3 mb-3">
            <label for="zip">Zip</label>
            <input type="text" class="form-control" id="zip" placeholder="" required>
            <div class="invalid-feedback">
              Zip code required.
            </div>
          </div>
        </div>
        <hr class="mb-4">
        <div class="custom-control custom-checkbox">
          <input type="checkbox" class="custom-control-input" id="same-address">
          <label class="custom-control-label" for="same-address">Shipping address is the same as my billing address</label>
        </div>
        <div class="custom-control custom-checkbox">
          <input type="checkbox" class="custom-control-input" id="save-info">
          <label class="custom-control-label" for="save-info">Save this information for next time</label>
        </div>
        <hr class="mb-4">

        <h4 class="mb-3">Payment</h4>

        <div class="d-block my-3">
          <div class="custom-control custom-radio">
            <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
            <label class="custom-control-label" for="credit">Credit card</label>
          </div>
          <div class="custom-control custom-radio">
            <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
            <label class="custom-control-label" for="debit">Debit card</label>
          </div>
          <div class="custom-control custom-radio">
            <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
            <label class="custom-control-label" for="paypal">PayPal</label>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 mb-3">
            <label for="cc-name">Name on card</label>
            <input type="text" class="form-control" id="cc-name" placeholder="" required>
            <small class="text-muted">Full name as displayed on card</small>
            <div class="invalid-feedback">
              Name on card is required
            </div>
          </div>
          <div class="col-md-6 mb-3">
            <label for="cc-number">Credit card number</label>
            <input type="text" class="form-control" id="cc-number" placeholder="" required>
            <div class="invalid-feedback">
              Credit card number is required
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-3 mb-3">
            <label for="cc-expiration">Expiration</label>
            <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
            <div class="invalid-feedback">
              Expiration date required
            </div>
          </div>
          <div class="col-md-3 mb-3">
            <label for="cc-cvv">CVV</label>
            <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
            <div class="invalid-feedback">
              Security code required
            </div>
          </div>
        </div>
        <hr class="mb-4">
        <button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button>
      </form>
    </div>
  </div>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2017-2019 Company Name</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> --%>