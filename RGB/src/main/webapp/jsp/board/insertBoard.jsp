<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <meta charset="UTF-8">
  <title>문의하기</title>

  <body>
    <%@ include file="/jsp/include/header.jsp" %>

      <section class="section">
        <div class="container">
          <h1 class="my-3 text-primary">문의하기</h1>
          <form action="${ pageContext.request.contextPath }/insertBoard.do" method="post">
            <div class="form-group">
              <div class="mb-3">
                <label for="title">제목</label>
                <input type="text" class="form-control " id="title" name="title" required="">
                <div class="invalid-feedback">
                  제목을 입력해주세요.
                </div>
              </div>
              <div class="form-group">
                <label for="content">내용</label>
                <textArea class="form-control" id="content" name="content" rows="10"></textArea>
              </div>
            </div>
            <a href="${ pageContext.request.contextPath }/insertBoard.do">
            <input type="button" value="문의하기" class="btn btn-primary mt-3" style="float: right;">
            </a>
            <a class="btn btn-secondary mt-3" href="${ pageContext.request.contextPath }/getBoardList.do">목록으로</a>
        </form>
        </div>
      </section>

      <%@ include file="/jsp/include/footer.jsp" %>
  </body>

  </html>