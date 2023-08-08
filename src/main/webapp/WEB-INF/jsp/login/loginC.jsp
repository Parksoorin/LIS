<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<c:url value='/js/jquery-3.5.1.min.js' />"></script>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="/css/loginC.css" />
</head>
<style>	
</style>
<body>
	<div id="All">
        <div id="left">
            <div id="loginbox">
                <div class='text'>로그인</div>
                <div class="idpw">
                    <input type="text" name="userid" class="outlined-basic" placeholder="ID" id="loginID">
                    <input type="password" name="passwd" class="outlined-basic" placeholder="PW" id="loginPW">
                    <div class="checkbox">
                        <div><input type="checkbox"> 아이디 저장</div>
                        <div><a href="#" class="pwlink">비밀번호 찾기</a></div>
                    </div>
                </div>
                <div class="btnbox">
                    <button class="btnA" id="loginBtn">로그인</button>
                    <button class="btnB" onclick="handleOpen()">회원가입</button>
                </div>
            </div>
        </div>
        <div id="backimg"></div>
    </div>
    
    
    <!-- Modal  -->
  	<div class="modal" id="myModal">
    	<div class="dig">
    	<div class="box">
    		<div class='modalbox'>
    			<div id='numbox'>
    				<div class="text_line">아이디<input type="text" name="user" class="outlined-modal-id" placeholder="" id="userID" required="required"></div>
    				<div class="text_line">비밀번호<input type="password" name="user" class="outlined-modal-pw" placeholder="" id="userPW"></div>
    				<div class="text_line">비밀번호 확인<input type="password" name="user" class="outlined-modal-pw2" placeholder="" id="userPW2"></div>
    			</div>
    			<div id='btnCD'>
    				<button class="btnC" id="joinBtn">회원가입</button>
    				<button class="btnD" onclick="handleClose()">나가기</button>
    			</div>
    		</div>
    		</div>
        	<div class="divDown">192.168.0.80</div>
      	</div>
    </div>
    
    
    
    <script src="/js/loginC.js"></script>
</body>

<script>
$('#loginBtn').on("click", function(){
	var id = $('#loginID').val();
	var password = $('#loginPW').val();
	
	$.ajax({
		type : "post",
		url : "/loginID.do",
		data: {
			id: id,
			password: password
		},
		dataType: "json",
		error: function(){
			alert("에러발생");
		},
		success: function(data){
			if (data.result === "success") alert("로그인 성공");
			else if (data.result === "fail")
			alert("없는 정보 입니다.");
			location.reload();
		}
	})
})

$("#joinBtn").on("click", function(){
	var id = $('#userID').val();
	var password = $('#userPW').val();
	var repassword = $('#userPW2').val();
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
		url : "/joinUserC.do",
		data: {
			id: id,
			password: password
		},
		dataType: "json",
		error: function(){
			alert("에러발생");
		},
		success: function(data){
			if (data.result === "success") alert("회원가입 성공");
			else if (data.result === "fail")
			alert("이미 있는 아이디 입니다.");
			location.reload();
		}
	})
})

</script>
</html>





