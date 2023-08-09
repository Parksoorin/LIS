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
        <input type="text" class="IdBox" placeholder="ID" id="loginId">
      </div>
      <div class="loginPwBox">
        <input type="password" class="IdBox" placeholder="PW" id="loginPw">
      </div>
      <div class="loginIdPw">
        <div>
          <input type="checkbox" aria-label="Checkbox demo" /> 아이디 저장
        </div>
        <div><a href="http://naver.com">비밀번호 찾기</a></div>
      </div>
      <div id="loginButton">
        <button class="btn-icon-l btn-p" id="loginBtn">
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
            <input type="text" class="filled-basic" placeholder="ID" id="userId">
          </div>
          <div class="divUpTwo">
            <div class="divUpTwoPassword">비밀번호</div>
            <input type="password" class="filled-basic" placeholder="비밀번호" id="userPw">
          </div>
          <div class="divUpThree">
            <div class="divUpThreePassCheck">비밀번호 확인</div>
            <input type="password" class="filled-basic" placeholder="비밀번호 확인" id="userPwConfirm">
          </div>
          
          <div class="divUpButton">
            <div class="divUpButtonSave">
              <button class="divUpButtonSave1" id="joinBtn">회원가입</button>
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
   <script>
   $("#joinBtn").on("click", function(){
	   var id = $('#userId').val();
	   var password = $('#userPw').val();
	   var repassword = $('#userPwConfirm').val();
	   if(id =="" || id == null) {
	      alert("아이디를 입력하세요.");
	      return;
	   } else if(password == "" || password == null) {
	      alert("비밀번호를 입력하세요.");
	      return;
	   } else if(repassword == "" || repassword == null){
	      alert("비밀번호 확인이 필요합니다.");
	      return;
	   }
	   if(password != repassword) {
	      alert("비밀번호가 다릅니다.");
	      return;
	   }
	   
	   $.ajax({
	      type : "post",
	      url : "/joinUserA.do",
	      data: {
	         id: id,
	         password: password
	      },
	      dataType: "json",
	      error: function(){
	         alert("에러발생");
	      },
	      success: function(data){
	    	  console.log(data);
	         if (data.result === "success") alert("회원가입 성공");
	         else if (data.result === "none")
	         alert("이미 있는 아이디 입니다.");
	         location.reload();
	      }
	   })
	})
  	   
  	   
		$('#loginBtn').on("click", function(){
	  		 var loginId = $("#loginId").val();
	 	     var loginPassword = $("#loginPw").val();
	   
		$.ajax({
		   type : "post",
		   url: "/loginUserA.do",
		   data: {
			 id: loginId,
		     password: loginPassword
		   },
		   dataType: "json",
		   error: function(){
		      alert("에러발생");
		   },
		   success: function(data){
		      if (data.result === "success") {
		    	  alert("로그인 성공");
		    	  location.href="http://localhost:8080/oneGrid.do";
		      }else if (data.result === "fail"){
		    	  alert("없는 정보 입니다.");  
		      }
	      }
	   })
	})
  	 
  	
   	       
   </script>
</body>
</html>


