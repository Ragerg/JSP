<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="ko">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서등록</title>
    <link rel="icon" href="${ pageContext.request.contextPath }/image/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/layout.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"
      integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
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

      #image {
        height: 300px;
      }

      /* .row-right {
        float: right;
      } */
    </style>

    <script>
      // isbn으로 책정보 불러오기
      function inputBook() {
    	 location.href="${ pageContext.request.contextPath }/inputBook.do?isbn=" + document.getElementById('isbn').value;
      }
    
      // 폼 입력 유효성 검사
      function validateForm() {
        let field = document.getElementById('isbn');
        let isValid = true;

        if (field.classList.contains('is-invalid')) {
          isValid = false;
        } else if (field.value.trim() === '') {
          field.classList.add('is-invalid');
          field.focus();
          isValid = false;
        } else {
          field.classList.remove('is-invalid');
        }
        return isValid;
      }

      // 입력 값 변경 시 유효성 검사 클래스 제거
      function clearValidation(inputId) {
        var input = document.getElementById(inputId);
        input.classList.remove('is-invalid');
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
            <h4 class="mb-3">도서등록</h4>
            <form class="validation-form" novalidate method="post"
              action="${ pageContext.request.contextPath }/insertBook.do" onsubmit="return validateForm()">
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="isbn">ISBN(입력 후 조회하기 필수)</label>
                  <input type="text" class="form-control " id="isbn" name="isbn" value="${ vo.isbn }"
                    placeholder="ISBN 13자리를 입력해 주세요." required pattern="[0-9]{13}" required onchange="validateForm()">
                </div>
                <div class="col-md-6 mb-3">
                  <button type="button" class="btn btn-primary" onclick="inputBook()" id="check">조회하기</button>
                </div>

                <div class="col-md-6 mb-3">
                  제목
                  <input type="text" class="form-control" id="title" name="title" placeholder="" value="${ vo.title }"
                    readonly>
                  저자
                  <input type="text" class="form-control" id="author" name="author" placeholder=""
                    value="${ vo.author }" readonly>
                  출판사
                  <input type="text" class="form-control" id="publisher" name="publisher" placeholder=""
                    value="${ vo.publisher }" readonly>
                  출판일
                  <input type="text" class="form-control" id="pubdate" name="pubdate" placeholder=""
                    value="${ vo.pubdate }" readonly>
                </div>

                <div class="col-md-6 mb-3">
                  도서 표지<br>
                  <input type="hidden" name="image" value="${ vo.image }">
                  <c:if test="${ vo.image != null }">
                    <img src="${ vo.image }" alt="" id="image">
                  </c:if>
                </div>

              </div>

              <div class="mb-3">
                도서 설명
                <textarea style="height: 200px;" class="form-control" id="description" name="description" placeholder=""
                  readonly>${ vo.description }</textarea>
              </div>





              <hr class="mb-4">
              <div class="mb-4"></div>
              <button class="btn btn-primary btn-lg btn-block" type="submit">책 등록하기</button>
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