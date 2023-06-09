<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="ko">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서정보 삭제</title>
    <link rel="icon" href="${ pageContext.request.contextPath }/image/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/layout.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"
      integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
       <style>
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
  </head>

  <body>
    <header>
      <%@ include file="/jsp/include/top.jsp" %>
    </header>
    <section>
    	 <!-- 검색 결과 표시 -->
          <div id="search-results">
            <!-- 검색 결과를 동적으로 표시할 부분 -->
            <hr>
            <div id="bookCards">
              <h2>도서목록</h2>
              <c:forEach var="book" items="${ bookList }">
                <div class="col-12 card mb-3">
                  <div class="card-body">
                    <img src="${ book.image }" class="card-img-left" alt="...">
                    <h5 class="card-title text-truncate">${ book.title }</h5>
                    <h6 class="card-subtitle mb-2 text-muted">${ book.author } / ${ book.pubdate } / ${ book.publisher }
                    </h6>
                    <p class="card-text text-truncate">${ book.description }</p>
                    <c:if test="${ book.count - book.rentAble == book.count }">
                      <div class="unable">대여불가</div>
                    </c:if>
                    <c:if test="${book.count - book.rentAble < book.count }">
                      <div class="able">대여가능</div>
                    </c:if>
                    도서번호 : ${ book. regNo }
                    <c:if test="${ member.role == 'M'}">
                      <a href="${ pageContext.request.contextPath }/deleteBook.do?regNo=${ book.regNo }"
                        class="card-link">삭제</a>
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