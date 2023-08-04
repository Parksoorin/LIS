<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="/css/loginB.css">
    </head>
    <body>
    	<div id="curtain"></div>
        <div class="container">
            <div class="login-container">
                <div class="login-box">
                    <div class="login-text">로그인</div>
                    <div>
                        <div class="id">
                            <input class="padding-left-md " type="text" name="id" placeholder="ID" >
                        </div>
                        <div class="password " name="password">
                            <input class="padding-left-md margin-bottom-lg" type="password" name="password" placeholder="PW" >
                        </div>
                        <div class="save-find-box">
                            <div class="save">
                                <input type="checkbox">
                                <a href="#">아이디 저장</a>
                            </div>
                            <div class="find">
                                <a href="#">비밀번호 찾기</a>
                            </div>
                        </div>
                        <div class="login-button">
                            <button onclick="login()">로그인</button>
                        </div>
                        <div class="exit-button">
                            <button onclick="openModal(event)">회원가입</button>
                        </div>
                    </div> 
                </div>
            </div>          
            <img src="/images/loginimg/loginimg1.png" alt="로그인 백그라운드 이미지"/>
        </div>
        <div class="signup-modal">
            <div class="signup-container">
                <div class="signup-title">회원가입</div>
                <div class="signup-grid">
                    <span class="modal-info">아이디 </span> 
                    <input class="signup-input padding-left-md" id="signup-id" type="text" name="signupId" placeholder="아이디를 입력해주세요.">
                </div>
                <div class="signup-grid">
                    <span class="modal-info">비밀번호 </span> 
                    <input class="signup-input padding-left-md" type="password" name="password" placeholder="비밀번호를 입력해주세요.">
                </div>
                <div class="signup-grid ">
                    <span class="modal-info">비밀번호 확인 </span> 
                    <input class="signup-input padding-left-md margin-bottom-lg" type="password" name="rePassword" placeholder="비밀번호를 다시 입력해주세요.">
                </div>
                <input class="modal-button primary" type="button" value="가입" onclick="signup()">
                <input class="modal-button gray" type="button" value="닫기" onclick="closeModal()">
            </div>
        </div>
       <script src="/js/loginB.js" defer></script>   
    </body>
    </html>