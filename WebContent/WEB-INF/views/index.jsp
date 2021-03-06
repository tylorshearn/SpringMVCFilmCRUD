<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC Film Site</title>
</head>
<body>

<h1>Welcome to our film site!</h1>

<p> To view a film's details in full, please select <em>"Search by Film ID"</em><br>

<br>If you'd like to create a film of your own and add it to our list, please select <em>"Create a Film"</em><br>
	
<br>Last but not least, to search for a film by keyword or pattern within the title, or description, please select <em>"Search by Keyword/Pattern"</em><br>
	
	<br><a href="searchByFilmIdForm.do">Search by Film ID</a><br>
	
	<br><a href="createFilmForm.do">Create a Film</a><br>
	
	<br><a href="searchByKeyPatForm.do">Search by Keyword/Pattern</a>
	
	

</body>
</html>