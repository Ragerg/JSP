<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html lang="ko">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보수정</title>
	<link rel="icon" href="${ pageContext.request.contextPath }/image/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/layout.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    <style>
      .input-form {
        max-width: 680px;
        margin-top: 80px;
        padding: 32px;
        background: #fff;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
        -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
      }
      
      .btn {
          padding: 8px 20px;
          background-color: black;
          color: #fff;
          border: none;
          cursor: pointer;
        }
        
      #check {
      	margin-top: 2em;	
      }  
    </style>
    
    <c:if test = "${ empty member }">
    <script>alert("로그인 후 이용이 가능합니다."); location.href = "${ pageContext.request.contextPath }/loginPage.do";</script>
    </c:if>

    <script>
      // 새 비밀번호 일치 확인
      function checkPasswordMatch() {
        var password = document.getElementById('pw').value;
        var confirmPassword = document.getElementById('pw2').value;
        var messageElement = document.getElementById('Password-message');

        if (password === confirmPassword) {
          messageElement.textContent = '';
          pw.classList.remove('is-invalid');
        } else {
          pw.classList.add("is-invalid");
        }
      }
    </script>

  </head>

  <body>
    <header>
      <%@ include file="/jsp/include/top.jsp" %>
    </header>
    <section>
      <div class="container">
        <div class="input-form-backgroud row">
          <div class="input-form col-md-12 mx-auto">
            <h4 class="mb-3">비밀번호 확인</h4>
            <form class="validation-form" novalidate method="post" action="${ pageContext.request.contextPath }/pwCheck.do" onsubmit="return validateForm()">
              <div class="row">
                <div class="col-md-6 mb-3">
                <input type="hidden" class="form-control" id="pw" name="pw" required="" value = "${ member.pw }">
                  <label for="pw">비밀번호</label>
                  <input type="password" class="form-control" id="pw2" name="pw2" placeholder="" value="" required
                    oninput="checkPasswordMatch()">
                  <span id="Password-message"></span><br>
                </div>
              </div>

              <div class="mb-4"></div>
              <button class="btn btn-primary btn-lg btn-block" type="submit" >확인</button>
            </form>
          </div>
        </div>
      </div>
    </section>
    <footer>
      <%@ include file="/jsp/include/bottom.jsp" %>
    </footer>
  </body>

  </html>