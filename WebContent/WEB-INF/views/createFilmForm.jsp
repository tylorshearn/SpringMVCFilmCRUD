<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Creating Film</title>
</head>
<body>
<h3>Create your film</h3>
	<form action="createFilm.do" method="POST">
		<b>ID:</b>
		<input type="number" name="filmId" size="4"/> 
		<b>Title:</b>
		<input type="text" name="title" size="4"/> 
		<b>Description:</b>
		<input type="text" name="description" size="4"/> 
		<b>Release year:</b>
		<input type="number" name="releaseYear" size="4"/><br> 
		<br><b>Language ID:<br>("1"= English, "2"= Italian, "3"= Japanese, "4"= Mandarin, "5"= French, "6"= German)</b>
		<input type="text" name="languageId" size="4"/><br> 
		<br><b>Rental Duration:<br>(# of days)</b>
		<input type="number" name="rentalDuration" size="4"/><br> 
		<br><b>Rental Rate:<br>(Price of rental in dollar amount)</b>
		<input type="number" name="rentalRate" size="4"/><br> 
		<br><b>Length:<br>(In minutes)</b>
		<input type="number" name="length" size="4"/><br> 
		<br><b>Replacement Cost:<br>(Price of replacement in dollar amount)</b>
		<input type="number" name="replacementCost" size="4"/><br> 
		<br><b>Rating:</b>
		<input type="text" name="rating" size="4"/><br> 
		<br><b>Special Features:</b>
		<input type="text" name="specialFeatures" size="4"/><br> 
		<br><input type="submit" value="Create" />
	</form>
</body>
</html>