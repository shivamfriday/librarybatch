window.onload = loading();


function loading() {

}

const openModalButtons = document.querySelectorAll('[data-modal-target]')
const closeModalButtons = document.querySelectorAll('[data-close-button]')
const overlay = document.getElementById('overlay')

openModalButtons.forEach(button => {
	button.addEventListener('click', () => {
		//console.log(button.value);
		var id = button.value;
		var testV = button.id;
		console.log(id);

		const obj = JSON.parse(id);
		//console.log(obj.authorName);
		const modal = document.querySelector(button.dataset.modalTarget)
		localStorage.setItem("myValue", id);
		sessionStorage.setItem("myValue", id)
		//window.location.href = "updateBooks2.jsp";
		//need to open this 
		//window.open("updateBooks2.jsp", "_blank")

		openModal(modal, obj);


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
	//console.log("is coming")
	//alert(id)
	if (modal == null) return
	modal.classList.add('active')
	//const modalBookId = document.getElementById("bookId");
	//console.log("###########################");
	//console.log(modalBookId);
	//modalBookId.value = id;
	overlay.classList.add('active')
	//console.log($('#bookId'));
	console.log(id);
	$('#modalBookId').val(id.item.bookId);

	$('#bookTitle').val(id.item.title);

	$('#authorName').val(id.item.authorName);
	$('#qty').val(id.item.qty);
	$('#bookPrice').val(id.item.bookPrice);
	$('#category').val(id.item.catName);
	$('#edition').val(id.item.edition);
	$('#description').val(id.item.description);
	//$('#backImageImg').src(id.frontImgeBlob);

	$('#backImageImg').attr('src', `data:image/jpg;base64,${id.item.frontImg}`);



	console.log(id.item.frontImg)
	// $('#edition').val(address);

	/*  $(document).ready(function(){
		  $('#bookId').val(id.bookId);
	  });*/


}

function closeModal(modal) {
	if (modal == null) return
	console.log("is delete")
	modal.classList.remove('active')
	overlay.classList.remove('active')
	//alert("closing modal call")
	//location.reload();
}

var submitBtn = document.getElementById("submitBtn");
submitBtn.addEventListener('click', () => {
	//callAlert();
})


$(document).ready(function() {

	$(document).on('click', '.edit', function() {

		var first = $('#bookId').text();// get firstname
		console.log(first)
		console.log("*****************************")

		var last = $('#lastname').text(); // get lastname

		var address = $('#address').text(); //get address

		$('#edit').modal('show');//load modal


		$('#efirstname').val(first);

		$('#elastname').val(last);

		$('#eaddress').val(address);

	});

});

/*const element = document.getElementsByClassName("open-profile");

element.forEach(button => {
	button.addEventListener('click', () => {
	console.log(button.id);


	})
})*/

var btnClassClick = function(e) {
	// alert("Button clicked from class: "+e.currentTarget.id);

	// var data = JSON.parse(e.currentTarget.id)
	localStorage.setItem("data", e.currentTarget.id)
	window.open("updateBooks2.jsp", "_blank")


}

$('.open-profile').on('click', btnClassClick);


var removeDataClick = function(e) {

	//$("#myForm3").preventDefault();

	alert(e.currentTarget.id)
	const jsonData = { bookId: e.currentTarget.id }
	const obj = JSON.stringify(jsonData);

	alert(obj);
	console.log("deleting data")

	var urlParam = "/LibraryManagmentProject/booksController/deletebook";


	$.ajax({
		url: urlParam,
		data: jsonData,
		type: 'POST',
		success: function(resultText) {
			var resultStatus = document.getElementById("resultStatus");
			var closeModal = document.getElementById("closeModal");
			console.log(resultText)
			if (resultText == "success") {
				//alert(resultText)
				//swal("Good job!", "Book Deleted Successfully ", "success")

				swal({
					title: "Wow!",
					text: "Book Deleted Successfully ",
					type: "success"
				}).then(function() {
					location.reload();
				});

				//console.log(closeModal)

				//closeModal.click();


			} else if (resultText == "failure") {
				//alert(resultText)
				swal({
					title: "Error!",
					text: resultText,
					type: "error",
					confirmButtonText: "Cool"
				});
				$("input[type=text], textarea").val("");
				$('#bookId').val("");
				closeModal.click();

			} else {
				//alert(resultText)
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


}

$('.remove-button').on('click', removeDataClick)



function sweetAlert() {

	//let notification = new Notification(title, options);

	swal("Good job!", "You clicked the button!", "success")


}


$(document).ready(function() {
	console.log("page is ready")

	$("#myForm3").on("submit", function(event) {
		event.preventDefault();
		var form = $('#myForm3')[0];
		var data = new FormData(form);
		//alert(data)
		var dataVar = $(this).serialize();
		//alert(dataVar)
		console.log(dataVar);
		var ele = document.getElementById("urlParam");
		var urlParam = "/LibraryManagmentProject/booksController/updatebook";
		$.ajax({
			url: urlParam,
			enctype: 'multipart/form-data',
			data: data,
			type: 'POST',
			processData: false,
			contentType: false,
			success: function(data) {
				var resultStatus = document.getElementById("resultStatus");
				var closeModal = document.getElementById("closeModal");
				//alert(data)
				if (data == "success") {
					//alert("showing from ajax")
					console.log("hi gettin success");
					//swal("Good job!", "Book Successfully updated", "success")

					

					swal({
						title: "Wow!",
						text: "Book Successfully updated",
						type: "success"
					}).then(function() {
						closeModal.click();
						location.reload();
					});


				} else {
					alert("showing from ajax")
					swal({
						title: "Error!",
						text: resultText,
						type: "error",
						confirmButtonText: "Cool"
					});
					closeModal.click();




				}

			},
			error: function(data, testStatus, jqXHR) {
				closeModal.click();


				swal({
					title: "Error!",
					text: testStatus,
					type: "error",
					confirmButtonText: "Cool"
				});

				console.log("gettin erorrdsfdsfdsfds")
			}

			//closeModal.click();
		})

	})

})




