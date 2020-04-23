<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>about</title>
<style type="text/css">
	#it {
		text-align: center;
	}
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body class="bg-light">
	<div class="container-fluid">
		<div>
			<jsp:include page="/inc/Mainmenu.jsp"></jsp:include>
		</div>
		<h1 class="text-secondary">Resume</h1>
		<!-- 기본정보 -->
		<table class="table table-dark">
			<tbody>
				<tr>
					<td rowspan="3"><img src="<%=request.getContextPath()%>/imgs/me.jpg" width=250 height=300></td>
					<td rowspan="2">성명</td>
					<td>(한글)&nbsp;&nbsp;최동철</td>
					<td>생년월일&nbsp;&nbsp;960805</td>
					<!-- <td>공백</td>  -->
				</tr>
				<tr>
					<!-- <td>사진</td>  -->
					<!-- <td>성명</td>  -->
					<td>(영문)&nbsp;&nbsp;Choi Dong Chul</td>
					<td>휴대폰&nbsp;&nbsp;010-4038-5904</td>
					<!-- <td>공백</td>  -->
				</tr>
				<tr>
					<!-- <td>사진</td>  -->
					<td colspan="2">현주소&nbsp;&nbsp;서울시 노원구 동일로 173길 36-6 그린빌 301호</td>
					<!-- <td>공백</td>  -->
					<td colspan="2">이메일&nbsp;&nbsp;cheek0805@naver.com</td>
					<!-- <td>공백</td>  -->
				</tr>
			</tbody>
		</table>
		<!-- 학력사항 -->
		<table class="table table-dark">
			<tbody>
				<tr>
					<td rowspan="5">학력사항</td>
					<td>졸 업 일</td>
					<td>학 교 명</td>
					<td>전 공</td>
					<td>졸업여부</td>
					<td>소 재 지</td>
					<td>성 적</td>
				</tr>
				<tr>
					<td>2015년 졸업</td>
					<td>대진고등학교</td>
					<td>문과</td>
					<td>졸업</td>
					<td>서울 하계동</td>
					<td>중</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</tbody>
		</table>
		<!-- 경력사항 -->
		<table class="table table-dark">
			<tbody>
				<tr>
					<td rowspan="4">경력사항</td>
					<td>근무기간</td>
					<td>회 사 명</td>
					<td>직 위</td>
					<td>담당업무</td>
					<td>퇴사사유</td>
				</tr>
				<tr>
					<!-- <td>공백</td>  -->
					<td>2018.10.22 ~ 2019.10.21</td>
					<td>라온시큐어</td>
					<td>사원</td>
					<td>SSO 유지보수 및 정기점검</td>
					<td>계약만료</td>
				</tr>
				<tr>
					<!-- <td>공백</td>  -->
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<!-- <td>공백</td>  -->
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</tbody>
		</table>
		<!-- 기타사항 -->
		<table class="table table-dark">
			<tbody>
				<tr>
					<td rowspan="6">기타사항</td>
					<td>신 장</td>
					<td>178CM</td>
					<td>체 중</td>
					<td>85KG</td>
					<td>시 력</td>
					<td>좌 : 0.5&nbsp;&nbsp;&nbsp;우 : 0.1</td>
				</tr>
				<tr>
					<!-- <td>공백</td>  -->
					<td>취 미</td>
					<td>풋살, 농구, 볼링</td>
					<td>특 기</td>
					<td>스키</td>
					<td>종 교</td>
					<td>천 주 교</td>
				</tr>
				<tr>
					<!-- <td>공백</td>  -->
					<td rowspan="4">전산능력</td>
					<td>프로그램명</td>
					<td>활 용 도</td>
					<td>&nbsp;</td>
					<td>자격증 보유현황</td>
					<td>정보처리기능사</td>
				</tr>
				<tr>
					<!-- <td>공백</td>  -->
					<td>Excel</td>
					<td>중</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>리눅스마스터 2급</td>
				</tr>
				<tr>
					<!-- <td>공백</td>  -->
					<td>PowerPoint</td>
					<td>중상</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<!-- <td>공백</td>  -->
					<td>Word</td>
					<td>중</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="text-dark" style="text-align: center">copyright ⓒ  Dong</div>
</body>
</html>