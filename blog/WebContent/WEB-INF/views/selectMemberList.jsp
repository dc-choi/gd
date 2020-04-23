<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Member List</title>
<meta charset="UTF-8">
<style>
    body {
        padding: 0;
        margin: 0;
        width: 100%;
        height: 100%;
        overflow: hidden;
        background-position: 0 0;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: cover;
        position: relative;
        overflow-y: auto;
    }
    
    #aside {
        width: 200px;
        height: 3000px;
        position: fixed;
        background: #FFEBCD;
        overflow: hidden;
        float: left;
    }
    
    #section {
        margin-left: 300px;
        background: white;
    }
</style>
</head>
<body>
    <div id="aside">
         <!-- subject(나라이름) list -->
        <jsp:include page="/WEB-INF/views/inc/aside.jsp"></jsp:include>
    </div>
    <div id="section">
        <h1>Member List</h1>
        <div>
            <table border="1">
            	<tr>
            		<th>member_id</th>
            		<th>member_level</th>
            		<th>UPDATE</th>
            	</tr>
            	<c:forEach var="m" items="${memberList}">
            	<tr>
            		<td>${m.memberId}</td>
            		<td>
            		<c:if test="${m.memberLevel < 10}">
            			Admin
            		</c:if>
            		<c:if test="${m.memberLevel >= 10}">
            			User
            		</c:if>
            		</td>
            		<td><a href="${pageContext.request.contextPath}/UpdateMemberServlet?memberId=${m.memberId}">UPDATE</a></td>
            	</tr>
            	</c:forEach>
			</table>
			<c:if test="${currentPage > 1}">
				<a href="${pageContext.request.contextPath}/SelectMemberListServlet?currentPage=${currentPage-1}">Previous</a>
			</c:if>
			<c:if test="${lastPage > currentPage}">
				<a href="${pageContext.request.contextPath}/SelectMemberListServlet?currentPage=${currentPage+1}">Next</a>
			</c:if>
        </div>
        <br>
        <div>
        	<a href="${pageContext.request.contextPath}/AdminServlet">Back</a>
        </div>
    </div>
</body>
</html>
