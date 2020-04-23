<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<!--
	Hyperspace by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Hyperspace by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>
<body class="is-preload">

	<!-- Sidebar -->
	<section id="sidebar">
		<div class="inner">
			<nav>
				<ul>
					<li><a href="#intro">SAKILA</a></li>
					<li><a href="#one">Who we are</a></li>
					<li><a href="#two">What we do</a></li>
					<li><a href="#three">Get in touch</a></li>
				</ul>
			</nav>
		</div>
	</section>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Intro -->
		<section id="intro" class="wrapper style2 fullscreen fade-up">
			<div id="aside">
				<jsp:include page="/inc/sidemenu.jsp"></jsp:include><!-- include는 서버 기술이라서 requset.getContextPath()가 오면 안됨  -->
			</div>
		</section>




		<!-- One -->
		<section id="one" class="wrapper style1 spotlights">
			<section>
				<!-- <a href="#" class="image"><img src="<%=request.getContextPath() %>/imgs/apple.jpg" alt="" data-position="center center" /></a> -->
				<div class="content">
					<div class="inner">
						<h2>팀원소개</h2>
						<p></p>
						<ul class="actions">
							<li><a href="generic.html" class="button">정지성</a></li>
							<li><a href="generic.html" class="button">남상현</a></li>
							<li><a href="generic.html" class="button">가재우</a></li>
							<li><a href="generic.html" class="button">송중우</a></li>
							<li><a href="generic.html" class="button">정종혁</a></li>
							<li><a href="generic.html" class="button">최동철</a></li>

						</ul>

					</div>
				</div>
			</section>
			<section>
				<!-- <a href="#" class="image"><img src="images/pic02.jpg" alt="" data-position="top center" /></a> -->
				<div class="content">
					<div class="inner">
						<h2>프로젝트 소개</h2>
						<p>저희는 구디아카데미를 무사히 수료하여 취업 후, 10년정도 개발자를 하다 실력이 없어서 잘리는 바람에 퇴직
							후 퇴직금과 대출을 하여 프렌차이즈 DVD 매장 하나를 창업을 하게 되었고, 열심히 DVD방을 운영하며 바쁘게
							살아가고 있었습니다. 어느날 회장님께서 저희들을 불러서 말씀하셨습니다. "여러분들 예전에 개발잔가 뭐시긴가 하다가
							사업시작한거라며? 내가 컴퓨터로 좀 편리하게 매장들좀 관리 하려고 하는데 뭐가 뭔지 모르겠어... 매장관리를 컴퓨터로
							간단하게 할 수 있도록 도와주고 이번일 잘되면 내가 보너스 두둑하게 주리라!!!" 이렇게 하여 저희는 회장님의
							부탁아닌 부탁으로 인해 다시 개발 프로젝트를 시작하였습니다.</p>
						<ul class="actions">
							<li><a href="generic.html" class="button">Learn more</a></li>
						</ul>
					</div>
				</div>
			</section>
			<section>
				<!-- <a href="#" class="image"><img src="images/pic02.jpg" alt="" data-position="top center" /></a> -->
				<div class="content">
					<div class="inner">
						<h2>프로젝트 목적</h2>
						<p>기존에 있던 매장관리 프로그램을 대체하기위해 제작한다는 전제로 DVD방 고객, 매장, 재고 등의 관리를
							효율적으로 하기 위해서 프로젝트를 진행하였습니다.</p>
						<ul class="actions">
							<li><a href="generic.html" class="button">Learn more</a></li>
						</ul>
					</div>
				</div>
			</section>
		</section>

		<!-- Two -->
		<section id="two" class="wrapper style3 fade-up">
			<div class="inner">
				<h2>Tool</h2>
				<p>Phasellus convallis elit id ullamcorper pulvinar. Duis
					aliquam turpis mauris, eu ultricies erat malesuada quis. Aliquam
					dapibus, lacus eget hendrerit bibendum, urna est aliquam sem, sit
					amet imperdiet est velit quis lorem.</p>
				<div class="features">
					<section>
						<span class="icon solid major fa-code"></span>
						<h3>Use Language</h3>
						<p>JAVA(Version : 1.8.0), HTML, CSS(BootStrap)</p>
					</section>
					<section>
						<span class="icon solid major fa-lock"></span>
						<h3>Eclipes</h3>
						<p>Version : 2019-12(4.14.0)</p>
					</section>
					<section>
						<span class="icon solid major fa-cog"></span>
						<h3>DBMS mariadb</h3>
						<p>Version : 10.4</p>
					</section>
					<section>
						<span class="icon solid major fa-desktop"></span>
						<h3>Tomcat</h3>
						<p>Version : 9.0.30</p>
					</section>
					<section>
						<span class="icon solid major fa-link"></span>
						<h3>Mariadb-java-client</h3>
						<p>Version : 2.5.4</p>
					</section>
					<section>
						<span class="icon solid major fa-link"></span>
						<h3>GitHub</h3>
						<p>Address : https://github.com/</p>
					</section>
				</div>
				<ul class="actions">
					<li><a href="generic.html" class="button">Learn more</a></li>
				</ul>
			</div>
		</section>

		<!-- Three -->
		<section id="three" class="wrapper style1 fade-up">
			<div class="inner">
				<h2>문의사항</h2>
				<p>각종 문의사항 및 불편사항을 남겨주시면 빠르게 답변드리겠습니다.</p>
				<div class="split style1">
					<section>
						<form method="post" action="#">
							<div class="fields">
								<div class="field half">
									<label for="name">Name</label> <input type="text" name="name"
										id="name" />
								</div>
								<div class="field half">
									<label for="email">Email</label> <input type="text"
										name="email" id="email" />
								</div>
								<div class="field">
									<label for="message">Message</label>
									<textarea name="message" id="message" rows="5"></textarea>
								</div>
							</div>
							<ul class="actions">
								<li><a href="" class="button submit">Send Message</a></li>
							</ul>
						</form>
					</section>
					<section>
						<ul class="contact">
							<li>
								<h3>Address</h3> <span>서울특별시 금천구 가산동 구디<br />
							</span>
							</li>
							<li>
								<h3>Email</h3> <a href="#">Goodee@*****.com</a>
							</li>
							<li>
								<h3>Phone</h3> <span>(010) 1111-1111</span>
							</li>
							<li>
								<h3>Social</h3>
								<ul class="icons">
									<li><a href="#" class="icon brands fa-twitter"><span
											class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands fa-facebook-f"><span
											class="label">Facebook</span></a></li>
									<li><a href="#" class="icon brands fa-github"><span
											class="label">GitHub</span></a></li>
									<li><a href="#" class="icon brands fa-instagram"><span
											class="label">Instagram</span></a></li>
									<li><a href="#" class="icon brands fa-linkedin-in"><span
											class="label">LinkedIn</span></a></li>
								</ul>
							</li>
						</ul>
					</section>
				</div>
			</div>
		</section>



		<!-- Footer -->
		<footer id="footer" class="wrapper style1-alt">
			<div class="inner">
				<ul class="menu">
					<li>&copy; Untitled. All rights reserved.</li>
					<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
				</ul>
			</div>
		</footer>

		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.scrollex.min.js"></script>
		<script src="assets/js/jquery.scrolly.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
	</div>
</body>
</html>