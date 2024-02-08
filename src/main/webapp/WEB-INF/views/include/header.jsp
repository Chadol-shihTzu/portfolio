<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet" href="${path}/resources/css/main.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script>
<script src="${path}/resources/js/UploadAdapter.js"></script>
<script src="${path}/resources/js/mainjs.js"></script>
<script src="${path}/resources/js/address.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- template -->
  <!-- Favicons -->
  <link href="${path}/resources/assets/img/favicon.png" rel="icon">
  <link href="${path}/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${path}/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="${path}/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${path}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${path}/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${path}/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${path}/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${path}/resources/assets/css/style.css" rel="stylesheet">
<!-- template end -->

<title>언어의 예술(문예)</title>
</head>
<script src="https://kit.fontawesome.com/7ad33f8575.js" crossorigin="anonymous"></script>
<body>

  <!-- ======= Top Bar ======= -->
  <section id="topbar" class="d-flex align-items-center">
    <div class="container d-flex justify-content-center justify-content-md-between my-2">
      <div class="contact-info d-flex align-items-center">
        
      </div>
      <div class="social-links d-none d-md-flex align-items-center">
        <c:if test="${member == null }">
        	<a href="${path}/member/login" class="nav-link fs-6">로그인</a>
        	<a href="${path}/member/joinAgree" class="nav-link fs-6">회원가입</a>
        </c:if>
        
        <c:if test="${member != null && member.verify != 9 }">
				<li class="nav-item d-none d-md-block"><a class="nav-link fs-6">${member.userId}&nbsp;님 환영합니다.</a></li>
				<li class="nav-item d-none d-md-block">
					<a class="nav-link fs-6" href="${path}/member/logout">로그아웃</a>
				</li>
				<li class="nav-item d-none d-md-block">
					<a href="${path}/member/mypage" class="nav-link  fs-6">내정보</a>
				</li>
			</c:if>
			
			<c:if test="${member != null && member.verify == 9 }">
				<li class="nav-item d-none d-md-block"><a class="nav-link fs-6">${member.userId}&nbsp;님 환영합니다.</a></li>
				<li class="nav-item d-none d-md-block">
					<a class="nav-link fs-6" href="${path}/member/logout">로그아웃</a>
				</li>
				<li class="nav-item d-none d-md-block">
					<a href="${path}/admin/adminmenu?num=1" class="nav-link fs-6">관리자메뉴</a>
				</li>
			</c:if>		
      </div>
    </div>
  </section>

  <!-- ======= Header ======= -->
  
  <header id="header" class="border-bottom">
	<nav  class="navbar navbar-expand-lg">
		<div class="container" >
			<div class="logo">
        <h1><a href="${path}" class="ps-0" style="font-size:26px;">언어의 예술</a></h1>
			</div>
		
		<button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		 	<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
			   	<div class="offcanvas-header">
			     	<h5 class="offcanvas-title" id="offcanvasNavbarLabel">언어의 예술</h5>
			     	<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			   	</div>
			<div class="offcanvas-body">
			    <ul class="navbar-nav me-auto">
					<li class="nav-item"><a></a></li>
				</ul>
      
		        <ul class="navbar-nav">
		          <li class="nav-item"><a class="nav-link active" href="${path}">Home</a></li>
		          <li class="nav-item"><a class="nav-link" href="${path}/board/about">About</a></li>
		          <c:if test="${member != null }">
						<li class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown">Band</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="${path}/board/club/myClub">나의모임</a></li>
								<li><a class="dropdown-item" href="${path}/board/club/popularClub">인기모임</a></li>
								<li><a class="dropdown-item" href="${path}/board/club/categoryClub">카테고리별 모임</a></li>
							</ul>
						</li>
					</c:if>
					<c:if test="${member == null }">
						<li class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown">Band</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="${path}/board/club/popularClub">인기모임</a></li>
								<li><a class="dropdown-item" href="${path}/board/club/categoryClub">카테고리별 모임</a></li>
							</ul>
						</li>
					</c:if>
					<li class="nav-item"><a href="${path}/board/paint/paintlistPageSearch?num=1" class="nav-link">Drawing</a></li>
					<li class="nav-item"><a href="${path}/board/photo/photolistPageSearch?num=1" class="nav-link">Picture</a></li>
					<li class="nav-item dropdown">
								<a href="#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown">Literature</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="${path}/board/literature/poem/poemlistPageSearch?num=1">시</a></li>
									<li><a class="dropdown-item" href="${path}/board/literature/novel/novellistPageSearch?num=1">소설</a></li>
									<li><a class="dropdown-item" href="${path}/board/literature/drama/dramalistPageSearch?num=1">희곡</a></li>
									<li><a class="dropdown-item" href="${path}/board/literature/essay/essaylistPageSearch?num=1">수필</a></li>
									<li><a class="dropdown-item" href="${path}/board/literature/criticism/criticlistPageSearch?num=1">비평</a></li>
								</ul>
							</li>
							
							<li class="nav-item dropdown">
								<a href="#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown">Notice</a>
								<ul class="dropdown-menu">
									<li class="d-flex justify-content-between align-items-center">
										<a class="dropdown-item" href="${path}/board/announce/annolistPageSearch?num=1">공지사항 &nbsp; </a>
										<span class="badge bg-danger rounded-pill mx-3">3</span>
									</li>
									<li><a class="dropdown-item" href="${path}/board/qna/qnalistPageSearch?num=1">문의게시판</a></li>
									<li><a class="dropdown-item" href="${path}/board/event/mainEvent">이벤트</a></li>
									<li><a class="dropdown-item" href="${path}/board/hotdeal/hotdeallistPageSearch?num=1">핫딜게시판</a></li>
								</ul>
							</li>
							
							<li class="nav-item"><a href="${path}/board/recommend/recommendlistPageSearch?num=1" class="nav-link">Recommend</a></li>
							<!-- 모바일 버전 로그인/회원가입/로그아웃 -->
							<c:if test="${member == null }">
								<li class="nav-item d-block d-md-none">
									<a class="nav-link fs-6" href="${path}/member/login">로그인</a>
								</li>
								<li class="nav-item d-block d-md-none">
									<a class="nav-link fs-6" href="${path}/member/joinAgree">회원가입</a>
								</li>
							</c:if>
		
							<c:if test="${member != null && member.verify != 9}">
								<li class="nav-item d-block d-md-none">${member.userId}&nbsp;님 환영합니다.</li>
								<li class="nav-item d-block d-md-none">
									<a class="nav-link fs-6" href="${path}/member/logout">로그아웃</a>
								</li>
								<li class="nav-item d-block d-md-none">
									<a href="${path}/member/mypage" class="nav-link">내정보</a>
								</li>
							</c:if>
							
							<c:if test="${member != null && member.verify == 9}">
								<li class="nav-item d-block d-md-none">${member.userId}&nbsp;님 환영합니다.</li>
								<li class="nav-item d-block d-md-none">
									<a class="nav-link fs-6" href="${path}/member/logout">로그아웃</a>
								</li>
								<li class="nav-item d-block d-md-none">
									<a href="${path}/admin/adminmenu?num=1" class="nav-link">관리자 메뉴</a>
								</li>
							</c:if>
		        		</ul>
       		</div>
       		</div>
		</div>
      </nav><!-- .navbar -->
  </header><!-- End Header -->
  
<!-- Vendor JS Files -->
  <script src="${path}/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="${path}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${path}/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="${path}/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${path}/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="${path}/resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="${path}/resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${path}/resources/assets/js/main.js"></script>

