<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="gd.emp.Salaries" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>salariesList</title>
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
<body class="bg-light">
	<%
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int rowPerPage = 25;
		int beginRow = (currentPage - 1)* rowPerPage;
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mariadb://localhost:3306/employees", "root", "java1234");
		
		ArrayList<Salaries> list = new ArrayList<Salaries>();
		PreparedStatement stmt1 = conn.prepareStatement(
				"select emp_no, salary, from_date, to_date from salaries order by emp_no asc limit ?, ?");
		stmt1.setInt(1, beginRow);
		stmt1.setInt(2, rowPerPage);
		ResultSet rs1 = stmt1.executeQuery();
		
		while (rs1.next()) {
			Salaries s = new Salaries();
			s.empNo = rs1.getInt("emp_no");
			s.salary = rs1.getInt("emp_no");
			s.fromDate = rs1.getString("from_date");
			s.toDate = rs1.getString("to_date");
			list.add(s);
		}
		
		int lastPage = 0;
		int totalRow = 0;
		PreparedStatement stmt2 = conn.prepareStatement("select count(*) from salaries");
		ResultSet rs2 = stmt2.executeQuery();
		if(rs2.next()) {
			totalRow = rs2.getInt("count(*)");
		} System.out.println(totalRow);
		
		lastPage = totalRow / rowPerPage;
		if(totalRow % rowPerPage != 0) {
			lastPage += 1;
		} System.out.println(lastPage);
	%>
	<div class="container-fluid">
	<div>
		<jsp:include page="/inc/Mainmenu.jsp"></jsp:include>
	</div>
	<h1 class="text-secondary">salaries</h1>
		<table class="table table-dark">
			<thead>
				<tr>
					<th>emp_no</th>
					<th>salary</th>
					<th>from_date</th>
					<th>to_date</th>
					<th>update</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (Salaries s : list) {
				%>
				<tr>
					<td><%=s.empNo%></td>
					<td><%=s.salary%></td>
					<td><%=s.fromDate%></td>
					<td><%=s.toDate%></td>
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
			<li>
			<a class="page-link text-secondary" href="<%=request.getContextPath()%>/salaries/salariesList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
			</li>
		<%
			}
		%>
		<%
			if (currentPage < lastPage) {
		%>
			<li>
			<a class="page-link text-secondary" href="<%=request.getContextPath()%>/salaries/salariesList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
			</li>
		<%
			}
		%>
	</ul>
	<div class="text-dark" style="text-align: center">copyright ⓒ  Dong</div>
</body>
</html>