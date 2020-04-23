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
        <h1>INDEX</h1>
        <div>
            <form method="post" action="${pageContext.request.contextPath}/AddPostServlet">
            	<input type="hidden" name="memberId" value="${loginMember.memberId}">
            	<div>
            		subject_name : 
            		<select name="subjectName">
            			<c:forEach var="s" items="${subjectList}">
            				<option value="${s.subjectName}">${s.subjectName}</option>
            			</c:forEach>
            		</select>
            	</div>
            	<div>
            		post_title : 
            		<input type="text" name="postTitle" value="post_title">
            	</div>
            	<div>
            		post_content : 
					<textarea rows="10" cols="80" name="postContent">post_content</textarea>
            	</div>
            	<div>
            		<button type="submit">Insert</button>
            	</div>
            </form>
        </div>
    </div>
</body>
</html>
