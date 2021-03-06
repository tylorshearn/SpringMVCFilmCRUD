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
		<b>Enter an ID:<br>(0-2000)</b>
		<input type="number" name="filmId" size="4" min=0 max =2000 oninput="validity.valid||(value='');"/> 
		<input type="submit" value="Search" />
	</form>
</body>
</html>