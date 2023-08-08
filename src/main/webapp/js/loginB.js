const signupModal= document.querySelector(".signup-modal");
const container = document.querySelector(".container");
const curtain = document.getElementById("curtain");
const checkbox = document.getElementById("id-checkbox");
const signupHint = document.querySelector('.signup-hint');
const signupId = document.getElementById('signup-id');
const signupPassword = document.getElementById('signup-password');
const signupRePassword = document.getElementById('signup-rePassword');

container.addEventListener('click', modal);
curtain.addEventListener('click', closeModal);


function modal(){
    if(!signupModal.classList.contains("isModal")) return;
    closeModal();
}

function openModal(event){
    signupModal.classList.toggle('isModal');
	event.stopImmediatePropagation();
    if(signupModal.classList.contains("isModal")) 
        curtain.classList.add('dark-curtain');
    else
        curtain.classList.remove('dark-curtain');
}

function idSave(event){
    event.preventDefault();
    if(checkbox.checked){
        checkbox.checked = false;
    } else {
        checkbox.checked = true;
    }
}

function closeModal(){
    signupModal.classList.remove('isModal');
    curtain.classList.remove('dark-curtain');
    initSignup();
}

function initSignup(){
    signupId.value = '';
    signupPassword.value = '';
    signupRePassword.value = '';
    signupHint.innerHTML = '';
}

function signup(){
    
    const idRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    const passwordRegExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

    console.log(`아이디 : ${signupId}`);
    console.log("회원가입 버튼 누름 - POST 요청");

    if(!signupId.value){
        signupHint.innerHTML = `<span class="red">아이디를 입력해주세요.</span>`;
        alert('아이디를 입력해주세요.');
        return false;
    }
    if(!signupPassword.value){
        signupHint.innerHTML = `<span class="red">비밀번호를 입력해주세요.</span>`;
        alert('비밀번호를 입력해주세요.');
        return false;
    }
    if(!signupRePassword.value){
        signupHint.innerHTML = `<span class="red">비밀번호 확인을 입력해주세요.</span>`;
        alert('비밀번호 확인을 입력해주세요.');
        return false;
    }

    if(signupPassword.value !== signupRePassword.value){
        signupHint.innerHTML = `<span class="red">비밀번호가 동일하지 않습니다.</span>`;
        alert('비밀번호가 동일하지 않습니다.');
        return false;
    }

    if(signupId.value.match(idRegExp) == null){
        signupHint.innerHTML = `<span class="red">아이디 형식은 example@naver.com 입니다.</span>`;
        alert('아이디 형식은 example@naver.com 입니다.');
        return false;
    }

    if(signupPassword.value.match(passwordRegExp) == null && signupRePassword.value.match(passwordRegExp) == null){
        signupHint.innerHTML = `<span class="red">비밀번호는 특문,문자,숫자 형태의 8~15자리 이내의 암호입니다. </span>`;
        alert('비밀번호는 특문,문자,숫자 형태의 8~15자리 이내의 암호입니다.');
        return false;
    }

    return true;
    // fetch('')
    // closeModal();
}

function validator(id, password, rePassword){
    const idRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    const passwordRegExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

    if(!id){
        signupHint.innerHTML = `<span class="red">아이디를 입력해주세요.</span>`;
        alert('아이디를 입력해주세요.');
        return false;
    }
    if(!password){
        signupHint.innerHTML = `<span class="red">비밀번호를 입력해주세요.</span>`;
        alert('비밀번호를 입력해주세요.');
        return false;
    }
    if(!rePassword){
        signupHint.innerHTML = `<span class="red">비밀번호 확인을 입력해주세요.</span>`;
        alert('비밀번호 확인을 입력해주세요.');
        return false;
    }

    if(password !== rePassword){
        signupHint.innerHTML = `<span class="red">비밀번호가 동일하지 않습니다.</span>`;
        alert('비밀번호가 동일하지 않습니다.');
        return false;
    }

    if(id.match(idRegExp) == null){
        signupHint.innerHTML = `<span class="red">아이디 형식은 example@naver.com 입니다.</span>`;
        alert('아이디 형식은 example@naver.com 입니다.');
        return false;
    }

    if(password.match(passwordRegExp) == null && rePassword.match(passwordRegExp) == null){
        signupHint.innerHTML = `<span class="red">비밀번호는 특문,문자,숫자 형태의 8~15자리 이내의 암호입니다. </span>`;
        alert('비밀번호는 특문,문자,숫자 형태의 8~15자리 이내의 암호입니다.');
        return false;
    }
    return true;
}

function login(){
    console.log("로그인 버튼 누름 - POST 요청");
}

