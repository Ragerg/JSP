<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <link rel="icon" href="${ pageContext.request.contextPath }/image/favicon.png">
    <title>마이페이지</title>
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/layout.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/layout.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"
      integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    <style>
      .btn {
        padding: 8px 20px;
        background-color: black;
        color: #fff;
        border: none;
        cursor: pointer;
        margin-right: 50px;

      }

      /* bookList */
      #bookCards {
        width: 1000px;
        margin: 30px auto;
        text-align: left;
      }

      #bookCards .unable {
        color: red;
      }

      #bookCards .able {
        color: blue;
      }

      #bookCards .card img {
        float: left;
        margin-right: 30px;
        height: 150px;
      }

      #bookCards .btn {
        margin-left: auto;
      }

      #bookCards .card-title {
        margin-top: 5px;
      }

      #bookCards .card-link {
        text-align: right;
        background-color: #333;
        border-radius: 5px;
        padding: 5px;
        color: #fff;
        margin: 5px
      }

      #bookCards .status {
        width: 500px;
        border: 1px solid #ddd;
      }
    </style>
    <c:if test = "${ empty member }">
    <script>alert("로그인 후 이용이 가능합니다."); location.href = "${ pageContext.request.contextPath }/loginPage.do";</script>
    </c:if>
  </head>

  <body>
    <header>
      <%@ include file="/jsp/include/top.jsp" %>
    </header>
    <section>
      <div class="container justify-content-center">
        <div class="row">
          <div>
            <a href="${ pageContext.request.contextPath }/pwCheckPage.do">회원정보 수정</a> | 
          <a href="${ pageContext.request.contextPath }/pwCheckPage.do">회원탈퇴</a>
          </div>

          <div>
            <div id="bookCards">
              <h3>대여현황</h3>
              <c:if test = "${ rentalList.size() == 0}">
	        	<hr>
	        	대여한 도서가 없습니다.
	        	</c:if>
              <c:forEach var="rental" items="${ rentalList }">
                <div class="col-12 card mb-3">
                  <div class="card-body">
                    <img src="${ rental.image }" class="card-img-left" alt="...">
                    <h5 class="card-title text-truncate">${ rental.title }</h5>
                    <h6 class="card-subtitle mb-2 text-muted">${ rental.author }</h6>
                    <h6 class="card-text">대여일 : ${ rental.rentalDate }</h6>
                    <h6 class="card-text">반납일 : ${ rental.returnDate }</h6>
                      <a href="${ pageContext.request.contextPath }/returnRental.do?regNo=${ rental.regNo }"
                        class="card-link">반납하기</a>
                    <c:if test="${rental.renewal == 1 }">
                      <a href="${ pageContext.request.contextPath }/renewal.do?rentNo=${ rental.rentNo }" 
                        class="card-link">연장하기</a>
                    </c:if>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </section>
    <footer>
      <%@ include file="/jsp/include/bottom.jsp" %>
    </footer>
  </body>

  </html>