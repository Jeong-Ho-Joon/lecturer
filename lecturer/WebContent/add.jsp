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
	<h3>������ �߰�</h3>
	<table border="1">
		<tr>
			<td>�������ڵ�</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>�����</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
		<td>��簭��</td>
		<td>
		<select name='lecturer'>
		<option value="0">�����ϼ���</option>
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
			<td>����</td>
			<td><input type="text" name="credit"></td>
		</tr>
		<tr>
			<td>����</td>
			<td>
			<input type="radio" name="week" value="1">��
			<input type="radio" name="week" value="2">ȭ
			<input type="radio" name="week" value="3">��
			<input type="radio" name="week" value="4">��
			<input type="radio" name="week" value="5">��
			<input type="radio" name="week" value="6">��
			</td>
		</tr>
		<tr>
			<td>����</td>
			<td><input type="text" name="start_hour"></td>
		</tr>
		<tr>
			<td>����</td>
			<td><input type="text" name="end_end"></td>
		</tr>
	</table>
<input type="button" value="���">
<input type="submit" value="�ۼ�">
</div>
<%@include file="footer.jsp" %>
</form>
</body>
</html>