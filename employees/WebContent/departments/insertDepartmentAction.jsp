<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		// 열, dept_no, dept_name
		// dept_no ?
		// dept_no를 구할수있는 알고리즘
		
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
		PreparedStatement stmt = conn.prepareStatement("select dept_no from departments order by dept_no desc limit 0,1");
		ResultSet rs = stmt.executeQuery();
		String deptNo = "";
		if(rs.next()) {
			deptNo = rs.getString("dept_no");
		} System.out.println(deptNo);
		
		// ()에 있는 부분부터 잘라달라는 메소드이다
		String deptNo2 = deptNo.substring(2);
		System.out.println(deptNo2);
		
		int deptNo3 = Integer.parseInt(deptNo2);
		System.out.println(deptNo3);
		
		int nextDeptNo = deptNo3 + 1;
		System.out.println(nextDeptNo);
		
		String nextDeptNo2 = "";
		
		/* 이해는 이게 더 쉬운데 밑에꺼가 더 좋은코드
		
		if(nextDeptNo > 99) {
			nextDeptNo2 = "d00" + nextDeptNo;
		} else if(nextDeptNo > 9) {
			nextDeptNo2 = "d0" + nextDeptNo;
		} else {
			nextDeptNo2 = "d" + nextDeptNo;
		}
		
		*/
		
		if(nextDeptNo/100 > 0) {
			nextDeptNo2 = "d00" + nextDeptNo;
		} else if(nextDeptNo/10 > 0) {
			nextDeptNo2 = "d0" + nextDeptNo;
		} else {
			nextDeptNo2 = "d" + nextDeptNo;
		}
		
		// dept_name
		String deptName = request.getParameter("deptName");
		PreparedStatement stmt2 = conn.prepareStatement("insert into departments(dept_no, dept_name) values(?, ?)");
		stmt2.setString(1, nextDeptNo2);
		stmt2.setString(2, deptName);
		stmt2.executeUpdate();
		response.sendRedirect(request.getContextPath()+"/departments/departmentsList.jsp");
	%>
</body>
</html>