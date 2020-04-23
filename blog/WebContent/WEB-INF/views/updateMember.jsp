<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Member</title>
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
        <h1>Update Member</h1>
        <div>
            <form method="post" action="${pageContext.request.contextPath}/UpdateMemberServlet">
            	<div>
            		<input type="text" name="memberId" value="${member.memberId}" readonly="readonly">
            	</div>
            	<div>
            		<input type="password" value="${member.memberPw}" readonly="readonly">
            	</div>
            	<div>
            		<select name="memberLevel">
            			<option value="0">Admin</option>
            			<option value="10">User</option>
            		</select>
            	</div>
            	<div>
            		<input type="text" value="${member.memberDate}" readonly="readonly">
            	</div>
            	<button type="submit">UPDATE</button>
            </form>
        </div>
    </div>
</body>
</html>
