<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Searching by ID</title>
</head>
<body>
<h3>Find your film by its ID</h3>
	<form action="getFilmByID.do" method="GET">
		<b>Enter an ID:</b>
		<input type="text" name="filmId" size="4"/> 
		<input type="submit" value="Search" />
	</form>
</body>
</html>