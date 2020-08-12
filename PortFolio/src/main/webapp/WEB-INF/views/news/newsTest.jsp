<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c"  %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
하이 헬로우
<hr>
	<c:forEach var = "a" items = "${items}">
		<div style="border-bottom : 1px solid black;">
			<p>${a.title}</p>
			<p>${a.description}</p>
			<p>${a.pubDate}</p>
			<p>${a.author}</p>
			<p>
				<a href="${a.link}">자세한 내용 보기</a>
			</p>
		</div>
	</c:forEach>
</body>
</html>