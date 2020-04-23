<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="gd.emp.Deptmanager"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deptManagerList</title>
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
		
		int rowPerPage = 10;
		int beginRow = (currentPage - 1) * rowPerPage;
		
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
		
		ArrayList<Deptmanager> list = new ArrayList<Deptmanager>();
		PreparedStatement stmt1 = null;
		ResultSet rs1 = null;
		stmt1 = conn.prepareStatement(
				"select dept_no, emp_no, from_date, to_date from dept_manager order by dept_no asc, emp_no asc limit ?, ?");
		stmt1.setInt(1, beginRow);
		stmt1.setInt(2, rowPerPage);
		rs1 = stmt1.executeQuery();
		while (rs1.next()) {
			Deptmanager m = new Deptmanager();
			m.deptNo = rs1.getString("dept_no");
			m.empNo = rs1.getInt("emp_no");
			m.fromDate = rs1.getString("from_date");
			m.toDate = rs1.getString("to_date");
			list.add(m);
		} System.out.println(list.size());
		
		int lastPage = 0;
		int totalRow = 0;
		PreparedStatement stmt2 = null;
		ResultSet rs2 = null;
		stmt2 = conn.prepareStatement("select count(*) from dept_manager");
		rs2 = stmt2.executeQuery();
		if(rs2.next()) {
			totalRow = rs2.getInt("count(*)");
		} System.out.println(totalRow);
		
		lastPage = totalRow/rowPerPage;
		if(totalRow % rowPerPage != 0) {
			lastPage += 1;
		} 
	%>
	<!-- Navigation MainMenu -->
	<div class="container-fluid">
		<!-- Mainmenu 부분을 모듈처럼 활용하는 코드임(jsp는 모듈처럼 불러오는게 가능하다고함) -->
		<div>
		<jsp:include page="/inc/Mainmenu.jsp"></jsp:include>
		</div>
		<h1 class="text-secondary">deptManagerList</h1>
		<table class="table table-dark">
			<thead>
				<tr>
					<th>dept_no</th>
					<th>emp_no</th>
					<th>from_date</th>
					<th>to_date</th>
					<th>update</th>
				</tr>
			</thead>
			<tbody>
				<!-- rs.next와 같은표현, 동적배열을 할때 읽기전용 -->
				<%
					for (Deptmanager m : list) {
				%>
				<tr>
					<td><%=m.deptNo%></td>
					<td><%=m.empNo%></td>
					<td><%=m.fromDate%></td>
					<td><%=m.toDate%></td>
					<td><a class="btn btn-secondary" href="">update</a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<ul class="pagination">
	<!-- 현재페이지 이전으로 넘길때 -->
	<%
		if (currentPage > 1) {
	%>
		<li class="page-item">
		<a class="page-link text-secondary" href="<%=request.getContextPath()%>/deptManager/deptManagerList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
		</li>
	<%
		}
	%>
	<!-- 현재페이지 다음으로 넘길때 -->
	<%
		if (currentPage < lastPage) {
	%>
		<li class="page-item">
		<a class="page-link text-secondary" href="<%=request.getContextPath()%>/deptManager/deptManagerList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
		</li>
	<%
		}
	%>
	</ul>
	<div class="text-dark" style="text-align: center">copyright ⓒ  Dong</div>
</body>
</html>