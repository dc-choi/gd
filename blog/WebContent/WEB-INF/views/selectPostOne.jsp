<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Select Post List</title>
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
        <h1>Select Post List</h1>
        <div>
            <table border="1">
            	<tr>
            		<td>post_no</td>
            		<td>${post.postNo}</td>
            	</tr>
            	<tr>
            		<td>member_id</td>
            		<td>${post.memberId}</td>
            	</tr>
            	<tr>
            		<td>subject_name</td>
            		<td>${post.subjectName}</td>
            	</tr>
            	<tr>
            		<td>post_title</td>
            		<td>${post.postTitle}</td>
            	</tr>
            	<tr>
            		<td>post_content</td>
            		<td>${post.postContent}</td>
            	</tr>
            	<tr>
            		<td>post_date</td>
            		<td>${post.postDate}</td>
            	</tr>
            </table>
        </div>
        <div>
            <!-- 좋아요, 싫어요 -->
            <c:if test="${loginMember == null}">
            	좋아요&nbsp;${map.count}개&nbsp;&nbsp;&nbsp;싫어요&nbsp;${map.uncount}개
            </c:if>
            <c:if test="${loginMember != null}">
            	<a href="${pageContext.request.contextPath}/AddLikeyServlet?postNo=${post.postNo}&likeyCk=1">좋아요</a>&nbsp;${map.count}개
            	&nbsp;&nbsp;&nbsp;
            	<a href="${pageContext.request.contextPath}/AddLikeyServlet?postNo=${post.postNo}&likeyCk=0">싫어요</a>&nbsp;${map.uncount}개
            </c:if>
        </div>
        <div>
            <!-- 수정, 삭제 -->
            <a href="${pageContext.request.contextPath}/DeletePostServlet?postNo=${post.postNo}&memberId=${post.memberId}
            &subjectName=${post.subjectName}&postTitle=${post.postTitle}&postContent=${post.postContent}">
            Post Delete
            </a>
            <br>
            <a href="">Post Update</a>
        </div>
        <div>
        	<!-- 댓글 입력 -->
            <form method="post" action="${pageContext.request.contextPath}/AddCommentServlet">
            	<input type="hidden" name="postNo" value="${post.postNo}">
            	<textarea rows="2" cols="80" name="commentContent"></textarea>
            	<button type="submit">Comment</button>
            </form>
        </div>
        <div>
            <!-- 댓글 리스트 -->
            <div>
            	<fieldset>
		            <c:forEach var="comment" items="${commentList}">
		            	<c:if test="${loginMember == null}">
		            	<fieldset>
							${comment.memberId} : ${comment.commentContent}
			            </fieldset>
			            </c:if>
		            	<c:if test="${loginMember != null}">
		            	<fieldset>
							${comment.memberId} : ${comment.commentContent}
							<a href="${pageContext.request.contextPath}/DeleteCommentServlet?commentNo=${comment.commentNo}
							&memberId=${comment.memberId}&postNo=${comment.postNo}&commentContent=${comment.commentContent}">
							DELETE
							</a>
							<a href="${pageContext.request.contextPath}/UpdateCommentServlet?commentNo=${comment.commentNo}
							&memberId=${comment.memberId}&postNo=${comment.postNo}&commentContent=${comment.commentContent}">
							UPDATE
							</a>
			            </fieldset>
			            </c:if>
		            </c:forEach>
            	</fieldset>
            </div>
        </div>
        <c:if test="${loginMember.memberLevel > 9 || loginMember == null}">
        <div>
    		<a href="${pageContext.request.contextPath}/SelectPostBySubjectServlet?subjectName=${post.subjectName}">Back</a>
		</div>
		</c:if>
		<c:if test="${loginMember.memberLevel < 9}">
		<div>
    		<a href="${pageContext.request.contextPath}/AdminServlet">Back</a>
		</div>
		</c:if>
    </div>
</body>
</html>
