<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>search</title>
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
</head>
<body>
	<div class ="container">
		<nav class="navbar navbar-light bg-light">
  			<span class="navbar-brand mb-0 h1">Songs by artist: <c:out value="${artist}"/></span>
  			<form action="/search">
  				<div class = "form-group">
  					<input type = "text" class = "from-control" id = "search" placeholder="search artist">
  					<input type = "submit" value="Search Artists"/>
  				</div>
  			
  			</form>
		</nav>
	</div>
	<div class = "container">
		<table class="table">
  			<thead>
    			<tr>
				      <th scope="col">Name</th>
				      <th scope="col">Rating</th>
				      <th scope="col">Actions</th>
    			</tr>
  			</thead>
  			
  			<tbody>
  			
  			
  			<c:forEach items="${tracks}" var="track">
        		<tr>
            		<td><a href="/songs/${track.id}"><c:out value="${track.title}"/></a></td>

	            	<td><c:out value="${track.rating}"/></td>
	            	<td>
	            	<form action = "/delete/${track.id}" method= "post">
	            	<input type="hidden" value = "delete" name = "_method"/>
	           		<input type="submit" value="Delete"/></form></td>
        		</tr>
        	</c:forEach>
        	</tbody>
        	
        	
  			
  			<!-- table data here c:out bullshit -->
  			
  			
  			</table>
	
	</div>
</body>
</html>