<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet" href="${path}/resources/css/main.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${path}/resources/js/mainjs.js"></script>
<script src="${path}/resources/js/address.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>언어의 예술(문예)</title>
</head>
<script src="https://kit.fontawesome.com/7ad33f8575.js" crossorigin="anonymous"></script>
<body>

<!-- 로그인 상단배너 -->
<nav class="navbar navbar-expand-md navbar-dark p-0">
	<div class="container-fluid">
		<div class="collapse navbar-collapse"  id="mynavbar">
			<!-- 오른쪽 맞추기위해 남겨놓음 -->
			<ul class="navbar-nav me-auto">
				<li class="nav-item"><a></a></li>
			</ul>
			
			<!-- PC버전 로그인/회원가입/내정보 -->
			<ul class="navbar-nav navbar-right ">
			<c:if test="${member == null }">
				<li class="nav-item d-none d-md-block">
					<a class="a_under_hov nav-link fs-6" href="${path}/member/login">로그인</a>
				</li>
				<li class="nav-item d-none d-md-block">
					<a class="a_under_hov nav-link fs-6" href="${path}/member/joinAgree">회원가입</a>
				</li>
			</c:if>
			</ul>

			<ul class="navbar-nav navbar-right ">
			<c:if test="${member != null && member.verify != 9 }">
				<li class="nav-item d-none d-md-block"><a class="nav-link fs-6">${member.userId}&nbsp;님 환영합니다.</a></li>
				<li class="nav-item d-none d-md-block">
					<a class="a_under_hov nav-link fs-6" href="${path}/member/logout">로그아웃</a>
				</li>
				<li class="nav-item d-none d-md-block">
					<a href="${path}/member/mypage" class="a_under_hov nav-link">내정보</a>
				</li>
			</c:if>
			</ul>
			
			<ul class="navbar-nav navbar-right ">
			<c:if test="${member != null && member.verify == 9 }">
				<li class="nav-item d-none d-md-block"><a class="nav-link fs-6">${member.userId}&nbsp;님 환영합니다.</a></li>
				<li class="nav-item d-none d-md-block">
					<a class="a_under_hov nav-link fs-6" href="${path}/member/logout">로그아웃</a>
				</li>
				<li class="nav-item d-none d-md-block">
					<a href="${path}/admin/adminmenu?num=1" class="a_under_hov nav-link">관리자메뉴</a>
				</li>
			</c:if>
			</ul>

		</div>
	</div>
</nav>

<!--  왼쪽에서 튀어나오는 메뉴바 -->
<nav class="navbar navbar-expand-md p-0">
	<div class="container-fluid border-bottom">
		<a class="navbar-brand black_a_tag" href="${path}">언어의 예술</a>
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
		  
				<ul class="navbar-nav navbar-right">
					<li class="nav-item"><a href="${path}" class="active a_under_hov nav-link">홈</a></li>
					<li class="nav-item"><a href="${path}/board/about" class="a_under_hov nav-link">소개</a></li>
					<c:if test="${member != null }">
						<li class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown">모임</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="${path}/board/club/myClub">나의모임</a></li>
								<li><a class="dropdown-item" href="${path}/board/club/popularClub">인기모임</a></li>
								<li><a class="dropdown-item" href="${path}/board/club/categoryClub">카테고리별 모임</a></li>
							</ul>
						</li>
					</c:if>
					<c:if test="${member == null }">
						<li class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown">모임</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="${path}/board/club/popularClub">인기모임</a></li>
								<li><a class="dropdown-item" href="${path}/board/club/categoryClub">카테고리별 모임</a></li>
							</ul>
						</li>
					</c:if>

					<li class="nav-item"><a href="${path}/board/paint/paintlistPageSearch?num=1" class="a_under_hov nav-link">그림</a></li>
					<li class="nav-item"><a href="${path}/board/photo/photolistPageSearch?num=1" class="a_under_hov nav-link">사진</a></li>
					<li class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown">문학</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="${path}/board/literature/poem/poemlistPageSearch?num=1">시</a></li>
							<li><a class="dropdown-item" href="${path}/board/literature/novel/novellistPageSearch?num=1">소설</a></li>
							<li><a class="dropdown-item" href="${path}/board/literature/drama/dramalistPageSearch?num=1">희곡</a></li>
							<li><a class="dropdown-item" href="${path}/board/literature/essay/essaylistPageSearch?num=1">수필</a></li>
							<li><a class="dropdown-item" href="${path}/board/literature/criticism/criticlistPageSearch?num=1">비평</a></li>
						</ul>
					</li>
					
					<li class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown">알림</a>
						<ul class="dropdown-menu">
							<li class="d-flex justify-content-between align-items-center">
								<a class="dropdown-item" href="${path}/board/announce/annolistPageSearch?num=1">공지사항 &nbsp; </a>
								<span class="badge bg-danger rounded-pill mx-3">3</span>
							</li>
							<li><a class="dropdown-item" href="${path}/board/qna/qnalistPageSearch?num=1">문의게시판</a></li>
							<li><a class="dropdown-item" href="${path}/board/event/mainEvent">이벤트</a></li>
							<li><a class="dropdown-item" href="${path}/board/hotdeal/hotdealList">핫딜게시판</a></li>
						</ul>
					</li>
					
					<li class="nav-item"><a href="${path}/board/recommend/recommendlistPageSearch?num=1" class="a_under_hov nav-link">공간</a></li>
					
					<!-- 모바일 버전 로그인/회원가입/로그아웃 -->
					<c:if test="${member == null }">
						<li class="nav-item d-block d-md-none">
							<a class="a_under_hov nav-link fs-6" href="${path}/member/login">로그인</a>
						</li>
						<li class="nav-item d-block d-md-none">
							<a class="a_under_hov nav-link fs-6" href="${path}/member/joinAgree">회원가입</a>
						</li>
					</c:if>

					<c:if test="${member != null && member.verify != 9}">
						<li class="nav-item d-block d-md-none">${member.userId}&nbsp;님 환영합니다.</li>
						<li class="nav-item d-block d-md-none">
							<a class="a_under_hov nav-link fs-6" href="${path}/member/logout">로그아웃</a>
						</li>
						<li class="nav-item d-block d-md-none">
							<a href="${path}/member/mypage" class="a_under_hov nav-link">내정보</a>
						</li>
					</c:if>
					
					<c:if test="${member != null && member.verify == 9}">
						<li class="nav-item d-block d-md-none">${member.userId}&nbsp;님 환영합니다.</li>
						<li class="nav-item d-block d-md-none">
							<a class="a_under_hov nav-link fs-6" href="${path}/member/logout">로그아웃</a>
						</li>
						<li class="nav-item d-block d-md-none">
							<a href="${path}/admin/adminmenu?num=1" class="a_under_hov nav-link">관리자 메뉴</a>
						</li>
					</c:if>
					
				</ul>
			</div>
		</div>	
	</div>
</nav>
