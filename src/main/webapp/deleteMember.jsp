<%@ page import="com.test.test1.dao.MemberDAO" %>
<%@ page import="com.test.test1.dto.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		System.out.println("name+id = "+name+id);
		MemberDAO memberDAO = new MemberDAO();
		int result = memberDAO.deleteMember(name,id);
		if(result>0) {
			%> 
			<script>
			alert("회원삭제 완료");
			location.href = "index.jsp";
			</script>
			<%
				} else {
			%>
			<script>
			alert("회원정보가 없습니다");
			location.href = "index.jsp";
			</script>
			<%
				}
			%>
</body>
</html>