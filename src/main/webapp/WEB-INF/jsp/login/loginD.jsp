<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/loginD.css" />
</head>
<body>
<div class="root">
  <div class="login-form">
    <h1 class="form-title">로그인</h1>
    <div class="info-container">
      <div class="input-container">
        <input id="loginId" class="input-box" type="text" placeholder="ID" />
        <input id="loginPw" class="input-box" type="password" placeholder="PW" />
        <p id="login-check" class="valid-check"></p>
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
      <button id="login-btn" class="btn btn-p">로그인</button>

      <button id="signup-btn" class="btn btn-dk">회원 가입</button>
      
      <div class="modal-container" id="modal-container">
        <div class="modal-box">
          <div class="modal-content">
          	<h1 class="modal-title">회원 가입</h1>
            <ul id="modal-info" class="modal-info">
              <li>
                <label for="userId">아이디</label>
                <input class="modal-inputBox" id="userId" type="text" />
              </li>
              <li>
                <label for="userPw">패스워드</label>
                <input class="modal-inputBox" id="userPw" type="password" />
              </li>
              <li>
                <label for="userPwCheck">패스워드 확인</label>
                <input class="modal-inputBox" id="userPwCheck" type="password"
                />
              </li>
              <li id="valid-check" class="valid-check"></li>
            </ul>

            <div class="modal-btn-container">
              <button class="btn btn-p" id="joinBtn">회원 가입</button>
              <button id="close-btn" class="btn btn-dk">닫기</button>
            </div>
          </div>

          <div class="ip-box">
            <p class="ip-address">192.168.0.80</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <img class="main-img" src="/images/loginimg/loginimg1.png" alt="" />
</div>

<script src="/js/loginD.js"></script>
</body>
</html>