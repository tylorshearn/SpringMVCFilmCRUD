<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film Info</title>
</head>
<body>
	<c:choose>
		<c:when test="${! empty film && get == true}">
			<table>
				<thead>
					<tr>
						<th>Film ID</th>
						<th>Title</th>
						<th>Release Year</th>
						<th>Rating</th>
						<th>Language</th>
						<th>Description</th>
						<th>Category</th>
						<th>Actors</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${film.filmId}</td>
						<td>${film.title}</td>
						<td>${film.releaseYear}</td>
						<td>${film.rating}</td>
						<td>${film.language}</td>
						<td>${film.description}</td>
						<td>${film.category}</td>
						<td><ul><c:forEach var="actor" items="${film.actorsList}">
						<li>${actor.firstName} ${actor.lastName}</li>
						</c:forEach>
						</ul></td>
					</tr>
				</tbody>
			</table>

			<form action="deleteFilm.do" method="POST">
				<input type="hidden" name="filmId" value="${film.filmId }" /> <input
					type="submit" value="Delete Film from Database" />
			</form>
			<form action="createFilmForm.do?film=${film}&update=true" method="POST">
				<input type="submit" value="Update Film Information" />
			</form>

			<!-- 			<a href="home.do">Delete Film from Database</a>
			<br>
			<a href="home.do">Update Film Information</a> -->
		</c:when>

		<c:when test="${add == true}">

			<c:choose>
				<c:when test="${! empty film }">
					<p>Film successfully added!</p>
					<a href="getFilmByID.do?filmId=${film.filmId}">ID: ${film.filmId} - ${film.title}</a>
					<br>
				</c:when>
				<c:otherwise>
					<p>Film creation failed. Film not added to database.</p>
				</c:otherwise>
			</c:choose>

			<form action="createFilmForm.do">
				<input type="submit" value="Add another Film" />
			</form>

		</c:when>

		<c:when test="${deleteFunc == true}">
			<c:choose>
				<c:when test="${delete == true }">
					<p>Film successfully deleted.</p>
				</c:when>
				<c:otherwise>
					<p>Film deletion failed. Film was not deleted from the
						database.</p>
				</c:otherwise>
			</c:choose>
		</c:when>

		<c:when test="${updateFunc == true}">

			<c:choose>
				<c:when test="${update == true}">
					<p>Film successfully updated!</p>
					<a href="getFilmByID.do?filmId=${film.filmId}">ID: ${film.filmId} - ${film.title}
					</a>
					<br>
				</c:when>
			</c:choose>
			<c:otherwise>
				<p>Film update failed. Film not updated in database.</p>
Ï			</c:otherwise>

			<form action="createFilmForm.do">
				<input type="submit" value="Add another Film" />
			</form>
			<!-- 			<a href="home.do">Return to Homepage</a>
			<br>
			<a href="createFilmForm.do">Add another Film</a> -->
		</c:when>

		<c:otherwise>
			<p>No Film Found</p>
			<form action="searchByFilmIdForm.do">
				<input type="submit" value="Complete another Search by Id" />
			</form>
			<!-- 			<a href="home.do">Return to Homepage</a>
			<br>
			<a href="searchByFilmIdForm.do">Complete another Search by ID</a> -->
		</c:otherwise>
	</c:choose>

	<form action="home.do">
		<input type="submit" value="Return Home" />
	</form>

</body>
</html>