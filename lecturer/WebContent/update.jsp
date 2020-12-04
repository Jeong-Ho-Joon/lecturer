<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String id = null;
	String name = null;
	String name2 = null;
	int idx = 0;
	int credit = 0;
	int week = 0;
	String start_hour = null;
	int ene_end = 0;

	String code = request.getParameter("code");

	String user = "kosea";
	String password = "1234";
	String uri = "jdbc:oracle:thin:@localhost:1521:xe";
	String sql = "select c.id, c.name, l.idx, l.name as name2, c.credit, c.week, c.start_hour, c.end_end from course_tbl c, lecturer_tbl l where c.lecturer = l.idx and c.id = " + code;
	String sql2 = "select * from lecturer_tbl";

	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(uri, user, password);
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	try {
		while (rs.next()) {
			id = rs.getString("id");
			name = rs.getString("name");
			name2 = rs.getString("name2");
			idx = rs.getInt("idx");
			credit = rs.getInt("credit");
			week = rs.getInt("week");
			start_hour = rs.getString("start_hour");
			ene_end = rs.getInt("end_end");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	if(start_hour.length() <= 3) {
		start_hour = "0" + start_hour;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="updateAction.jsp" method="post" name="frm">
		<%@include file="header.jsp"%>
		<div align="center">
			<h3>������ ����</h3>
			<table border="1">
				<tr>
					<td>�������ڵ�</td>
					<td><input type="text" name="id" value="<%=id%>"></td>
				</tr>
				<tr>
					<td>�����</td>
					<td><input type="text" name="name" value="<%=name%>"></td>
				</tr>
				<tr>
					<td>��簭��</td>
					<td><select name='lecturer'>
							<option value="<%=idx%>"><%=name2%></option>
							<%
								rs = stmt.executeQuery(sql2);
							try {
								while (rs.next()) {
									if (!rs.getString("name").equals(name2)) {
										out.println("<option value='" + rs.getString("idx") + "'>" + rs.getString("name") + "</option>");
									}
								}
							} catch (Exception e) {
								e.printStackTrace();
							}
							%>
					</select></td>
				</tr>
				<tr>
					<td>����</td>
					<td><input type="text" name="credit" value="<%=credit%>"></td>
				</tr>
				<tr>
					<td>����</td>
					<td>
					<%
						rs = stmt.executeQuery(sql);
						try {
							while(rs.next()) {
								if(rs.getInt("week") == 1) {
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "' checked>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>ȭ");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
								} else if(rs.getInt("week") == 2) {
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'checked>ȭ");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
								} else if(rs.getInt("week") == 3) {
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>ȭ");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'checked>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
								} else if(rs.getInt("week") == 4) {
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>ȭ");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'checked>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
								} else if(rs.getInt("week") == 5) {
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>ȭ");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'checked>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
								} else if(rs.getInt("week") == 6) {
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>ȭ");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>��");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'checked>��");
								}
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
					</td>
				</tr>
				<tr>
					<td>����</td>
					<td><input type="text" name="start_hour" value="<%=start_hour%>"></td>
				</tr>
				<tr>
					<td>����</td>
					<td><input type="text" name="end_end" value="<%=ene_end%>"></td>
				</tr>
			</table>
			<input type="button" value="���">
			<input type="submit" value="�ۼ�">
		</div>
		<%@include file="footer.jsp"%>
	</form>
</body>
</html>