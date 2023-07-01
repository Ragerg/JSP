<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<meta name="theme-name" content="dot" />
	<link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="plugins/themify-icons/themify-icons.css">
	<link rel="icon" href="${ pageContext.request.contextPath }/images/favicon.png" type="image/x-icon">
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
	<link href="assets/style.css" rel="stylesheet" media="screen" />
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<body>
	<script src="/RGB/assets/script.js" defer></script>
	<script src="/RGB/assets/main.js" defer></script>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://unpkg.com/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://unpkg.com/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
<!-- header -->
	<header class="banner overlay bg-cover">
		<nav class="navbar navbar-expand-md navbar-dark">
			<div class="container">
				<a class="navbar-brand px-2" href="${ pageContext.request.contextPath }/index.do"><img
						src="${ pageContext.request.contextPath }/images/logo.png" alt="BANK" /></a>
				<button class="navbar-toggler border-0" type="button" data-toggle="collapse" data-target="#navigation"
					aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse text-center" id="navigation">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item">
							<a class="nav-link text-dark" href="${ pageContext.request.contextPath }/index.do">Home</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-dark" href="javascript:void(0)">faq</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-dark" href="${ pageContext.request.contextPath }/getBoardList.do">게시판</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-dark" href="${ pageContext.request.contextPath }/poductList.do">상품</a>
						</li>
						<c:choose>
							<c:when test="${ empty user }">
								<li class="nav-item">
									<a class="nav-link text-dark" href="${ pageContext.request.contextPath }/joinPage.do">회원가입</a>
								</li>
								<li class="nav-item">
									<a class="nav-link text-dark" href="${ pageContext.request.contextPath }/loginPage.do">로그인</a>
								</li>
							</c:when>
							<%--a매니저--%>
								<c:when test="${ user.role_cd == 'M1' }">
									<li class="nav-item">
										<a class="nav-link text-dark" href="javascript:void(0)">회원관리</a>
									</li>
<!-- 									<li class="nav-item"> -->
<!-- 										<a class="nav-link text-dark" href="javascript:void(0)">문의관리</a> -->
<!-- 									</li> -->
<!-- 									<li class="nav-item"> -->
<!-- 										<a class="nav-link text-dark" href="javascript:void(0)">상품관리</a> -->
<!-- 									</li> -->
									<li class="nav-item">
										<a class="nav-link text-dark" href="${ pageContext.request.contextPath }/logout.do" >로그아웃</a>
									</li>
								</c:when>
								<%--일반 사용자--%>
									<c:otherwise>
										<li class="nav-item">
											<a class="nav-link text-dark" href="${ pageContext.request.contextPath }/myAccount.do">내계좌</a>
										</li>
<!-- 										<li class="nav-item"> -->
<!-- 											<a class="nav-link text-dark" href="href="javascript:void(0)">오픈뱅킹</a> -->
<!-- 										</li> -->
										<li class="nav-item">
											<a class="nav-link text-dark" href="${ pageContext.request.contextPath }/logout.do" >로그아웃</a>
										</li>
									</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</nav>
		<!-- banner -->
		<div class="container section">
			<div class="row">
				<div class="col-lg-8 text-center mx-auto">
					<h1 class="text-white mb-3">함께하는 RG은행</h1>
					<p class="text-white mb-4">이제 RG은행에서 다른 은행의 계좌도 함께 보세요<br>송금도 바로 !</p>
				</div>
			</div>
		</div>
		<!-- /banner -->
	</header>
	<!-- /header -->

</body>
</html>