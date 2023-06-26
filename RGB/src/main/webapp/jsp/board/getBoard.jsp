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
            <input type="text" class="form-control form-control-plaintext " id="title" name="title" required="" value="${board.title }" readonly>
            <input type="hidden" name="b_no" value="${board.b_no }" readonly>
            <div class="row">
                <div class="mb-3 col-md-6">
                    <input type="text" class="form-control form-control-plaintext " name="title" required="" value="작성자이름" readonly>
                </div>
                <div class="mb-3 col-md-6">
                    <input type="text" class="form-control form-control-plaintext " name="title" required="" value="${board.reg_date }" readonly>
                </div>

                <div class="mb-5">
                    <label for="content">문의내용</label>
                    <textArea class="form-control form-control-plaintext " id="content" name="content" rows="10" readonly>${board.content }</textArea>
                </div>
            </div>
            <button class="btn btn-primary btn-lg btn-block" type="submit">답글</button>
            <button class="btn btn-primary btn-lg btn-block" type="button">수정</button>
            <button class="btn btn-primary btn-lg btn-block" type="button">삭제</button>                  
        </form>
    </div>
    </div>
</section>
    
    <%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>
