/*!
* Start Bootstrap - Freelancer v7.0.5 (https://startbootstrap.com/theme/freelancer)
* Copyright 2013-2021 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-freelancer/blob/master/LICENSE)
*/
//
// Scripts
// 

window.addEventListener('DOMContentLoaded', event => {

	// Navbar shrink function
	var navbarShrink = function() {
		const navbarCollapsible = document.body.querySelector('#mainNav');
		if (!navbarCollapsible) {
			return;
		}
		if (window.scrollY === 0) {
			navbarCollapsible.classList.remove('navbar-shrink')
		} else {
			navbarCollapsible.classList.add('navbar-shrink')
		}

	};

	// Shrink the navbar 
	navbarShrink();

	// Shrink the navbar when page is scrolled
	document.addEventListener('scroll', navbarShrink);

	// Activate Bootstrap scrollspy on the main nav element
	const mainNav = document.body.querySelector('#mainNav');
	if (mainNav) {
		new bootstrap.ScrollSpy(document.body, {
			target: '#mainNav',
			offset: 72,
		});
	};

	// Collapse responsive navbar when toggler is visible
	const navbarToggler = document.body.querySelector('.navbar-toggler');
	const responsiveNavItems = [].slice.call(
		document.querySelectorAll('#navbarResponsive .nav-link')
	);
	responsiveNavItems.map(function(responsiveNavItem) {
		responsiveNavItem.addEventListener('click', () => {
			if (window.getComputedStyle(navbarToggler).display !== 'none') {
				navbarToggler.click();
			}
		});
	});

});

/*var modalBtn = document.querySelectorAll(".modal-open");
	//var bookIdAssignee = document.getElementById("bookIdAssignee");

	console.log("hii");
	modalBtn.forEach(function(btn) {
				btn.onclick = function() {
					console.log(btn);
					console.log("hii");
					var modal = btn.getAttribute("data-modal");
					console.log(modal)
					
					var ele =  document.getElementById(modal);
					console.log(ele);
					
					document.getElementById("modal1").style.display = "block";
					//document.getElementById("modal1").classList.toggle("myStyle");
					document.getElementById("modal1").value = "Johnny Bravo";

				}
			});*/

var closeBtn = document.querySelectorAll(".modal-close");
closeBtn.forEach(function(btn) {
	btn.onclick = function() {
		var modal = btn.closest(".modal12").style.display = 'none';
	};
});

window.onclick = function(e) {
	if (e.target.className === 'modal12') {
		e.target.style.display = 'none';
	}
};


const openModalButtons = document.querySelectorAll('[data-modal-target]')
const closeModalButtons = document.querySelectorAll('[data-close-button]')
const overlay = document.getElementById('overlay')

openModalButtons.forEach(button => {
	button.addEventListener('click', () => {
		console.log(button.value);
		var id = button.value;
		var libId = button.id;
		//alert(libId);
		const modal = document.querySelector(button.dataset.modalTarget)
		openModal(modal, id);


	})
})

overlay.addEventListener('click', () => {
	const modals = document.querySelectorAll('.modal.active')

	modals.forEach(modal => {
		closeModal(modal)
	})
})

closeModalButtons.forEach(button => {
	button.addEventListener('click', () => {
		console.log("closing button shift")
		const modal = button.closest('.modal1')
		closeModal(modal)
	})
})

function openModal(modal, id) {
	console.log("is coming")
	if (modal == null) return
	modal.classList.add('active')
	const modalBookId = document.getElementById("modalBookId");
	console.log(modalBookId);
	modalBookId.value = id;
	overlay.classList.add('active')
}

function closeModal(modal) {
	if (modal == null) return
	console.log("is delete")
	modal.classList.remove('active')
	overlay.classList.remove('active')
}

var submitBtn = document.getElementById("submitBtn");
submitBtn.addEventListener('click', () => {
	callAlert();
})

/*function callAlert() {
	console.log("hii we are calling alerat");
	swal({
		title: "Good job!",
		text: "You clicked the button!",
		icon: "success",
		button: "Aww yiss!",
	});
}*/

function sweetAlert() {

	//let notification = new Notification(title, options);

	swal("Good job!", "You clicked the button!", "success")


}


$(document).ready(function() {
	console.log("page is ready")

	$("#myForm").on("submit", function(event) {
		event.preventDefault();

		var dataVar = $(this).serialize();
		var ele = document.getElementById("urlParam");
		var urlParam = ele.value + "/librarianController/assignBookToStudent";
		console.log(urlParam);
		$.ajax({
			url: urlParam,
			data: dataVar,
			type: 'POST',
			success: function(resultText){ 
				var resultStatus = document.getElementById("resultStatus");
				var closeModal = document.getElementById("closeModal");
				console.log(resultText)
				if (resultText == "Assigned book to the student") {
					swal("Good job!", "Assigned book to the student", "success")
					console.log(closeModal)
					closeModal.click();


				} else {

					swal({
						title: "Error!",
						text: resultText,
						type: "error",
						confirmButtonText: "Cool"
					});
					closeModal.click();
					
					
					

				}
				/*console.log(resultStatus.value)*/

				//console.log(data);

			},
			error: function(data, testStatus, jqXHR) {

			}


		})

	})

})

/*window.onload = myFunction;

function myFunction(){
	//var item = request.getAttribute("getAllBooks");
	//console.log(value);
}*/

/*// close modal function
const closeModal = function () {
  modal.classList.add("hidden");
  overlay.classList.add("hidden");
};

// close the modal when the close button and overlay is clicked
closeModalBtn.addEventListener("click", closeModal);
overlay.addEventListener("click", closeModal);

// close modal when the Esc key is pressed
document.addEventListener("keydown", function (e) {
  if (e.key === "Escape" && !modal.classList.contains("hidden")) {
	closeModal();
  }
});

// open modal function
const openModal = function () {
  modal.classList.remove("hidden");
  overlay.classList.remove("hidden");
};
// open modal event
openModalBtn.addEventListener("click", openModal);

*/
