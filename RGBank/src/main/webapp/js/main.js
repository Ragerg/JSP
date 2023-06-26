//로그인
function checkForm(e) {
  let f = document.loginForm;

  if (f.id.value === "") {
    alert("ID를 입력하세요");
    id.focus();
    return false;
  }

  if (f.password.value === "") {
    alert("비밀번호를 입력하세요");
    password.focus();
    return false;
  }

  return true;
}
