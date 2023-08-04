<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<c:url value='/js/jquery-3.5.1.min.js' />"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	* {	
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    #All {
        display: flex;
        height: 100vh;
    }

    #left {
    	background: #EEE;
        width: 405px;
    }

    #loginbox {
        display: flex;
        width: 405px;
        padding: 200px 50px;
        flex-direction: column;
        align-items: flex-start;
        gap: 40px;
        flex-shrink: 0;
        align-self: stretch;
        background: #EEE;
    }

    .text {
        color: #333;
        text-align: center;
        font-family: Noto Sans KR;
        font-size: 32px;
        font-style: normal;
        font-weight: 500;
        line-height: 100%;
        /* 32px */
        letter-spacing: -0.5px;

    }

    #backimg {
        width: 80%;
        height: 100vh;
        background-repeat: no-repeat;
        background-size: cover;
        background-image: url("../../../images/loginimg/loginimg1.png");
    }

    .idpw {
        display: flex;
        flex-direction: column;
        gap: 8px;
    }

    .checkbox {
        display: flex;
        justify-content: space-between;
        align-items: center;
        align-self: stretch;
    }

    .loginbtn .btnA {
        display: flex;
        width: 305px;
        padding: 14px 40px;
        justify-content: center;
        align-items: center;
        gap: 8px;
        border-radius: 4px;
        background: #218ECB;
        border: none;
        color: white;
    }

    .logoutbtn .btnB {
        display: flex;
        width: 305px;
        padding: 14px 40px;
        justify-content: center;
        align-items: center;
        gap: 8px;
        border-radius: 4px;
        background: #606477;
        border: none;
        color: white;
    }

    .btnbox {
        display: flex;
        flex-direction: column;
        gap: 8px;
    }

    .outlined-basic {
        display: flex;
        width: 300px;
        height: 46px;
        padding: 5px 10px;
        align-items: center;
        gap: 10px;
        border-radius: 4px;
        border: 1px solid #DADADA;
        background: #FFF;
    }
</style>
<body>
	<div id="All">
        <div id="left">
            <div id="loginbox">
                <div class='text'>로그인</div>
                <div class="idpw">
                    <div><input type="text" name="userid" class="outlined-basic" placeholder="ID"></div>
                    <div><input type="text" name="passwd" class="outlined-basic" placeholder="PW"></div>
                    <div class="checkbox">
                        <div><input type="checkbox"> 아이디 저장</div>
                        <div>비밀번호 찾기</div>
                    </div>
                </div>
                <div class="btnbox">
                    <div class="loginbtn"><input type="submit" value="로그인" class="btnA"></div>
                    <div class="logoutbtn"><input type="submit" value="나가기" class="btnB"></div>
                </div>
            </div>
        </div>



        <div id="backimg"></div>
    </div>
</body>

<script>
/* $("#test").click(function(){
	console.log("jqueryTest");
	$.ajax({
		url: "/ajaxTest.do",
		type: "GET",
		data: {
				"name" : "LIS" ,
				"test" : "Success"
			},
		dataType: 'json',
		success : function (res){
			console.log("success");
			console.log(res);
		},
		error : function (res) {
			console.log("erorr");
			console.log(res);
		}
	})
}) */
</script>

</html>