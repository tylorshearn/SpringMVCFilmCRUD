<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Searching by Keyword/Pattern</title>
</head>
<body>
<h3>Search for your film by a keyword or pattern in its title or description</h3>
	<form action="searchByKeyPat.do" method="GET">
		<b>Keyword or pattern:</b>
		<input type="text" name="abbr" size="4"/> 
		<input type="submit" value="Search" />
	</form>
</body>
</html>