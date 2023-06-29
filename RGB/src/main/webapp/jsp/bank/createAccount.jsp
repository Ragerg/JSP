<%@page import="java.util.ArrayList" %>
  <%@page import="biz.board.BoardVO" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
      <!DOCTYPE html>
      <html>

      <meta charset="UTF-8">
      <title>계좌생성</title>


      <body>
        <%@ include file="/jsp/include/header.jsp" %>
          <c:if test="${empty user}">
                <script type="text/javascript">
				$().ready(function () {
				        Swal.fire({
				            icon: 'warning',                         // Alert 타입
				            title: '',       					  // Alert 제목
				            text: "로그인 후 진행해 주세요",  // Alert 내용
				        }).then(function() {
				        	location.href= "loginPage.do";
				        })
				});
    </script>
          </c:if>

          <section class="section">
            <div class="container">
              <h1 class="my-3 text-primary">계좌생성</h1>
              <form class="validation-form" id="insertUser" novalidate="" onsubmit="return submitForm()"
                action="${ pageContext.request.contextPath }/createAccount.do" method="post">
                <div class="mb-3">
                <input type="hidden" name="pd_cd" value="${ product.product_cd }">
                  <label for="text">계좌번호</label>
            	  <input type="text" class="form-control " name="account_no" value = "${ account_no }" readonly="readonly">
                </div>

                <div class="mb-3">
                  <label for="password">계좌 비밀번호</label>
                  <input type="password" class="form-control" id="password" name="account_pw" required=""oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1')" minlength="4" maxlength='4'>
     			  <div class="invalid-feedback">
               	 비밀번호(4자리 숫자)를 입력해주세요.
            	  </div>
                </div>

                <div class="mb-3">
                  <label for="checkPassword">비밀번호 확인</label>
                  <input type="password" class="form-control " id="checkPassword">
                  <div class="invalid-feedback ">
                    비밀번호가 일치하지 않습니다.
                  </div>
                </div>


                <div class="mb-3">
                  <label for="account_name">계좌이름</label>
                  <input type="text" class="form-control" id="account_name" name="account_name" required="" value="${ product.product_name }" >
                  <div class="invalid-feedback">
                    계좌 구별이 편하게 이름을 지어주세요.
                  </div>
                </div>
                
                <div class="mb-3">
                  <label for="account_balance">입금금액</label>
                  <input type="text" class="form-control" id="account_balance" name="account_balance" required="" min="1000" value="1000" >
                  <div class="invalid-feedback">
                    최소 입금금액은 1,000원입니다.
                  </div>
                </div>

                <hr class="mb-4">
                <label><input type="checkbox">계좌생성 약관 동의</label> <br><br>
                <button class="btn btn-primary btn-lg btn-block" type="submit">계좌생성</button>
              </form>
            </div>
          </section>

          <%@ include file="/jsp/include/footer.jsp" %>
      </body>

      </html>