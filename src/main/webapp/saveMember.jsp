<%@ page import="com.test.test1.dao.MemberDAO" %>
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
		String dept = request.getParameter("dept");
		String duty = request.getParameter("duty");
		String position = request.getParameter("position");
		String phone = request.getParameter("phone");
		System.out.println("name+id+dept+duty+position+phone = "+name+id+dept+duty+position+phone);
		MemberDAO memberDAO = new MemberDAO();
		int result = memberDAO.saveMember(name,id,dept,duty,position,phone);
		if(result>0) {
	%> 
	<script>
	alert("저장 성공! index.jsp로 돌아갑니다");
	location.href = "index.jsp";
	</script>
	
	<%
		} else {
	%>
	<script>
	alert("저장 실패");
	</script>
	<%
		}
	%>
</body>
</html>