<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="ko">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="/RgLibrary/css/layout.css">
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

    <script>
      // 비밀번호 일치 확인
      function checkPasswordMatch() {
        var password = document.getElementById('pw').value;
        var confirmPassword = document.getElementById('pw2').value;
        var messageElement = document.getElementById('password-message');

        if (password === confirmPassword) {
          messageElement.textContent = '';
        } else {
          messageElement.textContent = '비밀번호가 일치하지 않습니다.';
          messageElement.style.color = 'red';
        }
      }
      
      // 아이디 중복체크
		function checkId() {
		  var id = document.getElementById("id");
		  var xhr = new XMLHttpRequest();
		  xhr.open("POST", "${ pageContext.request.contextPath }/idCheck.do");
		  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		  xhr.onreadystatechange = function () {
		    if (xhr.readyState === 4) {
		      if (xhr.status === 200) {
		        var response = xhr.responseText;
		        console.log(response);
		        let msgBox = id.nextElementSibling;
		        if (response.trim() === "1") {
		          // 아이디가 중복되지 않았을 경우
		          id.classList.remove("is-invalid");
		          id.classList.add("is-valid");
		          msgBox.innerHTML = "사용가능한 아이디입니다.";
		          msgBox.classList.remove("invalid-feedback");
		          msgBox.classList.add("valid-feedback");
		        } else {
		          id.classList.add("is-invalid");
		          msgBox.innerHTML = "중복된 아이디입니다.";
		        }
		      } else {
		        // 요청이 실패했을 경우의 처리
		        console.error("아이디 중복 체크 요청 실패:", xhr.status);
		      }
		    }
		  };
		  var data = "id=" + encodeURIComponent(id.value);
		  xhr.send(data);
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
            <h4 class="mb-3">회원가입</h4>
            <form class="validation-form" novalidate method="post" action="${ pageContext.request.contextPath }/join.do">
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="id">ID</label>
                  <input type="text" class="form-control" id="id" name="id" placeholder="" required>
                  <div class="invalid-feedback">
                    아이디를 입력해주세요.
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <button type="button" class="btn btn-primary" onclick="checkId()" id="check">중복 체크</button>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="pw">비밀번호</label>
                  <input type="password" class="form-control" id="pw" name="pw" placeholder="" value="" required>
                  <div class="invalid-feedback">
                    비밀번호를 입력해주세요.
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="pw">비밀번호 확인</label>
                  <input type="password" class="form-control" id="pw2" name="pw2" placeholder="" value="" required
                    oninput="checkPasswordMatch()">
                  <span id="password-message"></span><br>
                </div>
              </div>


              <div class="mb-3">
                <label for="name">이름</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="" required>
                <div class="invalid-feedback">
                  이름을 입력해주세요.
                </div>
              </div>

              <div class="mb-3">
                <label for="address">주소</label>
                <input type="text" class="form-control" id="address" name="address" placeholder="서울시 강남구" required>
                <div class="invalid-feedback">
                  주소를 입력해주세요.
                </div>
              </div>

              <div class="mb-3">
                <label for="phonNum">전화번호</label>
                <input type="text" class="form-control" id="phone" name="phone" placeholder="-없이 숫자만 입력해주세요"
                  pattern="^\d{11}$" required>
                <div class="invalid-feedback">
                  전화번호를 입력해주세요.
                </div>
              </div>


              <hr class="mb-4">
              <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="aggrement" required>
                <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
              </div>
              <div class="mb-4"></div>
              <button class="btn btn-primary btn-lg btn-block" type="submit" >회원가입</button>
            </form>
          </div>
        </div>
      </div>
      <script>
        window.addEventListener('load', () => {
          const forms = document.getElementsByClassName('validation-form');

          Array.prototype.filter.call(forms, (form) => {
            form.addEventListener('submit', function (event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }

              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      </script>
    </section>
    <footer>
      <%@ include file="/jsp/include/bottom.jsp" %>
    </footer>
  </body>

  </html>