<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<title>게시판 글 작성하기</title>

<body>
    <header>
      <%@ include file="/jsp/include/top.jsp" %>
    </header>
    
    <section>
    <div class="container">
        <h1 class="my-3 text-primary">게시글 작성</h1>
        <form action="${ pageContext.request.contextPath }/boardWrite.do" method="post">
            <div class="form-group">
                <label for="title">제목:</label>
                <input type="text" class="form-control" id="title" name="title">
            </div>
            <div class="form-group">
                <label for="author">작성자:</label>
                <input type="text" class="form-control" id="author" name="author">
            </div>
            <div class="form-group">
                <label for="content">내용:</label>
                <textarea class="form-control" id="content" name="content" rows="10"></textarea>
            </div>
            <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" id="isPublic" name="isPublic" value="true">
                <label class="form-check-label" for="isPublic">공개 여부</label>
            </div>
            <button type="submit" class="btn btn-primary">글 작성하기</button>
        </form>
        <a class="btn btn-secondary mt-3" href="${ pageContext.request.contextPath }/boardList.do">목록으로</a>
    </div>
       </section>

    <footer>
      <%@ include file="/jsp/include/bottom.jsp" %>
    </footer>

</body>
</html>
