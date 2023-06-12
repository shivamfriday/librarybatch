



var submitButtonFunction = function(e) {

	//alert("hi")

	var dataVar = $("#myForm").serialize();
	var urlParam = "/LibraryManagmentProject/librarianController/getStudent";
	const obj = {
		studentId: document.getElementById("studentId").value
	}
	//alert(obj)
	$.ajax({
		url: urlParam,
		data: obj,
		type: 'POST',
		success: function(data) {
			
			var dataVar="";
			
			//alert(data)
			if(data=="failure"){
				
			}else if(JSON.parse(data).status=="success"){
				//alert("hii")
				dataVar = JSON.parse(data)
			}


			//alert(dataVar)


			//alert(dataVar.status)
			if (dataVar.status == "success") {

				//alert("hiiii")

				$("#div2").toggle();


				$("#studentId").attr("readonly", true);
				const firstName = dataVar.name.substring(0, dataVar.name
					.indexOf(' ')); // "72"
				const lastName = dataVar.name.substring(dataVar.name
					.indexOf(' ') + 1); // "tocirah sneab"

				$('#firstName').val(firstName);
				$('#lastName').val(lastName);

				//alert(dataVar.dob)

				$('#dob').val(dataVar.dob);

				if (dataVar.gender == 'm') {
					$('#male').attr('checked', true);
				} else {
					$('#female').attr('checked', true);
				}

				$('#email').val(dataVar.email);
				$('#mobile').val(dataVar.mobile);
				$('#password').val(dataVar.password);
				$('#password').val(dataVar.password);
				//alert(dataVar.department)
				$("sub").val(dataVar.department).change();
				//$("div.selectOption select").val("B.tech");


			} else {

				swal({
					title: "Error!",
					text: "No Student id is assigned to sutdent",
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

$('#buttonToggle').on('click', submitButtonFunction);




var submitFormButtonFunction = function(e) {
	var dataVar = $("#myForm").serialize();
	//alert(dataVar)
	var urlParam = "/LibraryManagmentProject/librarianController/updateStudent";

	//alert(dataVar)
	$.ajax({
		url: urlParam,
		data: dataVar,
		type: 'POST',
		success: function(resultText) {
			console.log(resultText)
			if (resultText == "success") {
				//alert(resultText)
				swal("Good job!", "Student Upated Successfully ", "success")
				console.log(closeModal)
				closeModal.click();
				//window.location.href = "updateBooks3.jsp";
				$('#myForm').reset();


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

$('#submitFormButton').on('click', submitFormButtonFunction);


var deleteFormButtonFunction = function(e) {
	var dataVar = $("#myForm").serialize();
	//alert(dataVar)

	var urlParam = "/LibraryManagmentProject/librarianController/deleteStudent";

	var id = document.getElementById("studentId").value;
	const obj = { studentId: id }


	$.ajax({
		url: urlParam,
		data: obj,
		type: 'POST',
		success: function(data) {
			//alert(data)
			if (data == "success") {

				swal({
					title: "Success",
					text: "Student Deleted Successfully",
					type: "error",
					confirmButtonText: "Cool"
				}).then(function() {
					location.reload();
				})


			} else if (data == "failure") {
				//alert(resultText)
				swal({
					title: "Error!",
					text: "you can't delete the sutdent because he is having a book ",
					type: "error",
					confirmButtonText: "Cool"
				});


			}

		},
		error: function(data, testStatus, jqXHR) {
				swal({
					title: "Error!",
					text: "you can't delete the sutdent because he is having a book ",
					type: "error",
					confirmButtonText: "Cool"
				});
		}


	})
}

$('#deleteFormButton').on('click', deleteFormButtonFunction);



