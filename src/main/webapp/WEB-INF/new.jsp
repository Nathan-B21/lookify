<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add a song</title>
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
</head>
<body>
	<div class="container">
    <div class="row w-50">
        
        <div class="col-sm">
            <h1>add a new track</h1>

            <form:form action="/addtrack" method="post" modelAttribute="track">

                <div class="form-group">
                    <form:label path="title">Title</form:label>
                    <form:errors path ="title"/>
                    <form:input path ="title" class = "form-control"/>
                </div>
                <div class="form-group">
                    <form:label path="artist">Artist</form:label>
                    <form:errors path="artist"/>
                    <form:input path="artist" class = "form-control"/>
                </div>
                <div class="form-group">
                    <form:label path ="rating">Select a rating</form:label>
                    <form:errors path = "rating"/>
            		<form:select path="rating">
                		<form:option value="1"> 1</form:option>
                		<form:option value="2"> 2</form:option>
                		<form:option value="3"> 3</form:option>
                		<form:option value="4"> 4</form:option>
                		<form:option value="5"> 5</form:option>
                		<form:option value="6"> 6</form:option>
                		<form:option value="7"> 7</form:option>
                		<form:option value="8"> 8</form:option>
                		<form:option value="9"> 9</form:option>
                		<form:option value="10"> 10</form:option>
            		</form:select>
                </div>

                    <input type="submit" class = button>

            </form:form>
            
		</div>
	</div>
</div>
</body>
</html>