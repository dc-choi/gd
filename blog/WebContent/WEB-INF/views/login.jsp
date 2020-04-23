<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Login Form</title>
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
        <h1>Login Form</h1>
        <div>
        	<form method="post" action="${pageContext.request.contextPath}/LoginServlet">
	            <table border="1">
	            	<tr>
	            		<td>ID : </td>
	            		<td><input type="text" name="memberId"></td>
	            	</tr>
	            	<tr>
	            		<td>PW : </td>
	            		<td><input type="password" name="memberPw"></td>
	            	</tr>
	            	<tr>
	            		<td><button type="submit">Login</button></td>
	            	</tr>
	            </table>
            </form>
            <a href="${pageContext.request.contextPath}/AddMemberServlet">Sign Up</a>
        </div>
    </div>
</body>
</html>
