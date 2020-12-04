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
	String sql = "select * from lecturer_tbl";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(uri, user, password);
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="addAction.jsp" method="post" name="frm">
<%@include file="header.jsp" %>
<div align="center">
	<h3>교과목 추가</h3>
	<table border="1">
		<tr>
			<td>교과목코드</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>과목명</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
		<td>담당강사</td>
		<td>
		<select name='lecturer'>
		<option value="0">선택하세요</option>
		<%
			try {
					while(rs.next()) {
					out.println("<option value='"+ rs.getString("idx") + "'>" + rs.getString("name") +"</option>");
					}
			} catch(Exception e) {
				e.printStackTrace();
			}
		%>
		</select>
		</td>
		</tr>
		<tr>
			<td>학점</td>
			<td><input type="text" name="credit"></td>
		</tr>
		<tr>
			<td>요일</td>
			<td>
			<input type="radio" name="week" value="1">월
			<input type="radio" name="week" value="2">화
			<input type="radio" name="week" value="3">수
			<input type="radio" name="week" value="4">목
			<input type="radio" name="week" value="5">금
			<input type="radio" name="week" value="6">토
			</td>
		</tr>
		<tr>
			<td>시작</td>
			<td><input type="text" name="start_hour"></td>
		</tr>
		<tr>
			<td>종료</td>
			<td><input type="text" name="end_end"></td>
		</tr>
	</table>
<input type="button" value="목록">
<input type="submit" value="작성">
</div>
<%@include file="footer.jsp" %>
</form>
</body>
</html>