<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="gd.emp.Employees"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employeesList</title>
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
		// 1. 페이지
		// 현재 페이지 값 선언, 현재 페이지 불러오기
		int currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		// 최대 출력값 선언, 시작행 선언
		int rowPerPage = 25;
		int beginRow = (currentPage - 1) * 10;

		// 2. datebase에서 데이터 가져오기
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");

		// 3. 현재 페이지의 departments 테이블 행들
		// 행들을 저장하기위해 배열 선언
		ArrayList<Employees> list = new ArrayList<Employees>();
		PreparedStatement stmt1 = null;
		ResultSet rs1 = null;
		stmt1 = conn.prepareStatement(
				"select emp_no, birth_date, first_name, last_name, gender, hire_date from employees order by emp_no asc limit ?, ?");
		stmt1.setInt(1, beginRow);
		stmt1.setInt(2, rowPerPage);
		rs1 = stmt1.executeQuery();
		while (rs1.next()) {
			Employees e = new Employees();
			e.empNo = rs1.getInt("emp_no");
			e.birthDate = rs1.getString("birth_date");
			e.firstName = rs1.getString("first_name");
			e.lastName = rs1.getString("last_name");
			e.gender = rs1.getString("gender");
			e.hireDate = rs1.getString("hire_date");
			list.add(e);
		}
		
		// 4. departments 테이블 전체행의 수
		int lastPage = 0;
		int totalRow = 0;
		PreparedStatement stmt2 = null;
		ResultSet rs2 = null;
		stmt2 = conn.prepareStatement("select count(*) from employees");
		rs2 = stmt2.executeQuery();
		if (rs2.next() ) {
			totalRow = rs2.getInt("count(*)");
		}
		System.out.println(totalRow);
		
		lastPage = totalRow/rowPerPage;
		if (totalRow % rowPerPage != 0) {
			lastPage += 1;
		}
		System.out.println(lastPage);
	%>
	<div class="container-fluid">
		<!-- Main menu부분을 모듈식으로 사용할수있도록 하는 코드 -->
		<div class="container-fluid">
			<jsp:include page="/inc/Mainmenu.jsp"></jsp:include>
		</div>
		<h1 class="text-secondary">employeesList</h1>
		
		<!-- 사원 입력버튼 -->
		<div>
			<a href="<%=request.getContextPath()%>/employees/insertEmployeesForm.jsp" class="btn btn-secondary">입력</a>
		</div>
		
		<table class="table table-dark">
			<thead>
				<tr>
					<th>emp_no</th>
					<th>birth_date</th>
					<th>first_name</th>
					<th>last_name</th>
					<th>gender</th>
					<th>hire_date</th>
					<th>update</th>
				</tr>
			</thead>
			<tbody>
				<!-- rs.next와 같은표현, 동적배열을 할때 읽기전용 -->
				<%
					for (Employees e : list) {
				%>
				<tr>
					<td><%=e.empNo%></td>
					<td><%=e.birthDate%></td>
					<td><%=e.firstName%></td>
					<td><%=e.lastName%></td>
					<td><%=e.gender%></td>
					<td><%=e.hireDate%></td>
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
		<a class="page-link text-secondary" href="<%=request.getContextPath()%>/departments/departmentsList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
		</li>
	<%
		}
	%>
	<!-- 현재페이지 다음으로 넘길때 -->
	<%
		if (currentPage < lastPage) {
	%>
		<li class="page-item">
		<a class="page-link text-secondary" href="<%=request.getContextPath()%>/departments/departmentsList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
		</li>
	<%
		}
	%>
	</ul>
	<div class="text-dark" style="text-align: center">copyright ⓒ  Dong</div>
</body>
</html>