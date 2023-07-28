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
		String dept = request.getParameter("dept");
		String duty = request.getParameter("duty");
		String position = request.getParameter("position");
		String phone = request.getParameter("phone");
		System.out.println("name+id+dept+duty+position+phone = "+name+id+dept+duty+position+phone);
		MemberDAO memberDAO = new MemberDAO();
		boolean result = memberDAO.findMember(id);
		memberDAO.updateMember(name,id,dept,duty,position,phone);
		if(!result) {
			%> 
			<script>
			alert("회원정보가 없습니다");
			location.href = "index.jsp";
			</script>
			<%
				} else {
			%>
			<script>
			alert("회원수정 완료");
			location.href = "index.jsp";
			</script>
			<%
				}
			%>
</body>
</html>