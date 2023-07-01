<%@page import="java.util.ArrayList" %>
<%@page import="biz.board.BoardVO" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>내계좌</title>
<body>
    <%@ include file="/jsp/include/header.jsp" %>

    <section class="section">
        <div class="container" style="max-width: 600px;">
        <form method="post">
            <input type="submit" class="col btn btn btn-primary" id="openBank" name="openBank" value="RG은행 계좌보기" style="float: right;"
                     formaction="${ pageContext.request.contextPath }/myAccount.do">
        </form>             
            <h1 class="my-3 text-primary">${ user.user_name }님</h1>
            <h3 class="my-3 text-primary">총 잔액 : 
                <fmt:formatNumber value="${totalBalance}" pattern="#,###" />원
            </h3>
            <c:forEach var="account" items="${ accountList }">
                <div class="card col-12 mb-3">
                    <div class="card-header text-bg-warning ">
                        <h5 class="card-title">
                        <c:choose>
						<c:when test="${ account.bank_code == '333' }">
                        NiNi Bank | 
                        </c:when>
						<c:when test="${ account.bank_code == '777' }">
                        YJ Bank | 
                        </c:when>
                        </c:choose>
                        ${ account.account_name }</h5>
                        <h6 class="card-subtitle mb-2 text-muted" style="height: 20px">
                            ${ account.account_no }
                            <button type="button" class="btn btn-link text-muted p-0" style="width: 15px" onclick="copyAccountNumber('${account.account_no}')">
                                <small><i class="bi bi-files" style="font-size: 14px;"></i></small>
                            </button>
                        </h6>
                    </div>
                    <div class="card-body">
                        <h3>
                            &#8361; <fmt:formatNumber value="${ account.account_balance }" pattern="#,###" />
                        </h3>
                        <form method="post" >
                            <input type="hidden" name="account_no" value="${ account.account_no }">
                            <input type="hidden" name="account_name" value="${ account.account_name }">
                            <input type="hidden" name="bank_code" value="${ account.bank_code }">
                            <div class="row">
                                <input type="submit" class="col btn btn btn-primary" value="거래내역"
                                    formaction="${ pageContext.request.contextPath }/transList2.do">
                                <c:if test="${ account.pd_cd != 'Z'  }">
                                    <div style="width: 10px"></div>
                                    <input type="submit" class="col ms-3 btn btn-primary" value="이체하기"
                                        formaction="${ pageContext.request.contextPath }/transPage2.do">
                                </c:if>
                            </div>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>

    <%@ include file="/jsp/include/footer.jsp" %>

    <script src="https://unpkg.com/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MkMMF9xZp+oDXrhA7fB0Cyo+e3g9xVoZ4otFg5OU+1hlu8EvR3vQTr5pmReM9K1p" crossorigin="anonymous"></script>
       
    <style>
        .btn-primary:hover {
            background-color: #007bff;
            color: #fff;
        }
    </style>
    <script>
        // 계좌번호를 클립보드에 복사하는 함수
        function copyAccountNumber(accountNumber) {
            const el = document.createElement('textarea');
            el.value = accountNumber;
            document.body.appendChild(el);
            el.select();
            document.execCommand('copy');
            document.body.removeChild(el);

            // 복사 완료 메시지를 표시하는 모달창 표시
            const modal = new bootstrap.Modal(document.getElementById("accountModal"));
            const accountNumberElement = document.getElementById("accountNumber");
            accountNumberElement.textContent = accountNumber;
            modal.show();
        }
    </script>
    <!-- Modal -->
    <div class="modal fade" id="accountModal" tabindex="-1" aria-labelledby="accountModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="accountModalLabel">계좌번호 복사</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>계좌번호: <span id="accountNumber"></span></p>
                    <p>계좌번호가 복사되었습니다.</p>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>
