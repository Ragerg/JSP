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
      function checkNewPasswordMatch() {
        var password = document.getElementById('newPw').value;
        var confirmPassword = document.getElementById('newPw2').value;
        var messageElement = document.getElementById('newPassword-message');

        if (password === confirmPassword) {
          messageElement.textContent = '';
          pw.classList.remove('is-invalid');
        } else {
          messageElement.textContent = '비밀번호가 일치하지 않습니다.';
          messageElement.style.color = 'red';
          newPw.classList.add("is-invalid");
        }
      }
      
		// 폼 입력 유효성 검사
	    function validateForm() {
	    	const requiredFields = ['id', 'pw', 'pw2','name', 'address', 'phone'];
	    	let isValid = true;

	    	  for (var i = 0; i < requiredFields.length; i++) {
	    		let field = document.getElementById(requiredFields[i]);
	    		const regex = /^010-[0-9]{4}-[0-9]{4}$/;
	    	    
	    		if(field.id === 'phone' && !regex.test(field.value)){
	    	  		field.classList.add("is-invalid");
	    	        isValid = false;
	    	  	} else if (field.value.trim() === '') {
		    	      field.classList.add('is-invalid');
		    	      field.focus();
		    	      isValid = false;
	    	  	} else {
		    	      field.classList.remove('is-invalid');
		     	} 
	    	  }

	    	  return isValid;
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
            <h4 class="mb-3">회원정보</h4>
            <form class="validation-form" novalidate method="post" action="${ pageContext.request.contextPath }/myInfo.do" onsubmit="return validateForm()">
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="id">ID</label>
                  <input type="text" class="form-control form-control-plaintext " id="id" name="id" value="${ member.id }" readonly="readonly">
                </div>
              </div>
              
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="pw">새 비밀번호</label>
                  <input type="password" class="form-control" id="newPw" name="newPw" placeholder="" value="" required>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="pw">새 비밀번호 확인</label>
                  <input type="password" class="form-control" id="newPw2" name="newPw2" placeholder="" value="" required
                    oninput="checkNewPasswordMatch()">
                  <span id="newPassword-message"></span><br>
                </div>
              </div>


              <div class="mb-3">
                <label for="name">이름</label>
                <input type="text" class="form-control" id="name" name="name" value = "${ member.name }" required>
                <div class="invalid-feedback">
                  이름을 입력해주세요.
                </div>
              </div>

              <div class="mb-3">
                <label for="address">주소(구/군 까지만 입력)</label>
                <input type="text" class="form-control" id="address" name="address" value = "${ member.address }" required>
                <div class="invalid-feedback">
                  주소를 입력해주세요.
                </div>
              </div>

              <div class="mb-3">
                <label for="phonNum">전화번호</label>
                <input type="text" class="form-control" id="phone" name="phone" value = "${ member.phone }"
                  pattern="010-[0-9]{4}-[0-9]{4}" required>
                <div class="invalid-feedback">
                  전화번호를 형식에 맞게 입력해주세요.
                </div>
              </div>

              <div class="mb-4"></div>
              <button class="btn btn-primary btn-lg btn-block" type="submit" >회원정보수정</button>
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