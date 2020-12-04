<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String user = "kosea";
	String password = "1234";
	String uri = "jdbc:oracle:thin:@localhost:1521:xe";
	String sql = "select c.id, c.name, c.credit, l.name, c.week, c.start_hour, c.end_end from course_tbl c, lecturer_tbl l where c.lecturer = l.idx";
	String sql2 = "select count(*) from course_tbl";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(uri, user, password);
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
<%
	try {
		while(rs.next()) {
			out.println("총" + rs.getString(1) + "과목이 있습니다");
		}	
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<div align="center">
	<table border="1" style="text-align:center;">
		<tr>
			<th>과목코드</th>
			<th>과목명</th>
			<th>학점</th>
			<th>담당강사</th>
			<th>요일</th>
			<th>시작시간</th>
			<th>종료시간</th>
			<th>관리</th>
		</tr>
		<%
			rs = stmt.executeQuery(sql);
			try{
				while(rs.next()) {
					out.println("<tr>");
					out.println("<td>" + rs.getString("id") + "</td>");
					out.println("<td>" + rs.getString("name") + "</td>");
					out.println("<td>" + rs.getInt("credit") + "</td>");
					out.println("<td>" + rs.getString(4) + "</td>");
					if(rs.getInt("week") == 1) {
						out.println("<td>" + "월" + "</td>");
					} else if(rs.getInt("week") == 2) {
						out.println("<td>" + "화" + "</td>");
					} else if(rs.getInt("week") == 3) {
						out.println("<td>" + "수" + "</td>");
					} else if(rs.getInt("week") == 4) {
						out.println("<td>" + "목" + "</td>");
					} else if(rs.getInt("week") == 5) {
						out.println("<td>" + "금" + "</td>");
					} else if(rs.getInt("week") == 6) {
						out.println("<td>" + "토" + "</td>");
					}
					if(rs.getInt("start_hour") <= 999) {
						out.println("<td>" + "0" + rs.getInt("start_hour") + "</td>");
					} else {
						out.println("<td>" + rs.getInt("start_hour") + "</td>");
					}
					out.println("<td>" + rs.getInt("end_end") + "</td>");
					out.println("<td><a href='update.jsp?code=" + rs.getString("id") + "'>수정</a> / <a href='delete.jsp?code='>삭제</a></td>");
					out.println("</tr>");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
</div>
<div align="right">
<a href="add.jsp"><input type="button" value="작성"></a>
</div>
<%@include file="footer.jsp" %>
</body>
</html>