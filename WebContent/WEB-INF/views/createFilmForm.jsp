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
		<b>Title:</b>
		<input type="text" name="title" size="4"/> 
		<b>Description:</b>
		<input type="text" name="description" size="4"/> 
		<b>Release year:</b>
		<input type="number" name="releaseYear" size="4"/><br>  
		<br><b>Language:</b>
		<br><input type="radio" id="1" name="languageId" value="1">
		<label for="1"><b>English</b></label><br>
		<input type="radio" id="2" name="languageId" value="2">
		<label for="2"><b>Italian</b></label><br>
		<input type="radio" id="3" name="languageId" value="3">
		<label for="3"><b>Japanese</b></label><br>
		<input type="radio" id="4" name="languageId" value="4">
		<label for="4"><b>Mandarin</b></label><br>
		<input type="radio" id="5" name="languageId" value="5">
		<label for="5"><b>French</b></label><br>	
		<input type="radio" id="6" name="languageId" value="6">
		<label for="6"><b>German</b></label><br>	
		<br><b>Rental Duration:<br>(# of days)</b>
		<input type="number" name="rentalDuration" size="4"/><br> 
		<br><b>Rental Rate:<br>(Price of rental in dollar amount)</b>
		<input type="number" step="0.01" name="rentalRate" size="4"/><br> 
		<br><b>Length:<br>(In minutes)</b>
		<input type="number" name="length" size="4"/><br> 
		<br><b>Replacement Cost:<br>(Price of replacement in dollar amount)</b>
		<input type="number" step="0.01" name="replacementCost" size="4"/><br> 
		<br><b>Rating:</b>
		<br><input type="radio" id="G" name="rating" value="G">
		<label for="G"><b>G</b></label><br>
		<input type="radio" id="PG" name="rating" value="PG">
		<label for="PG"><b>PG</b></label><br>
		<input type="radio" id="PG13" name="rating" value="PG13">
		<label for="PG13"><b>PG13</b></label><br>
		<input type="radio" id="R" name="rating" value="R">
		<label for="R"><b>R</b></label><br>
		<input type="radio" id="NC17" name="rating" value="NC17">
		<label for=""><b>NC17</b></label><br>	
		<br><b>Special Features:</b>
		<br><input type="checkbox" id="Trailers" name="specialFatures" value="Trailers">
		<label for="Trailers"> <b>Trailers</b></label><br>
		<input type="checkbox" id="Commentaries" name="specialFeatures" value="Commentaries">
		<label for="Commentaries"> <b>Commentaries</b></label><br>
		<input type="checkbox" id="Deleted Scenes" name="specialFeatures" value="Deleted Scenes">
		<label for="Deleted Scenes"> <b>Deleted Scenes</b></label><br>
		<input type="checkbox" id="Behind the Scenes" name="specialFeatures" value="Behind the Scenes">
		<label for="Behind the Scenes"> <b>Behind the Scenes</b></label><br>
		<br><input type="submit" value="Create" />
	</form>
</body>
</html>