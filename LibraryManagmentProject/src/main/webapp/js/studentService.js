

var btnClassClick = function(e) {
	// alert("Button clicked from class: "+e.currentTarget.id);


	localStorage.setItem("data", e.currentTarget.id)
	window.open("updateBooks2.jsp", "_blank")


}

$('.open-profile').on('click', btnClassClick);


var submitButtonFunction = function(e) {
	//alert("Button clicked from class: "+e.currentTarget.id);

	//alert(e.currentTarget.value);
	//var dataVar = $("#myForm").serialize();
	var urlParam = "/LibraryManagmentProject/librarianController/removeIssuedBooks";
	const obj = { studentId: e.currentTarget.id, bookId: e.currentTarget.value }
	///alert(obj)
	alert("hi")
	$.ajax({
		url: urlParam,
		data: obj,
		type: 'POST',
		success: function(data) {
			//alert(data)

			//console.log(data)
			//swal("Good job!", "Book Deleted Successfully ", "success")
			
			
			if (data == "success") {

				swal({
					title: "Good!",
					text: "Book Is Submited",
					type: "success",
					confirmButtonText: "Cool"
				}).then(function(){
					location.reload();
					$("#div2").toggle();
				})
				
			}
			else if (data == "failure") {

				swal({
					title: "Error!",
					text: "some error",
					type: "error",
					confirmButtonText: "Cool"
				});


			} 
		},
		error: function(data, testStatus, jqXHR) {
			alert(testStatus)
		}


	})




}

$('.submitButton').on('click', submitButtonFunction);


$(document).ready(function() {
	$("#buttonToggle").click(function() {
		//$("#div2").toggle();



		///console.log("deleting data")

		var dataVar = $("#myForm").serialize();
		var urlParam = "/LibraryManagmentProject/librarianController/getIssuedBooks";
		const obj = { studentId: document.getElementById("studentId").value }
		//alert(obj)
		$.ajax({
			url: urlParam,
			data: obj,
			type: 'POST',
			success: function(data) {
				//alert(data)

				//console.log(data)
				//swal("Good job!", "Book Deleted Successfully ", "success")



				if (data == "success") {

					$("#div2").toggle();

				}
				else if (data == "failure") {

					swal({
						title: "Error!",
						text: "No Book is assigned to sutdent",
						type: "error",
						confirmButtonText: "Cool"
					});


				} else {

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
				alert(testStatus)
			}


		})




	});
});


