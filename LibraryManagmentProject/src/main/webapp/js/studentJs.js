

$(document).ready(function() {
    $('#studentService').click(function() {
      
      var val = document.getElementById("studentId").value;
      const obj = {studentId:val}
     
      const urlParam = "/LibraryManagmentProject/studentController/booksTakeByStudent"
      
      	$.ajax({
			url: urlParam,
			data: obj,
			type: 'POST',
			success: function(resultText){ 
				var resultStatus = document.getElementById("resultStatus");
				var closeModal = document.getElementById("closeModal");
				console.log(resultText)
				//alert("hi");
				var context = document.getElementById("contextPath").value;
				window.open(context+"/BooksInYourAccount.jsp", "_blank")
				//window.open("BooksInYourAccount.jsp", "_blank")
				
				
				/*console.log(resultStatus.value)*/

				//console.log(data);

			},
			error: function(data, testStatus, jqXHR) {

			}


		})
      
    })
});

