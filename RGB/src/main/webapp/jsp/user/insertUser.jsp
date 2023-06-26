<%@page import="java.util.ArrayList" %>
  <%@page import="biz.board.BoardVO" %>
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

          <section class="section">
            <div class="container">
              <h1 class="my-3 text-primary">회원가입</h1>
              <form class="validation-form" id="insertUser" novalidate="" onsubmit="return submitForm()"
                action="${ pageContext.request.contextPath }/insertUser.do" method="post">
                <div class="mb-3">
                  <label for="text">아이디</label>
                  <input type="text" class="form-control " id="id" name="id" required="" onchange="checkId()">
                  <div class="invalid-feedback">
                    아이디를 입력해주세요.
                  </div>
                </div>

                <div class="mb-3">
                  <label for="name">비밀번호</label>
                  <input type="password" class="form-control" id="password" name="password" required="">
                  <div class="invalid-feedback">
                    비밀번호를 입력해주세요.
                  </div>
                </div>

                <div class="mb-3">
                  <label for="nickname">비밀번호 확인</label>
                  <input type="password" class="form-control " id="checkPassword">
                  <div class="invalid-feedback ">
                    비밀번호가 일치하지 않습니다.
                  </div>
                </div>


                <div class="mb-3">
                  <label for="address">이름</label>
                  <input type="text" class="form-control" id="name" name="name" required="">
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
                    <label for="address">주소<br></label>
                    <input type="text" class="form-control" id="postcode" name="postcode" placeholder="우편번호" required=""
                      readonly>
                    <div class="invalid-feedback">
                      우편번호 찾기를 눌러주세요
                    </div>
                  </div>

                  <div class="col-md-2 mb-1">
                    <label for="address" style="color:#f9f9f9;">주소</label>
                    <input type="button" class="form-control btn btn-primary" onclick="daumPostcode()"
                      value="우편번호 찾기"><br>
                      <div class="invalid-feedback">
                    </div>
                    &nbsp;
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-6 mb-1">
                    <input type="text" class="form-control" id="roadAddress" name="address" placeholder="도로명주소"
                      readonly>
                  </div>
                  <div class="col-md-6 mb-1">
                    <span id="guide" class="form-control" style="color:#999;display:none"></span>
                    <input type="text" class="form-control" id="detailAddress" name="detailAddress" placeholder="상세주소">

                    <div class="invalid-feedback">
                      상세주소를 입력해주세요.
                    </div>
                  </div>
                </div>
                <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                <hr class="mb-4">
                <label><input type="checkbox">회원가입 약관 동의</label> <br><br>
                <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
              </form>
            </div>
          </section>

          <%@ include file="/jsp/include/footer.jsp" %>
      </body>

      </html>