


$(document).ready(function() {



});

var submitFormButtonFunction = function(e) {
	var dataVar = $("#myForm").serialize();
	
	var urlParam = "/LibraryManagmentProject/studentController/registerStudent";

	
	$.ajax({
		url: urlParam,
		data: dataVar,
		type: 'POST',
		success: function(data) {


			

			const dataVar = JSON.parse(data);
			if (dataVar.status == "success") {

				let msg1 = "Student Registered  Successfully: your user id is:";
				
				//let val = '<b>bold text</b>'
				
				let msg2 = dataVar.studentId;

				let msg = msg1.concat(" ", msg2)

				

				swal({
					title: "Good job!",
					text: msg,
					type: "success",
					confirmButtonText: "Cool"
				}).then(function(){
					
					
					document.getElementById("studentId").value = dataVar.studentId;
					$('#studentId').css('color','green')
					
				})

				//console.log(closeModal)





			} else if (dataVar.status == "failure") {
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

$('#submitFormButton').on('click', submitFormButtonFunction)