<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ page isELIgnored="false"%>

<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="in.ineuron.model.*"%>


<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"
	rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" />



<!-- <!-- Font Awesome -->
<!-- <link
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
  rel="stylesheet"
/>
Google Fonts
<link
  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
  rel="stylesheet"
/>
MDB
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.5.7/mdb.min.css"
  rel="stylesheet"
/> -->
<link
	href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"
	rel="stylesheet" />
 <style>
.dtHorizontalVerticalExampleWrapper {
  max-width: 400px;
  margin: 0 auto;
}
#example th, td {
  white-space: nowrap;
}
table.dataTable thead .sorting:after,
table.dataTable thead .sorting:before,
table.dataTable thead .sorting_asc:after,
table.dataTable thead .sorting_asc:before,
table.dataTable thead .sorting_asc_disabled:after,
table.dataTable thead .sorting_asc_disabled:before,
table.dataTable thead .sorting_desc:after,
table.dataTable thead .sorting_desc:before,
table.dataTable thead .sorting_desc_disabled:after,
table.dataTable thead .sorting_desc_disabled:before {
  bottom: .5em;
}
</style>


<div class="container-fluid">
	<table id="example"
		class="display1 table table-striped table-bordered " cellspacing="0"
		style="width:50px;">
		<thead>
			<tr>
				<th>Book Id</th>
				<th>Author Name</th>
				<th>Title</th>
			<!-- 	<th>Category Name</th>
				<th>Category Name</th>
				<th>Edition</th>
				<th>Quantity</th>
				<th>Description</th> -->
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${getAllBooks}" var="item">
				<tr>
					<td><c:out value="${item.getBookId()}"/></td>
					<td><c:out value="${item.getAuthorName()}"/></td>
					<td><c:out value="${item.getTitle()}"/></td>
				<%-- 	<td><c:out value="${item.getCatName()}"/></td>
					<td><c:out value="${item.getBookPrice()}"/></td>
					<td><c:out value="${item.getEdition()}"/></td>
					<td><c:out value="${item.getQty()}"/></td>
					<td><c:out value="${item.getDescription()}"/></td> --%>				
				</tr>
			</c:forEach>

		</tbody>
		<!-- 	<tfoot>
		<tr>
			<th>Name</th>
			<th>Position</th>
			<th>Office</th>
			<th>Age</th>
			<th>Start date</th>
			<th>Salary</th>
		</tr>
	</tfoot> -->
	</table>
</div>

<script
	src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js">
	
</script>
<script
	src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap4.min.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	
<script>
	$(document).ready(function() {
		$('#example').DataTable();

	});
</script>

