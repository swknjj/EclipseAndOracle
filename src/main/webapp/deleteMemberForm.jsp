<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>인사관리 퇴사처리 화면</h2>
	<form action="deleteMember.jsp">
	성명 : <input type="text" name="name"> <br>
	사원번호 : <input type="text" name="id"> <br>
	<input type="submit" value="삭제">
	<input type="button" onclick="index()" value="취소">
	</form>
</body>
<script>
	const index = () => {
		location.href="index.jsp";
	}
</script>
</html>