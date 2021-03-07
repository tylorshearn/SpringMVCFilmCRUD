<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Creating Film</title>
</head>
<body>
<h3>Update your film</h3>
	<form action="updateFilm.do" method="POST">
		<b>Film ID:</b>
		${film.filmId}
		<b>Title:</b>
		<input type="text" name="title" oninput="validity.valid||(value='');" value="${film.title}" size="4"/><br> 
		<br><b>Description:</b>
		<input type="text" name="description" min=0 oninput="validity.valid||(value='');" value="${film.description}" size="50"/><br> 
		<br><b>Release year:<br>(0-2155)</b>
		<input type="number" name="releaseYear" min=0 max= 2155 oninput="validity.valid||(value='');" value="${film.releaseYear}" size="4"/><br> 
		<br><b>Language:</b>
		<br><input type="radio" id="1" name="languageId" value="${film.languageId}">
		<label for="1"><b>English</b></label><br>
		<input type="radio" id="2" name="languageId" value="${film.languageId}">
		<label for="2"><b>Italian</b></label><br>
		<input type="radio" id="3" name="languageId" value="${film.languageId}">
		<label for="3"><b>Japanese</b></label><br>
		<input type="radio" id="4" name="languageId" value="${film.languageId}">
		<label for="4"><b>Mandarin</b></label><br>
		<input type="radio" id="5" name="languageId" value="${film.languageId}">
		<label for="5"><b>French</b></label><br>	
		<input type="radio" id="6" name="languageId" value="${film.languageId}">
		<label for="6"><b>German</b></label><br>	
		<br><b>Rental Duration:<br># of days (0-127)</b>
		<input type="number" name="rentalDuration" min=0 max=127 oninput="validity.valid||(value='');" value="${film.rentalDuration}" size="4"/><br> 
		<br><b>Rental Rate:<br>Price of rental in dollar amount(0-9.99)</b>
		<input type="number" step="0.01" name="rentalRate" min=0 max=9.99 oninput="validity.valid||(value='');" value="${film.rentalRate}" size="4"/><br> 
		<br><b>Length:<br>In minutes(0-999)</b>
		<input type="number" name="length" min=0 max=999 oninput="validity.valid||(value='');" value="${film.length}" size="4"/><br> 
		<br><b>Replacement Cost:<br>Price of replacement in dollar amount(0-29.99)</b>
		<input type="number" step="0.01" name="replacementCost" min=0 max=29.99 oninput="validity.valid||(value='');" value="${film.replacementCost}" size="4"/><br> 
		<br><b>Rating:</b>
		<br><input type="radio" id="G" name="rating" value="${film.rating}">
		<label for="G"><b>G</b></label><br>
		<input type="radio" id="PG" name="rating" value="${film.rating}">
		<label for="PG"><b>PG</b></label><br>
		<input type="radio" id="PG13" name="rating" value="${film.rating}">
		<label for="PG13"><b>PG13</b></label><br>
		<input type="radio" id="R" name="rating" value="${film.rating}">
		<label for="R"><b>R</b></label><br>
		<input type="radio" id="NC17" name="rating" value="${film.rating}">
		<label for=""><b>NC17</b></label><br>	
		<br><b>Special Features:</b>
		<br><input type="checkbox" id="Trailers" name="specialFatures" value="${film.specialFeatures}">
		<label for="Trailers"> <b>Trailers</b></label><br>
		<input type="checkbox" id="Commentaries" name="specialFeatures" value="${film.specialFeatures}">
		<label for="Commentaries"> <b>Commentaries</b></label><br>
		<input type="checkbox" id="Deleted Scenes" name="specialFeatures" value="${film.specialFeatures}">
		<label for="Deleted Scenes"> <b>Deleted Scenes</b></label><br>
		<input type="checkbox" id="Behind the Scenes" name="specialFeatures" value="${film.specialFeatures}">
		<label for="Behind the Scenes"> <b>Behind the Scenes</b></label><br>
		<br><input type="submit" value="Update" />
	</form>
</body>
</html>