<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/loginD.css" />
</head>
<body>
<div class="root">
  <div class="login-form">
    <h1 class="form-title">로그인</h1>
    <div class="info-container">
      <div class="input-container">
        <input class="input-box" type="text" placeholder="ID" />
        <input class="input-box" type="password" placeholder="PW" />
      </div>

      <div class="link-container">
        <div class="check-box">
          <input class="save_id" type="checkbox" id="save_id" />
          <label for="save_id">아이디 저장</label>
        </div>

        <a class="link-find-pw" href="#"> 비밀번호 찾기 </a>
      </div>
    </div>

    <div class="btn-container">
      <button class="btn btnP">로그인</button>

      <button class="btn btnDk">나가기</button>
    </div>
  </div>
  <img class="main-img" src="/images/loginimg/loginimg1.png" alt="" />
</div>
</body>
</html>