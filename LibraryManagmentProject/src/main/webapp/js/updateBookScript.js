$(document).ready(function() {
	console.log("page is ready")

	$("#myForm").on("submit", function(event) {
		//event.preventDefault();

		var dataVar = $(this).serialize();
		console.log(dataVar);
		var ele = document.getElementById("urlParam");
		//var urlParam =ele.value + "/booksController/updatebook";
		var urlParam = "/LibraryManagmentProject/booksController/updatebook";
		console.log(urlParam);


	})

})

/*function deleteDataFunc(){
	alert("delerteswljkld");
}*/

$("#deleteData").on("click",function(event){
	console.log("deleting data")
	//var dataVar = $("#bookId").value;
	//var dataVar = document.getElementById("bookId");
	var dataVar = $("#myForm").serialize();
	var urlParam =  "/LibraryManagmentProject/booksController/deletebook";
	
	alert(dataVar)
	$.ajax({
			url: urlParam,
			data: dataVar,
			type: 'POST',
			success: function(resultText){ 
				var resultStatus = document.getElementById("resultStatus");
				var closeModal = document.getElementById("closeModal");
				console.log(resultText)
				if (resultText == "success") {
					//alert(resultText)
					swal("Good job!", "Book Deleted Successfully ", "success")
					console.log(closeModal)
					closeModal.click();
					//window.location.href = "updateBooks3.jsp";
					$('#myForm').reset();


				} else if(resultText == "failure") {
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
												
				}else{
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
	
})