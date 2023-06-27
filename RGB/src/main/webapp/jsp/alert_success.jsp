<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

</head>
<body>
<body>
<script type="text/javascript">
$().ready(function () {
        Swal.fire({
            icon: 'success',                         // Alert 타입
            title: '',       					  // Alert 제목
            text: '${msg}',  // Alert 내용
        }).then(function() {
            location.href='${url}';
        })
});
</script>

</body>
</body>
</html>