<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Comment</title>
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
        <h1>Update Comment</h1>
        <div>
            <form method="post" action="${pageContext.request.contextPath}/UpdateCommentServlet">
            	<c:forEach var="com" items="${commentList}">
	            	<div>
	            		comment_no : 
	            		<input type="text" name="commentNo" value="${com.commentNo}" readonly="readonly">
	            	</div>
	            	<div>
	            		post_no : 
	            		<input type="text" name="postNo" value="${com.postNo}" readonly="readonly">
	            	</div>
	            	<div>
	            		member_id : 
	            		<input type="text" value="${com.memberId}" readonly="readonly">
	            	</div>
	            	<div>
	            		comment_content : 
	            		<textarea rows="10" cols="80" name="commentContent">${com.commentContent}</textarea>
	            	</div>
            	</c:forEach>
            	<button type="submit">Update</button>
            </form>
        </div>
    </div>
</body>
</html>
