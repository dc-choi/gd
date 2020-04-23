<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<nav style="text-align: center" class="navbar navbar-expand-sm bg-light navbar-light">
		<ul class="navbar-nav">
			<li class="nav-item active">
			<a class="nav-link fas fa-home" href="<%=request.getContextPath()%>/index.jsp"></a>
			</li>
			<li class="nav-item">
			<a class="nav-link fas fa-smile-wink" href="<%=request.getContextPath()%>/about/about.jsp">Intro</a>
			</li>
			<li class="nav-item">
			<a class="nav-link far fa-lightbulb" href="<%=request.getContextPath()%>/departments/departmentsList.jsp">departments</a>
			</li>
			<li class="nav-item">
			<a class="nav-link fas fa-lightbulb" href="<%=request.getContextPath()%>/employees/employeesList.jsp">employees</a>
			</li>
			<li class="nav-item">
			<a class="nav-link far fa-lightbulb" href="<%=request.getContextPath()%>/deptEmp/deptEmpList.jsp">deptEmp</a>
			</li>
			<li class="nav-item">
			<a class="nav-link fas fa-lightbulb" href="<%=request.getContextPath()%>/deptManager/deptManagerList.jsp">deptManager</a>
			</li>
			<li class="nav-item">
			<a class="nav-link far fa-lightbulb" href="<%=request.getContextPath()%>/title/titleList.jsp">title</a>
			</li>
			<li class="nav-item">
			<a class="nav-link fas fa-lightbulb" href="<%=request.getContextPath()%>/salaries/salariesList.jsp">salaries</a>
			</li>
			<li class="nav-item">
			<a class="nav-link far fa-lightbulb" href="<%=request.getContextPath()%>/qna/QnAList.jsp">QnA</a>
			</li>
		</ul>
	</nav>