<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("EUC-KR");
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String lecturer = request.getParameter("lecturer");
	String credit = request.getParameter("credit");
	String week = request.getParameter("week");
	String start_hour = request.getParameter("start_hour");
	String end_end = request.getParameter("end_end");
	
	System.out.println(id);
	System.out.println(name);
	System.out.println(lecturer);
	System.out.println(credit);
	System.out.println(week);
	System.out.println(start_hour);
	System.out.println(end_end);
	
	String user = "kosea";
	String password = "1234";
	String uri = "jdbc:oracle:thin:@localhost:1521:xe";
	String sql = "insert into course_tbl values(?,?,?,?,?,?,?)";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(uri, user, password);
	pstmt = conn.prepareStatement(sql);
	
	try {
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, credit);
		pstmt.setString(4, lecturer);
		pstmt.setString(5, week);
		pstmt.setString(6, start_hour);
		pstmt.setString(7, end_end);
		pstmt.executeQuery();
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	alert("추가되었습니다");
	location.href="index.jsp";
</script>
</body>
</html>