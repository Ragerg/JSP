<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
	<title>RGBank</title>



<body>
      <%@ include file="/jsp/include/header.jsp" %>
    
	<!-- topics -->
	<section class="section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 text-center">
					<h2 class="section-title">찾아오는 길</h2>
				</div>
				<!-- topic-item -->
				<div class="col-lg-9 col-sm-6 mb-4">
					<div class="px-4 py-5 bg-white shadow text-center d-block match-height">
						<p class="mb-0">
						<div id="map" style="width:100%;height:400px;"></div>
							<script type="text/javascript"
								src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3be059b28175bae0d5c7b1b5d47bd7a8"></script>
							<script>
								var container = document.getElementById('map');
								var options = {
									center: new kakao.maps.LatLng(37.4590828, 127.1537789),
									level: 3
								};

								var map = new kakao.maps.Map(container, options);
							</script>
							<p><br>한국폴리텍대학 성남캠퍼스 드림관<br>
							도로명 주소 : 경기 성남시 수정구 수정로 398(산성동)<br>
							교통편 : <br>
							 - 지하철 8호선 산성역 도보 10분<br>
							 - 버스 : 88, 9-1, 9, 33-1 한국폴리텍대학 정류장 하차
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- /topics -->

	<!-- call to action -->
	<section>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section px-3 bg-white shadow text-center">
						<h2 class="mb-4">문의사항이 있으신가요?</h2>
						<p class="mb-4">게시판에 문의하시면 은행매니저가 직접 답변해 드립니다</p>
						<a href="${ pageContext.request.contextPath }/insertBoardPage.do" class="btn btn-primary">문의하기</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- /call to action -->

		   

	<!-- ** JS Plugins Needed for the Project ** -->
	<!-- jquiry -->
	<script src="plugins/jquery/jquery-1.12.4.js"></script>
	<!-- Bootstrap JS -->
	<script src="plugins/bootstrap/bootstrap.min.js"></script>
	<!-- match-height JS -->
	<script src="plugins/match-height/jquery.matchHeight-min.js"></script>
	<!-- Main Script -->
	<script src="assets/script.js"></script>
	
	<%@ include file="/jsp/include/footer.jsp" %>
</body>

</html>