<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
	<title>회원가입</title>


<body>
      <%@ include file="/jsp/include/header.jsp" %>
      
    <c:if test="${not empty user}">
      <script>alert("이미 로그인 되었습니다."); location.href = "index.do";</script>
    </c:if>
    <section class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">카카오회원가입</h4>
        <form class="validation-form" id="insertUser" novalidate="" onsubmit="return submitForm()"
          action="${ pageContext.request.contextPath }/insertUser.do" method="post">
          <input type="hidden" class="form-control" id="id" name="id" required="" value="${kakaoID}">
          <input type="hidden" class="form-control" id="password" name="password" required="" value="kakao">
          <input type="hidden" class="form-control" id="signup_type" name="signup_type" required="" value="K">

          <div class="mb-3">
            <label for="address">이름</label>
            <input type="text" class="form-control" id="name" name="name" required="" value="${kakaoName}">
            <div class="invalid-feedback">
              이름을 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="address">생년월일</label>
            <input type="date" class="form-control" id="birthday" name="birthday" required="">
            <div class="invalid-feedback">
              생일을 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="code">핸드폰 번호</label>
            <input type="tel" class="form-control" id="phone" name="phone" required=""
              placeholder="010-1234-5678(하이픈(-)포함)" pattern="([0-9]{3})-([0-9]{3,4})-([0-9]{4})$">
            <div class="invalid-feedback">
              핸드폰 번호를 확인해 주세요.(하이픈(-)포함)
            </div>
          </div>

          <div class="row">
            <div class="col-md-6 mb-1">
              <label for="address">주소</label>
              <input type="text" class="form-control" id="postcode" name="postcode" placeholder="우편번호" required=""
                readonly>
              <div class="invalid-feedback">
                우편번호 찾기를 눌러주세요
              </div>
            </div>

            <div class="col-md-6 mb-1">
              <label for="address"> &nbsp;</label>
              <input type="button" class="form-control btn btn-primary" onclick="daumPostcode()" value="우편번호 찾기"><br>
            </div>

            <div class="mb-1">
              <input type="text" class="form-control" id="roadAddress" name="address" placeholder="도로명주소" readonly>
            </div>
            <div class="mb-3">
              <span id="guide" class="form-control" style="color:#999;display:none"></span>
              <input type="text" class="form-control" id="detailAddress" name="detailAddress" placeholder="상세주소">

              <div class="invalid-feedback">
                상세주소를 입력해주세요.
              </div>
            </div>
          </div>
          <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
          <hr class="mb-4">
          <div class="mb-4 col-md-12"></div>
          <label><input type="checkbox">회원가입 약관 동의</label> <br>
          <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
        </form>
      </div>
    </section>
	
	<%@ include file="/jsp/include/footer.jsp" %>
</body>

</html>