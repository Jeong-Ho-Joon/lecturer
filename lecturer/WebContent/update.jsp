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
			<h3>교과목 수정</h3>
			<table border="1">
				<tr>
					<td>교과목코드</td>
					<td><input type="text" name="id" value="<%=id%>"></td>
				</tr>
				<tr>
					<td>과목명</td>
					<td><input type="text" name="name" value="<%=name%>"></td>
				</tr>
				<tr>
					<td>담당강사</td>
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
					<td>학점</td>
					<td><input type="text" name="credit" value="<%=credit%>"></td>
				</tr>
				<tr>
					<td>요일</td>
					<td>
					<%
						rs = stmt.executeQuery(sql);
						try {
							while(rs.next()) {
								if(rs.getInt("week") == 1) {
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "' checked>월");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>화");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>수");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>목");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>금");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>토");
								} else if(rs.getInt("week") == 2) {
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>월");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'checked>화");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>수");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>목");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>금");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>토");
								} else if(rs.getInt("week") == 3) {
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>월");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>화");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'checked>수");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>목");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>금");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>토");
								} else if(rs.getInt("week") == 4) {
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>월");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>화");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>수");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'checked>목");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>금");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>토");
								} else if(rs.getInt("week") == 5) {
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>월");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>화");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>수");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>목");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'checked>금");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>토");
								} else if(rs.getInt("week") == 6) {
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>토");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>화");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>수");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>목");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'>금");
									out.println("<input type='radio' name='week' value='" + rs.getInt("week") + "'checked>토");
								}
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
					</td>
				</tr>
				<tr>
					<td>시작</td>
					<td><input type="text" name="start_hour" value="<%=start_hour%>"></td>
				</tr>
				<tr>
					<td>종료</td>
					<td><input type="text" name="end_end" value="<%=ene_end%>"></td>
				</tr>
			</table>
			<input type="button" value="목록">
			<input type="submit" value="작성">
		</div>
		<%@include file="footer.jsp"%>
	</form>
</body>
</html>