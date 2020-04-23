<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Member Info</title>
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
        <h1>Member Info</h1>
        <div>
            <div>member_id : ${member.memberId}</div>
            <div>member_pw : ${member.memberPw}</div>
            <div>member_level : ${member.memberLevel}</div>
            <div>member_date : ${member.memberDate}</div>
            <div>
        		<a href="${pageContext.request.contextPath}/HomeServlet">Back</a>
        	</div>
            <div>
            	<a href="${pageContext.request.contextPath}/DeleteMemberServlet">SIGN OUT</a>
            </div>
        </div>
    </div>
</body>
</html>
