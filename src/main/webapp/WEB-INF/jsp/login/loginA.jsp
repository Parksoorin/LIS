<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인</title>
  <style>
    .loginHome {
  position: relative;
  height: 100vh;
  display: flex;
  align-items: stretch;
}

.loginInput {
  padding: 20px;

  display: flex;
  flex-direction: column;
  justify-content: center;
  

  gap: 10px;
  background: #EEE;
  
  width:350px;
}

.loginbox {
	
	 background: #EEE;
	 flex-direction: column;
     
     width: 350px;
     
    
}

.loginRightImg {
  width:70%;
  height: 100vh;
  background-repeat: no-repeat;
  background-size: cover;
  background-image: url('../../../images/loginimg/loginimg1.png');
}


.IdBox {
  display: flex;
width: 300px;
height: 25px;
padding: 20px ;
align-items: center;
justify-content: center;

}

.loginPwBox {
  margin-top: 15px;
  margin-bottom: 20px;
}

.loginIdPw {
  display: flex;
  justify-content: space-between;
  align-items: center;
  align-self: stretch;
  margin-bottom: 20px;
}


#loginButton .btn-icon-l {
  display: flex;
  justify-content: center;
  align-items: center;
 
  width: 345px;
  padding: 14px 30px;
  
  background-color: #218ECB;
  color: white;

  margin-bottom: 10px;
}

#loginGoOut .btn-icon-l {
  display: flex;
  justify-content: center;
  align-items: center;
  
  width: 345px;
  padding: 14px 30px;
  background-color: gray;
  
  color: white;
  margin-bottom: 50px;
}

.boxAll {
  position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 400px;
    background-color :paper;
    border: 2px solid #000;
    padding: 5px;
    width: 750px;
    
    background-color: #F1F1F1;
  }

.divAll {
 
  /* background-color: #F1F1F1; */
}

.modal-modal-title {
  /* margin-left: 49px; */
}

.divUp {
  
  
  display: flex;
  padding: 50px;
  flex-direction: column;
  align-items: flex-start;
  gap: 10px;

  /* margin: 0px;
  padding: 50px; */
}

.divUpOne {
  /* background-color: #61dafb; */
  
  display: flex;
  align-items: center;
  gap: 20px;

  width: 100%;

  
}

.divUpOneUserId {
  color : blue;

  
}

.divUpTwo {
  /* background-color: yellow; */

  display: flex;
  align-items: center;
  gap: 20px;

  
}

.divUpTwoEquipment {
  color : blue;

  
}

.divUpThree {
  /* background-color: aqua; */

  display: flex;
  align-items: center;
  gap: 20px;
}

.divUpThreePort {
  color: blue;
}

.divUpCheck {
  /* background-color: antiquewhite; */

  display: flex;
  flex-direction: column;
  align-items: flex-start;
  gap: 10px;

  margin-top: 40px;
  margin-bottom: 40px;
}

.divUpButton {
  /* background-color: aquamarine; */

  display: flex;
  justify-content: center;
  align-items: center;
  gap: 20px;

  width: 80%;
  
}

.divUpButtonSave {
  width: 50%;
  
  /* width: 100px; */
  border: nane;
}

.divUpButtonSave1 {
  width: 100%;
  background-color: #218ECB;
  color: white;
  
  height: 40px;
}

.divUpButtonClose {
  width: 50%;
}

.divUpButtonClose1 {
  background-color: gray !important;
  width: 100%;
  
  color: white;
  
  height: 40px;
}

.divDown {
  background-color: #696969;

  color: white;
 
  display: flex;
  justify-content: flex-end;
}

.modal {
    display: none; /* 모달 창을 처음에는 숨깁니다. */
  }
  </style>
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

  <script>
    // Add necessary JavaScript code (e.g., handleOpen and handleClose functions)
    const label = { inputProps: { "aria-label": "Checkbox demo" } };

    let open = false;
    
    const handleOpen = () => {
        open = true;
        const modal = document.getElementById('myModal');
        modal.style.display = 'block'; /* 모달 창을 보이도록 설정합니다. */
      };
      
      function handleClose() {
        open = false;
        const modal = document.getElementById('myModal');
        modal.style.display = 'none'; /* 모달 창을 숨깁니다. */
      }
  </script>
</body>
</html>


