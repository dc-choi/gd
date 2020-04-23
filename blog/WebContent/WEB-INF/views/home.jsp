<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>HOME List</title>
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
        <h1>HOME</h1>
        <div>
            <c:if test="${loginMember == null}">
            	<a href="${pageContext.request.contextPath}/LoginServlet">Login</a>
            	<a href="${pageContext.request.contextPath}/AddMemberServlet">Sign Up</a>
            </c:if>
            <c:if test="${loginMember != null}">
            	${loginMember.memberId}님 환영합니다.<br>
            	<a href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
            	<a href="${pageContext.request.contextPath}/SelectMemberServlet">${loginMember.memberId}'s Member Info</a>
            	Member Level is ${loginMember.memberLevel}
            </c:if>
        </div>
        <div>
        	<c:if test="${loginMember != null && loginMember.memberLevel < 10}">
        		<a href="${pageContext.request.contextPath}/AdminServlet">Admin</a>
        	</c:if>
        </div>
    </div>
</body>
</html>
