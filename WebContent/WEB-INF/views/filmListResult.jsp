<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film List</title>
</head>
<body>
	Films:
	<ol>
	<c:forEach var="film" items="${films }">
			<li><a href="getFilmByID.do?filmId=${film.filmId}">ID: ${film.filmId} - ${film.title}</a></li>
	</c:forEach>
	</ol>

</body>
</html>