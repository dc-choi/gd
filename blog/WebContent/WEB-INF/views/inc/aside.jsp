<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- subject(나라이름) list -->
<div>
	MENU
</div>
<ul>
	<li>
		<a href="${pageContext.request.contextPath}/HomeServlet">Home</a>
	</li>
	<c:forEach var="s" items="${subjectList}">
		<li>
			<a href="${pageContext.request.contextPath}/SelectPostBySubjectServlet?subjectName=${s.subjectName}">${s.subjectName}</a>
		</li>
	</c:forEach>
</ul>