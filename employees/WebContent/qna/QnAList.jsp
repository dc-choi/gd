<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="gd.emp.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA List</title>
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
		// searchWord 설정
		String searchWord = "";
		if(request.getParameter("searchWord") != null) {
			searchWord = request.getParameter("searchWord");
		}
		System.out.println(searchWord + " <-- searchWord");
	
		// currentPage 설정
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		System.out.println(currentPage + "<-- currentPage");
		
		int rowPerPage = 5;
		int beginRow = (currentPage - 1) * rowPerPage;
		//System.out.println(beginRow +" <-- beginRow");
		
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
		PreparedStatement stmt1 = null;
		
		if(searchWord.equals("")) {
			stmt1 = conn.prepareStatement(
					"select qna_no, qna_title, qna_content, qna_user, qna_ip, qna_date from qna order by qna_no asc limit ?, ?");
			stmt1.setInt(1, beginRow);
			stmt1.setInt(2, rowPerPage);
		} else {
			/*
				select qna_no, qna_title, qna_content, qna_user, qna_ip, qna_date
				from qna
				where qna_title like '%...%'
				order by qna_no asc
				limit ?, ? 
			*/
			stmt1 = conn.prepareStatement(
					"select qna_no, qna_title, qna_content, qna_user, qna_ip, qna_date from qna where qna_title like ? order by qna_no asc limit ?, ?");
			stmt1.setString(1, "%"+searchWord+"%");
			stmt1.setInt(2, beginRow);
			stmt1.setInt(3, rowPerPage);
		}
		System.out.println(stmt1 + "<-- stmt1");
		
		ResultSet rs1 = stmt1.executeQuery();
		
		ArrayList<Qna> list = new ArrayList<Qna>();
		while(rs1.next()) {
			Qna qna = new Qna();
			qna.qnaNo = rs1.getInt("qna_no");
			qna.qnaTitle = rs1.getString("qna_title");
			qna.qnaUser = rs1.getString("qna_user");
			qna.qnaDate = rs1.getString("qna_date");
			list.add(qna);
		}
		//System.out.println(list.size()+"<-- list.size()");
		
		int lastPage = 0;
		int totalRow = 0;
		PreparedStatement stmt2 = null;
		
		if(searchWord.equals("")) {
			stmt2 = conn.prepareStatement("select count(*) from qna");
		} else {
			stmt2 = conn.prepareStatement("select count(*) from qna where qna_title = ?");
			stmt2.setString(1, searchWord);
		}
		
		ResultSet rs2 = stmt2.executeQuery();
		if (rs2.next()) {
			totalRow = rs2.getInt("count(*)");
		}
		//System.out.println(totalRow + " <-- totalRow");

		lastPage = totalRow / rowPerPage;
		if (totalRow % rowPerPage != 0) {
			lastPage += 1;
		}
	%>
	<div class="container-fluid">
	<!-- Navigation MainMenu -->
	<div>
		<!-- Mainmenu 부분을 모듈처럼 활용하는 코드임(jsp는 모듈처럼 불러오는게 가능하다고함) -->
		<jsp:include page="/inc/Mainmenu.jsp"></jsp:include>
	</div>
	<h1 class="text-secondary">QnA List</h1>
	<h3 class="text-secondary">총 <small><%=totalRow%></small>개의 게시물이 있습니다</h3>
	<a class="btn btn-secondary" href="<%=request.getContextPath()%>/qna/QnAInsertForm.jsp">QnA 입력</a>
		<table class="table table-dark">
			<thead>
				<tr>
					<td>qna_no</td>
					<td>qna_title</td>
					<td>qna_user</td>
				</tr>
			</thead>
			<tbody>
				<%
					for (Qna q : list) {
						String qnaDateSub = q.qnaDate.substring(0, 10);
						//System.out.println(qnaDateSub + "<--qnaDate.substring");
						// 모든 문법중에서 날짜타입이 제일 어렵다고함
						Calendar today = Calendar.getInstance();
						int year = today.get(Calendar.YEAR);
						int month = today.get(Calendar.MONTH) + 1;
						String month2 =""+month;
						if(month<10) {
							month2 = "0"+month;
						}
						int day = today.get(Calendar.DATE);
						String day2 = ""+day;
						if(day<10) {
							day2 = "0"+day;
						}
						String strToday = year + "-" + month2 + "-" + day2;
						//System.out.println(strToday + "<--strToday");
				%>
				<tr>
					<td><%=q.qnaNo%></td>
					<td>
					<a class="text-info" href="<%=request.getContextPath()%>/qna/selectQnA.jsp?qnaNo=<%=q.qnaNo%>"><%=q.qnaTitle%></a>
					<%
						if (strToday.equals(qnaDateSub)) {
					%>
					<span class="badge badge-warning">new</span>
					<%		
						}
					%>
					</td>
					<td><%=q.qnaUser%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<form action="<%=request.getContextPath()%>/qna/QnAList.jsp">
		<input type="text" name="searchWord">
		<button type="submit" class="btn btn-secondary">searchWord</button>
	</form>
	<ul class="pagination">
		<%
			if (currentPage > 1) {
		%>
			<li class="page-item">
			<a class="page-link text-secondary" href="<%=request.getContextPath()%>/qna/QnAList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
			</li>
		<%
			}
		%>
		
		<%
			if (currentPage < lastPage) {
				System.out.println(currentPage);
		%>
			<li class="page-item">
			<a class="page-link text-secondary" href="<%=request.getContextPath()%>/qna/QnAList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
			</li>
		<%
			} // System.out.println(request.getContextPath());
			System.out.println(currentPage);
		%>
	</ul>
	<div class="text-dark" style="text-align: center">copyright ⓒ  Dong</div>
</body>
</html>