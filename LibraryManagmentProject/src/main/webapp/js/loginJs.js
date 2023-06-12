var submitButtonFunction = function(e) {
	//alert("Button clicked from class: "+e.currentTarget.id);
	//$("#myAdminForm").preventDefault();
	//alert(e.currentTarget.value);
	var dataVar = $("#myAdminForm").serialize();
	var urlParam = "/LibraryManagmentProject/librarianController/loginLibrarian";
	//const obj = { studentId: e.currentTarget.id, bookId: e.currentTarget.value }
	///alert(obj)
	//alert("hi")
	$.ajax({
		url: urlParam,
		data: dataVar,
		type: 'POST',
		success: function(data) {
			//alert(data)
			//alert(data)
			//console.log(data)
			//swal("Good job!", "Book Deleted Successfully ", "success")


			if (data == "success") {

				/*	swal({
						title: "Good!",
						text: "You logged in",
						type: "success",
						confirmButtonText: "Cool"
					}).then(function() {
						location.reload();
						location.href = "librarianWelcome.jsp"
						//window.open("librarianWelcome.jsp")
	
					});*/





				Swal.fire({
					position: 'top-end',
					icon: 'success',
					title: 'Your suuccessfully logged in',
					showConfirmButton: false,
					timer: 1500
				}).then(() => {

					window.open("librarianWelcome.jsp")
				})

			}
			else if (data == "failure") {



				Swal.fire({
					icon: 'error',
					title: 'Your Id password is wrong',
					text: 'Something went wrong!',
					footer: '<a href="">Why do I have this issue?</a>'
				})


			}
		},
		error: function(data, testStatus, jqXHR) {
			alert(testStatus)
		}


	})




}

$('#adminLogin').on('click', submitButtonFunction);



var studentLoginFunction = function(e) {

	//document.getElementById("studentLoginForm").preventDefault();
	//$("#studentLoginForm").preventDefault();

	var dataVar = $("#studentLoginForm").serialize();
	//var dataVar = $("#myAdminForm").serialize();
	//alert(dataVar)
	var urlParam = "/LibraryManagmentProject/studentController/studentLogin";
	//const obj = { studentId: e.currentTarget.id, bookId: e.currentTarget.value }
	///alert(obj)
	//alert("hi")
	$.ajax({
		url: urlParam,
		data: dataVar,
		type: 'POST',
		success: function(data) {
			//alert(data)




			if (data == "success") {






				Swal.fire({
					position: 'top-end',
					icon: 'success',
					title: 'Your suuccessfully logged in',
					showConfirmButton: false,
					timer: 1500
				}).then(() => {

					window.open("studentWelcome.jsp")
				})

			}
			else if (data == "not matches") {



				Swal.fire({
					icon: 'error',
					title: 'Your Id password is wrong',
					text: 'Something went wrong!',
					footer: '<a href="">Why do I have this issue?</a>'
				})


			}else{
				Swal.fire({
					icon: 'error',
					title: data,
					text: 'Something went wrong!',
					footer: '<a href="">Why do I have this issue?</a>'
				})
			}





		},
		error: function(data, testStatus, jqXHR) {
			alert("error")
		}


	})




}

$('#studentLogin').on('click', studentLoginFunction);