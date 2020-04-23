<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="gd.emp.Title" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>titleList</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int rowPerPage = 20;
		int beginRow = (currentPage - 1) * rowPerPage;
		
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mariadb://localhost:3306/employees", "root", "java1234");
		
		ArrayList<Title> list = new ArrayList<Title>();
		PreparedStatement stmt1 = conn.prepareStatement(
				"select emp_no, title, from_date, to_date from titles order by emp_no asc limit ?, ?");
		stmt1.setInt(1, beginRow);
		stmt1.setInt(2, rowPerPage);
		ResultSet rs1 = stmt1.executeQuery();
		
		while (rs1.next()) {
			Title t = new Title();
			t.empNo = rs1.getInt("emp_no");
			t.title = rs1.getString("title");
			t.fromDate = rs1.getString("from_date");
			t.toDate = rs1.getString("to_date");
			list.add(t);
		}
		
		int lastPage = 0;
		int totalRow = 0;
		PreparedStatement stmt2 = conn.prepareStatement("select count(*) from titles");
		ResultSet rs2 = stmt2.executeQuery();
		if(rs2.next()) {
			totalRow = rs2.getInt("count(*)");
		}
		
		lastPage = totalRow/rowPerPage;
		if(totalRow%rowPerPage != 0) {
			lastPage += 1;
		}
	%>
	<div class="container-fluid">
	<div>
		<jsp:include page="/inc/Mainmenu.jsp"></jsp:include>
	</div>
	<h1 class="text-secondary">title</h1>
		<table class="table table-dark">
			<thead>
				<tr>
					<th>emp_no</th>
					<th>title</th>
					<th>from_date</th>
					<th>to_date</th>
					<th>update</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (Title t : list) {
				%>
				<tr>
					<td><%=t.empNo%></td>
					<td><%=t.title%></td>
					<td><%=t.fromDate%></td>
					<td><%=t.toDate%></td>
					<td><a class="btn btn-secondary" href="">update</a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<ul class="pagination">
	<%
		if (currentPage > 1) {
	%>
		<li class="page-item">
		<a class="page-link text-secondary" href="<%=request.getContextPath()%>/title/titleList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
		</li>
	<%
		}
	%>
	<%
		if (currentPage < lastPage) {
	%>
		<li class="page-item">
		<a class="page-link text-secondary" href="<%=request.getContextPath()%>/title/titleList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
		</li>
	<%
		}
	%>
	</ul>
	<div class="text-dark" style="text-align: center">copyright ⓒ  Dong</div>
</body>
</html>