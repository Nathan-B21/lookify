<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Details</title>
</head>
<body>
	<div class="container">
	<table class="table">
  			
  			<tbody>
        		<tr>
        			<td>Track</td>
            		<td><c:out value="${track.title}"/></td>
				</tr>
				<tr>
					<td>Artist</td>
					<td><c:out value="${track.artist}"/></td>
				</tr>
				<tr>
					<td>Rating</td>
	            	<td><c:out value="${track.rating}"/></td>
      		</tbody>

  			
  			
	</table>
	<form action = "/delete/${track.id}" method= "post">
	<input type="hidden" value = "delete" name = "_method"/>
	<input type="submit" value="Delete"/></form>


  
    </div>
</body>
</html>