<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="gd.emp.Deptemp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deptEmpList</title>
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
		request.setCharacterEncoding("UTF-8");
	
		String searchWord = "";
		if(request.getParameter("searchWord") != null) {
			searchWord = request.getParameter("searchWord");
		}
		System.out.println(searchWord + " <-- searchWord");
		
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int rowPerPage = 25;
		int beginRow = (currentPage - 1) * rowPerPage;
		
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mariadb://localhost:3306/employees", "root", "java1234");
		
		ArrayList<Deptemp> list = new ArrayList<Deptemp>();
		PreparedStatement stmt1 = null;
		
		if(searchWord.equals("")) {
			stmt1 = conn.prepareStatement("select emp_no, dept_no, from_date, to_date from dept_emp order by dept_no asc, emp_no asc limit ?, ?");
			stmt1.setInt(1, beginRow);
			stmt1.setInt(2, rowPerPage);
		} else {
			stmt1 = conn.prepareStatement(
					"select emp_no, dept_no, from_date, to_date from dept_emp where emp_no LIKE ? or dept_no LIKE ? order by dept_no asc, emp_no asc LIMIT ?, ?");
			stmt1.setString(1, "%"+searchWord+"%");
			stmt1.setString(2, "%"+searchWord+"%");
			stmt1.setInt(3, beginRow);
			stmt1.setInt(4, rowPerPage);
		}
		
		ResultSet rs1 = stmt1.executeQuery();
		
		while (rs1.next()) {
			Deptemp e = new Deptemp();
			e.empNo = rs1.getInt("emp_no");
			e.deptNo = rs1.getString("dept_no");
			e.fromDate = rs1.getString("from_date");
			e.toDate = rs1.getString("to_date");
			list.add(e);
		}
		
		PreparedStatement stmt2 = null;
		if(searchWord.equals("")) {
			stmt2 = conn.prepareStatement("select count(*) from dept_emp");
		} else {
			stmt2 = conn.prepareStatement("select count(*) from dept_emp where emp_no = ? or dept_no = ?");
			stmt2.setString(1, searchWord);
			stmt2.setString(2, searchWord);
		}
		
		int lastPage = 0;
		int totalRow = 0;
		
		ResultSet rs2 = stmt2.executeQuery();
		if(rs2.next()) {
			totalRow = rs2.getInt("count(*)");
		}
		
		lastPage = totalRow / rowPerPage;
		if(totalRow%rowPerPage != 0) {
			lastPage += 1;
		}
	%>
	<div class="container-fluid">
	<!-- Navigation MainMenu -->
	<div>
		<!-- Mainmenu 부분을 모듈처럼 활용하는 코드임(jsp는 모듈처럼 불러오는게 가능하다고함) -->
		<jsp:include page="/inc/Mainmenu.jsp"></jsp:include>
	</div>
	<h1 class="text-secondary">deptEmpList</h1>
		<table class="table table-dark">
			<thead>
				<tr>
					<th>emp_no</th>
					<th>dept_no</th>
					<th>from_date</th>
					<th>to_date</th>
					<th>update</th>
				</tr>
			</thead>
			<tbody>
				<!-- rs.next와 같은표현, 동적배열을 할때 읽기전용 -->
				<%
					for (Deptemp e : list) {
				%>
				<tr>
					<td><%=e.empNo%></td>
					<td><%=e.deptNo%></td>
					<td><%=e.fromDate%></td>
					<td><%=e.toDate%></td>
					<td><a class="btn btn-secondary" href="">update</a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<form action="<%=request.getContextPath()%>/deptEmp/deptEmpList.jsp">
		<input type="text" name="searchWord">
		<button type="submit" class="btn btn-secondary">searchWord</button>
	</form>
	<ul class="pagination">
	<!-- 현재페이지 이전으로 넘길때 -->
	<%
		if (currentPage > 1) {
	%>
		<li class="page-item">
		<a class="page-link text-secondary" href="<%=request.getContextPath()%>/deptEmp/deptEmpList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
		</li>
	<%
		}
	%>
	<!-- 현재페이지 다음으로 넘길때 -->
	<%
		if (currentPage < lastPage) {
	%>
		<li class="page-item">
		<a class="page-link text-secondary" href="<%=request.getContextPath()%>/deptEmp/deptEmpList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
		</li>
	<%
		}
	%>
	</ul>
	<div class="text-dark" style="text-align: center">copyright ⓒ  Dong</div>
</body>
</html>