<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Post List</title>
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
        <h1>${loginMember.memberId} Post List</h1>
        <div>
        	<a href="${pageContext.request.contextPath}/AddPostServlet">Insert Post</a>
        </div>
        <div>
            <table border="1">
            	<tr>
            		<th>post_no</th>
            		<th>member_id</th>
            		<th>subject_name</th>
            		<th>post_title</th>
            		<th>post_date</th>
            	</tr>
            	<c:forEach var="p" items="${postList}">
	            	<tr>
	            		<td>${p.postNo}</td>
	            		<td>${p.memberId}</td>
	            		<td>${p.subjectName}</td>
	            		<td><a href="${pageContext.request.contextPath}/SelectPostOneServlet?postNo=${p.postNo}">${p.postTitle}</a></td>
	            		<td>${p.postDate}</td>
	            	</tr>
            	</c:forEach>
            </table>
            <c:if test="${currentPage > 1}">
            	<a href="${pageContext.request.contextPath}/SelectPostListServlet?currentPage=${currentPage-1}">Previous</a>
            </c:if>
            <c:if test="${lastPage > currentPage}">
            	<a href="${pageContext.request.contextPath}/SelectPostListServlet?currentPage=${currentPage+1}">Next</a>
            </c:if>
            <div>
    			<a href="${pageContext.request.contextPath}/AdminServlet">Back</a>
			</div>
        </div>
    </div>
</body>
</html>
