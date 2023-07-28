<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>인사관리 사원등록화면</h2>
	<form action="saveMember.jsp">
	성명 : <input type="text" name="name"> <br>
	사원번호 : <input type="text" name="id"> <br>
	소속부서:
	<select name="dept">
		<option value="인사부">인사부</option>
		<option value="기획부">기획부</option>
		<option value="홍보부">홍보부</option>
		<option value="영업부">영업부</option>
		<option value="경리부">경리부</option>
	</select><br>
	직급:
	<select name="position">
		<option value="1">1급</option>
		<option value="2">2급</option>
		<option value="3">3급</option>
		<option value="4">4급</option>
	</select><br>
	직책 : <input type="text" name="duty"> <br>
	연락처 : <input type="text" name="phone"> <br>
	<input type="submit" value="등록">
	<input type="button" onclick="index()" value="취소">
	</form>
</body>
<script>
	const index = () => {
		location.href="index.jsp";
	}
</script>
</html>