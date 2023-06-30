<%@page import="java.util.ArrayList" %>
<%@page import="biz.board.BoardVO" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<title>계좌이체</title>

<body>
    <%@ include file="/jsp/include/header.jsp" %>
    <c:if test="${empty user}">
        <script type="text/javascript">
            $().ready(function () {
                Swal.fire({
                    icon: 'warning',                      // 알림 창 타입
                    title: '',                             // 알림 제목
                    text: "로그인 후 진행해 주세요",  // 알림 내용
                }).then(function() {
                    location.href= "loginPage.do";
                });
            });
        </script>
    </c:if>

    <section class="section">
        <div class="container">
            <h1 class="my-3 text-primary">계좌이체</h1>
            <form class="validation-form" id="trans" novalidate="" onsubmit="return validatePassword()"
                action="" method="post">
                <div class="mb-3">
                    <label for="text">출금계좌</label>
                    <select id="fromAccount" name="account_no" class="form-control" required onchange="this.form.submit()">
                        <option value="${ account_no }">${ account_no }</option>
                        <c:forEach var="account" items="${ accountList }">
                            <c:if test="${ account.pd_cd != 'C' && account_no != account.account_no }">
                                <option value="${ account.account_no }">${ account.account_no}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
                <input type="hidden" name="fromAccount" value="${ accountVo.account_no }"/>
                <div class="mb-3">
                    <label for="account_balance">출금가능 금액</label>
                    <input type="text" class="form-control" id="account_balance" name="account_balance" required=""
                       value=" <fmt:formatNumber value='${ accountVo.account_balance }' pattern='#,###' />" readonly>
                </div>
                
                <div class="mb-3">
                    <label for="trans_amount">이체금액</label>
                    <input type="text" class="form-control" id="trans_amount" name="trans_amount" required=""
                        value="">
                     <div id="balance_error" class="error-message" style="color: red; font-size:13px"></div> 
                </div>

                <div class="mb-3">
                    <label for="toAccount">입금계좌</label>
                    <div class="d-flex">
                        <select class="form-control col-md-3" required="" id="bank_code" name="bank_code" onchange="checkAccount()">
                            <option value="999">RG Bank</option>
                            <option value="333">NiNi Bank</option>
                            <option value="777">YJ Bank</option>
                        </select>
                        <div style="width:50px"> </div>
                        <input type="text" class="form-control col-md-8 mb-1" id="toAccount" name="toAccount" required=""  onkeyup="checkAccount()">
                    </div>
                </div>

           

                <div class="mb-3">
                    <label for="fromName">보내는 사람 이름</label>
                    <input type="text" class="form-control" id="fromName" name="fromName" required="" value="${ user.user_name }">
                </div>

                <div class="mb-3">
                    <label for="toName">받는 사람 이름</label>
                    <input type="text" class="form-control" id="toName" name="toName" required="">
                    <div id="result" class="error-message" style="color: red; font-size:13px"></div> 
                </div>

                <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block" type="submit" formaction="${ pageContext.request.contextPath }/transaction.do">계좌이체</button>

            </form>
        </div>
    </section>

    <%@ include file="/jsp/include/footer.jsp" %>

</body>

</html>