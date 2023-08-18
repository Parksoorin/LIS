<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>LIS 연습</title>
        <link rel="stylesheet" href="/css/loginE.css">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>
    <body>
    	<div id="curtain"></div>
        <div class="container">
            <div class="login-container">
                <div class="login-box">
                    <div class="login-text">로그인</div>
                    <div>
                        <div class="id">
                            <input class="padding-left-md " id="login-id" type="text" name="id" placeholder="ID" >
                        </div>
                        <div class="password " name="password">
                            <input class="padding-left-md margin-bottom-lg" id="login-password" type="password" name="password" placeholder="PW" >
                        </div>
                        <div class="save-find-box">
                            <div class="save">
                                <input id="id-checkbox" type="checkbox">
                                <a onclick="idSave(event)" href="#">아이디 저장</a>
                            </div>
                            <div class="find">
                                <a href="#">비밀번호 찾기</a>
                            </div>
                        </div>
                        <div class="login-button">
                            <button id="loginBtn">로그인</button>
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
                    <input class="signup-input padding-left-md" id="signup-id" type="text" name="signupId" placeholder="아이디를 입력해주시기 바랍니다">
                </div>
                <div class="signup-grid">
                    <span class="modal-info">비밀번호 </span> 
                    <input class="signup-input padding-left-md" id="signup-password" type="password" name="password" placeholder="비밀번호를 입력해주시기 바랍니다">
                </div>
                <div class="signup-grid ">
                    <span class="modal-info">비밀번호 확인 </span> 
                    <input class="signup-input padding-left-md" id="signup-rePassword" type="password" name="rePassword" placeholder="비밀번호 확인해주시기 바랍니다">
                </div>
                <div class="signup-hint margin-bottom-lg"></div>
                <div class="modal-button-container">
	                <input class="modal-button primary" id="joinBtn" type="button" value="회원가입">
	                <input class="modal-button gray" type="button" value="닫기" onclick="closeModal()">
                </div>
            </div>
        </div>
       <script src="/js/loginE.js" defer></script>   
       <script>
       	

           function validator(id, password, rePassword){
                const idRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                const passwordRegExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

                if(!id){
                    signupHint.innerHTML = `<span class="red">아이디를 입력해주시기 바랍니다</span>`;
                    alert('아이디를 입력해주시기 바랍니다');
                    return false;
                }
                if(!password){
                    signupHint.innerHTML = `<span class="red">비밀번호를 입력해주시기 바랍니다</span>`;
                    alert('비밀번호를 입력해주시기 바랍니다');
                    return false;
                }
                if(!rePassword){
                    signupHint.innerHTML = `<span class="red">비밀번호 확인해주시기 바랍니다</span>`;
                    alert('비밀번호 확인해주시기 바랍니다');
                    return false;
                }

                if(password !== rePassword){
                    signupHint.innerHTML = `<span class="red">비밀번호가 동일하지 않습니다</span>`;
                    alert('비밀번호가 동일하지 않습니다');
                    return false;
                }

           
                return true;
           }
           
            // 로그인 로직
            $("#loginBtn").on("click", function(){
                var id = $('#login-id').val();
                var password = $('#login-password').val();
                
                if(!id){
                    alert('아이디를 입력해주세요');
                    return;
                }
                if(!password){
                    alert('비밀번호를 입력해주세요');
                    return;
                }

                $.ajax({
                    type: "post",
                    url : "/loginProcessE.do",
                    data: {
                        id : id,
                        password : password
                    },
                    dataType : "json",
                    error: function(data){
                        console.log('error');
                        alert(id + '는 없는 아이디입니다.');
                            
                        

                    },
                    success: function(data){
                        
                
                        if(data.result==='success'){
                            // 로그인 성공 로직
                            alert('로그인 완료');
                            location.href="http://localhost:8888/oneGrid.do";
                            


                        } else if(data.result==='fail'){
                            // 로그인 실패 로직
                            alert('아이디 or 비밀번호가 잘못되었습니다');
                        }
                    }

                })


            })

            // 회원가입 처리 로직
            $("#joinBtn").on("click", function(){


                var id = $('#signup-id').val();
                var password = $('#signup-password').val();
                var rePassword = $('#signup-rePassword').val();
                
                if(!validator(id, password, rePassword)) {
                    return;
                }


                $.ajax({
                    type: "post",
                    url : "/joinUserE.do",
                    data: {
                        id : id,
                        password : password
                    },
                    dataType: "json",
                    error: function(data) {
                        console.log(data.result);

                        alert("오류발생");
                    },
                    success: function(data){
                        if(data.result === 'success'){
                            alert("회원가입 완료");
                            location.reload();
                        } else if(data.result === 'fail'){
                            alert("아이디가 중복되었습니다");
                            signupHint.innerHTML = `아이디가 중복되었습니다</span>`;
                        }
                    }
                })
            })
       
       </script>
    </body>
    </html>