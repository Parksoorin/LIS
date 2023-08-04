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
        <div>비밀번호 찾기</div>
      </div>
      <div id="loginButton">
        <button class="btn-icon-l btn-p" onclick="handleOpen()">
          로그인
        </button>
      </div>
      <div id="loginGoOut">
        <button class="btn-icon-l btn-dk">
          나가기
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
          <h2 class="modal-modal-title">사용자 정보</h2>
          <div class="divUpOne">
            <div class="divUpOneUserId">사용자 ID</div>
            <input type="text" class="filled-basic" value="1001" disabled >
            <input type="text" class="filled-basic" value="홍길동" disabled >
          </div>
          <div class="divUpTwo">
            <div class="divUpTwoEquipment">장비 코드</div>
            <input type="text" class="outlined-basic" value="S01">
          </div>
          <div class="divUpThree">
            <div class="divUpThreePort">포트 번호</div>
            <input type="number" class="outlined-number" value="809">
          </div>
          <div class="divUpCheck">
            <div>
              <input type="checkbox" aria-label="Checkbox demo" />
              시작 시 자동실행
            </div>
            <div>
              <input type="checkbox" aria-label="Checkbox demo" />
              시작 시 창 크기 최대화
            </div>
          </div>
          <div class="divUpButton">
            <div class="divUpButtonSave">
              <button class="divUpButtonSave1">저장</button>
            </div>
            <div class="divUpButtonClose">
  				<button class="divUpButtonClose1" onclick="handleClose()">닫기</button>
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


