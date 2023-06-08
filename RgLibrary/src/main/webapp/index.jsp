<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <link rel="icon" href="${ pageContext.request.contextPath }/image/favicon.png">
      <title>RG Library</title>
      <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/layout.css">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>
      <script>
        function checkForm(e) {
          let f = document.loginForm

          if (f.id.value === '') {
            alert('ID를 입력하세요');
            id.focus();
            return false;
          }

          if (f.pw.value === '') {
            alert('비밀번호를 입력하세요');
            pw.focus();
            return false;
          }

          return true;
        }
      </script>
      <style>
        /* 폼 스타일 */
        form {
          margin-bottom: 20px;
        }

        input[type="text"],
        input[type="password"] {
          padding: 8px;
          width: 300px;
        }

        /* 검색 폼 스타일 */
        .searchForm {
          display: flex;
        }

        /* 로그인 폼 스타일 */
        #login {
          float: right;
          background-color: white;
          width: 440px;
          height: 440px;
          border: solid 10px #FFD966;
          border-radius: 10px;
          padding: 60px;
          margin-right: 20px;
        }

        button[type="submit"] {
          padding: 8px 20px;
          background-color: black;
          color: #fff;
          border: none;
          cursor: pointer;
        }

        #loginBtn {
          width: 300px;
        }

        #login a {
          margin-left: 0.4em;
        }

        #login a.hover {
          color: #FFD966;
        }
      </style>
    </head>

    <body>
      <header>
        <%@ include file="/jsp/include/top.jsp" %>
      </header>

      <section>
        <c:choose>
          <%--로그인이 안되어있는 경우에만 로그인 창 출력 --%>
            <c:when test="${ empty member }">
              <section id="login">
                <h2>로그인</h2>
                <form method="post" action="${ pageContext.request.contextPath }/loginProcess.do" name="loginForm"
                  onsubmit="return checkForm()">
                  <div class="form-group">
                    <label for="id">ID</label>
                    <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요" />
                  </div>
                  <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력하세요" />
                  </div>
                  <button type="submit" class="btn btn-primary" id="loginBtn">로그인</button>
                </form>
                <%-- 아이디 찾기, 비밀번호 찾기, 회원가입 링크 --%>
                  <div>
                    <!-- <a href="findId.do">아이디 찾기</a> |
                    <a href="findPassword.do">비밀번호 찾기</a> | -->
                    아직 회원이 아니신가요? |<a href="${ pageContext.request.contextPath }/joinPage.do">회원가입하기</a>
                  </div>
            </c:when>
            <%-- 로그인이 되어있는 경우 --%>
              <%-- 관리자일 때 --%>
                <c:when test="${ member.role == 'M' }">
                  <section id="login">
                    <h3>[${ member.name }님]</h3>
                    <%-- !!!연체자목록(오래된 순으로 10건) 추가하기!!! --%>
                      <div>
						<<연체자 목록>>
                      </div>
                      <%-- 관리페이지, 로그아웃 링크 --%>
                        <div>
                          <a href="${ pageContext.request.contextPath }/managerPage.do">관리자페이지</a> |
                          <a href="${ pageContext.request.contextPath }/logout.do">로그아웃</a>
                        </div>
                  </section>
                </c:when>
                <%-- 일반 사용자일 때 --%>
                  <c:otherwise>
                    <section id="login">
                      <h3>[${ member.name }(${ member.id })님]</h3>
                      <%-- !!!대출 중인 도서목록, 반납하기 추가하기!!! --%>
                        <div>

                        </div>
                        <%-- 마이페이지, 로그아웃 링크 --%>
                          <div>
                            <a href="${ pageContext.request.contextPath }/myPage.do">마이페이지</a> |
                            <a href="${ pageContext.request.contextPath }/logout.do">로그아웃</a>
                          </div>
                    </section>
                  </c:otherwise>
        </c:choose>
      </section>

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
              <c:if test="${ member.role == 'M'}">
                <a href="${ pageContext.request.contextPath }/insertBookPage.do">
                  <button type="button" class="btn btn-primary" id="insertBook" style="margin-left: auto;">도서정보
                    등록</button>
                </a><br>
              </c:if>
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
                    <h5 class="card-title">${ book.title }</h5>
                    <h6 class="card-subtitle mb-2 text-muted">${ book.author } / ${ book.pubdate } / ${ book.publisher }
                    </h6>
                    <p class="card-text text-truncate">${ book.description }</p>
                    <c:if test="${ book.count - book.rentAble == book.count }">
                      <div class="unable">대여불가</div>
                    </c:if>
                    <c:if test="${book.count - book.rentAble < book.count }">
                      <div class="able">대여가능</div>
                    </c:if>
                    ${ book.rentAble } / ${ book.count }
                    <c:if test="${ member.role == 'M'}">
                      <a href="${ pageContext.request.contextPath }/deleteBookPage.do?isbn=${book.isbn}"
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
      
      <section id="home">
        <!-- 도서관 소개 -->
        <h2>도서관 소개</h2>
        <p>
          라개네 도서관은 2023년 6월 설립되어 현재 가오픈 중입니다.<br>
          정식오픈 예정은 없습니다.<br>
        </p>
      </section>

      <section id="services">
        <!-- 이용 안내 -->
        <h2>이용 안내</h2>
        <p>
          운영시간은 평일 오전 10시 30분부터 오후 4시 30분까지입니다.<br>
          점심시간은 평일 오전 11시 30분부터 오후 1시 30분까지입니다.<br>
          - 비운영시간 출입 시 강제 퇴관조치됩니다.<br>
          모두의 안전을 위해 마스크를 꼭 착용해 주세요.<br>
          - 마스크 미착용 시 강제 퇴관조치됩니다.<br>
          내부이용 시 취식 금지이니 음식물 섭취는 야외에서 해주시기 바랍니다.<br>
          - 내부 취식 적발 시 강제 퇴관조치됩니다<br>
          이용에 참고하시어 불편 없으시길 바랍니다.<br>
          감사합니다.
        </p>
      </section>
      </section>

      <footer>
        <%@ include file="/jsp/include/bottom.jsp" %>
      </footer>
    </body>

    </html>