<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }
  
  .root {
  	width: 100%;
  	height: 100vh;
  	display: flex;
  }

  .login-form {
    display: flex;
    flex-direction: column;
    justify-content: center;
    width: 375px;
    padding: 0px 50px;
    background-color: #eee;
    border: 1px solid #ccc;
    gap: 40px;
  }

  .input-container {
    margin-bottom: 10px;
    width: 100%;
    display: flex;
    flex-direction: column;
    gap: 10px;
  }

  .input-box {
    padding: 5px 10px;
    height: 36px;
    font-size: 18px;
    border: 1px solid #dadada;
  }

  .info-container {
    display: flex;
    flex-direction: column;
    justify-content: center;
  }

  .link-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  input[type="checkbox"] {
    width: 20px;
    height: 20px;
    margin-right: 8px;
  }

  input[type="checkbox"] ~ label {
    cursor: pointer;
  }

  .check-box {
    display: flex;
    align-items: center;
  }

  .link-find-pw {
    color: black;
    line-height: 1.5;
    text-decoration: none;
  }

  .btn-container {
    display: flex;
    flex-direction: column;
    width: 100%;
    gap: 10px;
  }

  .btn {
    width: 100%;
    padding: 14px;
    height: 52px;
    font-size: 18px;
    font-weight: bold;
    color: white;
    border: 0;
    border-radius: 5px;
  }

  .btnP {
    background-color: #218ecb;
  }

  .btnDk {
    background-color: #606477;
  }

  .btnDk:hover {
    background-color: #505050;
  }

  .main-img {
    width: calc(100% - 375px);
    object-fit: cover;
  }
</style>
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