<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <link rel="icon" href="${ pageContext.request.contextPath }/image/favicon.png">
    <title>도서관리</title>
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

      /* 검색 폼 스타일 */
        form.searchForm {
          display: flex;
          white-space: nowrap;
          width: 1050px;
        }

        .search.input[type="text"],
        option {
          padding: 8px;
          margin-right: 10px;
          margin-left: 5px;
        }

        section#search {
          padding: 10px;
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
    <script>


    </script>
  </head>

  <body>
    <header>
      <%@ include file="/jsp/include/top.jsp" %>
    </header>
    <section id="search">
      <div class="container justify-content-center">
        <div class="row">
          <!-- 도서 검색 -->
          <div> <!-- 첫 번째 <div> -->
            <form class="searchForm" action="${pageContext.request.contextPath}/searchBook.do" method="post">
              <select id="searchItem" name="searchItem">
                <option value="title" selected="">제목</option>
                <option value="author">저자</option>
                <option value="publisher">출판사</option>
              </select>
              <input type="text" class="form-control" placeholder="찾으시는 검색어를 입력하세요." name="searchText">
              <button type="submit" class="btn btn-primary">검색</button>
            </form>
          </div>

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
                    <c:if test="${ book.count - book.rentAble < book.count }">
                      <div class="able">대여가능</div>
                    </c:if>
                    ${ book.rentAble } / ${ book.count }
                    <c:if test="${ member.role == 'M' && book.count - book.rentAble < book.count }">
                      <a href="${ pageContext.request.contextPath }/deleteBookPage.do?isbn=${ book.isbn }"
                        class="card-link">삭제</a>
                    </c:if>
                    <c:if test="${ member.role == 'U' && book.count - book.rentAble < book.count }">
                      <a href="${ pageContext.request.contextPath }/rentalBook.do?isbn=${ book.isbn }"
                        class="card-link">대여</a>
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