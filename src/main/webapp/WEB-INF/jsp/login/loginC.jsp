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
                    <input type="text" name="userid" class="outlined-basic" placeholder="ID">
                    <input type="text" name="passwd" class="outlined-basic" placeholder="PW">
                    <div class="checkbox">
                        <div><input type="checkbox"> 아이디 저장</div>
                        <div>비밀번호 찾기</div>
                    </div>
                </div>
                <div class="btnbox">
                    <div class="loginbtn"><input type="submit" value="로그인" class="btnA"></div>
                    <div class="logoutbtn">
                    	<button class="btnB" onclick="handleOpen()">회원가입</button>
                    </div>
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
    				<div>아이디<input type="text" name="userid" class="outlined-basic" placeholder=""></div>
    				<div>비밀번호<input type="text" name="userid" class="outlined-basic" placeholder=""></div>
    				<div>비밀번호 확인<input type="text" name="userid" class="outlined-basic" placeholder=""></div>
    			</div>
    			<div id='btnCD'>
    				<button class="btnC">회원가입</button>
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

</script>

</html>