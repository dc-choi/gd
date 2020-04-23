<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="gd.emp.Departments"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>departmentsList</title>
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
		
		// 1. 페이지
		// 현제 페이지 값 선언
		int currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int rowPerPage = 6;
		int beginRow = (currentPage - 1) * rowPerPage;

		// 2. datebase에서 데이터 가져오기
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");

		// 3. 현재 페이지의 departments 테이블 행들
		// 행들을 저장하기위해 배열 선언
		ArrayList<Departments> list = new ArrayList<Departments>();
		PreparedStatement stmt1 = null;
		ResultSet rs1 = null;
		
		if(searchWord.equals("")) {
			stmt1 = conn.prepareStatement("select dept_no, dept_name from departments order by dept_no asc limit ?, ?");
			stmt1.setInt(1, beginRow);
			stmt1.setInt(2, rowPerPage);
		} else {
			stmt1 = conn.prepareStatement("select dept_no, dept_name from departments where dept_name like ? order by dept_no asc limit ?, ?");
			stmt1.setString(1, "%"+searchWord+"%");
			stmt1.setInt(2, beginRow);
			stmt1.setInt(3, rowPerPage);
		}
		
		rs1 = stmt1.executeQuery();
		while (rs1.next()) {
			Departments d = new Departments();
			d.deptNo = rs1.getString("dept_no");
			d.deptName = rs1.getString("dept_name");
			list.add(d);
		}
		// 디버깅 System.out.println(list.size());

		// 4. departments 테이블 전체행의 수
		int lastPage = 0;
		int totalRow = 0;
		PreparedStatement stmt2 = null;
		ResultSet rs2 = null;
		if(searchWord.equals("")) {
			stmt2 = conn.prepareStatement("select count(*) from departments");
		} else {
			stmt2 = conn.prepareStatement("select count(*) from departments where dept_name=?");
			stmt2.setString(1, searchWord);
		}
		
		rs2 = stmt2.executeQuery();
		if (rs2.next()) {
			totalRow = rs2.getInt("count(*)");
		}

		lastPage = totalRow / rowPerPage;
		if (totalRow % rowPerPage != 0) {
			lastPage += 1;
		}
	%>
	<div class="container-fluid">
		<div>
			<jsp:include page="/inc/Mainmenu.jsp"></jsp:include>
		</div>
		<h1 class="text-secondary">departmentsList</h1>

		<!-- 부서입력버튼 -->
		<div>
			<a href="<%=request.getContextPath()%>/departments/insertDepartmentsForm.jsp" class="btn btn-secondary">입력</a>
		</div>

		<table class="table table-dark">
			<thead>
				<tr>
					<th>dept_no</th>
					<th>dept_name</th>
					<th>update</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (Departments d : list) {
				%>
				<tr>
					<td><%=d.deptNo%></td>
					<td><%=d.deptName%></td>
					<td><a class="btn btn-secondary" href="">update</a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<form action="<%=request.getContextPath()%>/departments/departmentsList.jsp">
		<input type="text" name="searchWord">
		<button type="submit" class="btn btn-secondary">searchWord</button>
	</form>
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
				System.out.println(currentPage);
		%>
		<li class="page-item">
		<a class="page-link text-secondary" href="<%=request.getContextPath()%>/departments/departmentsList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
		</li>
		<%
			} // System.out.println(request.getContextPath());
			System.out.println(currentPage);
		%>
	</ul>
	<div class="text-dark" style="text-align: center">copyright ⓒ  Dong</div>
</body>
</html>