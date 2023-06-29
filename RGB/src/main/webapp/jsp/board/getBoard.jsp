<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

    <meta charset="UTF-8">
<title>문의내용</title>

<body>
<%@ include file="/jsp/include/header.jsp" %>
    
	<section class="section" id = "getBoard">
    <div class="container">
    <div class="input-form col-md-12 mx-auto">
         <form class="validation-form" novalidate="" onsubmit="return submitForm()" action="${ pageContext.request.contextPath }/reBoard.do" method="post">
          <c:if test="${board.user_id eq user}">
        class="user-post"
    </c:if>
            <h3 class="my-3 text-primary">${ board.title }</h3>
            <input type="hidden" name="b_no" value="${ board.b_no }" readonly>
            <input type="hidden" name="title" value="${ board.title }" readonly>
            <div class="row">
                <div class="col-md-6">
                    <input type="text" class="form-control form-control-plaintext " name="user_id" required="" value="${ board.user_id }" readonly>
                </div>
                <div class="col-md-6">
                    <input type="text" class="form-control form-control-plaintext " name="reg_date" required="" value="${ board.reg_date }" readonly>
                </div>

                <div class="col-md-12">
                <br>
                    <textArea class="form-control form-control-plaintext " id="content" name="content" rows="10" readonly>${ board.content }</textArea>
                </div>
            </div>
            <c:choose>
            <c:when test="${ user.role_cd == 'M1' }">
            <br>
            <button class="btn btn-primary btn-lg btn-block" type="submit">답글</button>
            </c:when>
            
            </c:choose>
            <a class="btn btn-secondary mt-3" href="${ pageContext.request.contextPath }/getBoardList.do">목록으로</a>                  
        </form>
    </div>
    </div>
</section>
    
    <%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>
