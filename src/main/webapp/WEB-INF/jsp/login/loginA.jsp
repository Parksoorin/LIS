<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인</title>
  <link rel="stylesheet" type="text/css" href="/css/loginA.css" />
</head>
<body>
  <div class="loginHome">
    <div class="loginInput">
    <div class="loginbox">
      <div class="loginHead">
        <h1>로그인</h1>
      </div>
      <div class="loginIdBox">
        <input type="text" class="IdBox" placeholder="ID">
      </div>
      <div class="loginPwBox">
        <input type="password" class="IdBox" placeholder="PW">
      </div>
      <div class="loginIdPw">
        <div>
          <input type="checkbox" aria-label="Checkbox demo" /> 아이디 저장
        </div>
        <div><a href="http://naver.com">비밀번호 찾기</a></div>
      </div>
      <div id="loginButton">
        <button class="btn-icon-l btn-p" >
          로그인
        </button>
      </div>
      <div id="userJoin">
        <button class="btn-icon-l btn-dk" onclick="handleOpen()">
          회원가입
        </button>
      </div>
      </div>
    </div>
    <div class="loginRightImg"></div>
  </div>

  <!-- Modal  -->
  <div class="modal" id="myModal">
    <div class="boxAll">
      
      <div class="divAll">
        <div class="divUp">
          <h2 class="modal-modal-title">회원가입</h2>
          <div class="divUpOne">
            <div class="divUpOneUserId">아이디</div>
            <input type="text" class="filled-basic" value="ID">
          </div>
          <div class="divUpTwo">
            <div class="divUpTwoPassword">비밀번호</div>
            <input type="text" class="filled-basic" value="비밀번호">
          </div>
          <div class="divUpThree">
            <div class="divUpThreePassCheck">비밀번호 확인</div>
            <input type="text" class="filled-basic" value="비밀번호 확인">
          </div>
          
          <div class="divUpButton">
            <div class="divUpButtonSave">
              <button class="divUpButtonSave1">회원가입</button>
            </div>
            <div class="divUpButtonClose">
  				<button class="divUpButtonClose1" onclick="handleClose()">나가기</button>
			</div>
          </div>
        </div>
        <div class="divDown">192.168.0.80</div>
      </div>
    </div>
  </div>
   <script src="/js/loginA.js"></script>
</body>
</html>


