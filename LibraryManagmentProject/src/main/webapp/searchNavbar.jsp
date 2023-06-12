<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" style="margin-top:82px;z-index:1">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
			<a class="navbar-brand" href="#">Search By :</a>
			<form id="myform" method="get"
				action="<%= request.getContextPath()%>/booksController/searchBookById"
				class="d-flex input-group w-auto">
				<input type="search" class="form-control" placeholder="Serach By Id"
					aria-label="Search" name="valueForSearch" />
					<input type="hidden" name="valueForType" value="bookId"></input>
				<button class="btn btn-outline-primary" type="submit"
					data-mdb-ripple-color="dark">Search</button>
			</form>&nbsp&nbsp&nbsp
			<form class="d-flex input-group w-auto" action="<%= request.getContextPath()%>/booksController/searchBookByCat">
				<input type="search" class="form-control"
					placeholder="Search By Category" aria-label="Search" name="valueForSearch"/>
				<input type="hidden" name="valueForType" value="category"></input>
				<button class="btn btn-outline-primary" type="submit"
					data-mdb-ripple-color="dark">Search</button>
			</form>&nbsp&nbsp&nbsp
			<form class="d-flex input-group w-auto" action="<%= request.getContextPath()%>/booksController/searchBookByTitle">
				<input type="search" class="form-control"
					placeholder="Serach By Title" aria-label="Search" name="valueForSearch"/>
				<input type="hidden" name="valueForType" value="title"></input>
				<button class="btn btn-outline-primary" type="submit"
					data-mdb-ripple-color="dark">Search</button>
			</form>&nbsp&nbsp&nbsp&nbsp&nbsp
			
			
			<form class="d-flex input-group w-auto" action="<%= request.getContextPath()%>/booksController/searchBookByAuthor">
				<input type="search" class="form-control"
					placeholder="Serach By Author" aria-label="Search" name="valueForSearch"/>
				<input type="hidden" name="valueForType" value="author"></input>
				<button class="btn btn-outline-primary" type="submit"
					data-mdb-ripple-color="dark">Search</button>
			</form>
			
			
			<form class="d-flex input-group w-auto" action="<%= request.getContextPath()%>/booksController/getAllBooks">
			<button class="btn btn-outline-primary" type="submit"
					data-mdb-ripple-color="dark">Get All Books</button>
					</form>
		</div>
	</div>
	<!-- <div class="container-fluid">
    <form class="d-flex input-group w-auto">
      <input
        type="search"
        class="form-control rounded"
        placeholder="Search"
        aria-label="Search"
        aria-describedby="search-addon"
      />
      <span class="input-group-text border-0" id="search-addon">
        <i class="fas fa-search"></i>
      </span>
    </form>
  </div> -->




</nav>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>


<script>
 	$(document).ready(function({
 		
 		$("#myform").on('submit',function(event){
 			event.preventDefault();
 			
 			var f = $(this).serialize();
 			
 			$.ajax({
 				url : "../booksController/searchBookById";
 				data : f,
 				type : 'get',
 				success : function(data,textStatus,jqXHR){
 					console.log("sucess is coming");
 				},
 				error : function(jqHXR,textStatus,errorThrown){
 					console.log("error is coming");
 				}
 			})
 			
 			
 		})
 		
 		
 	}))
 	
 </script>