const signupModal= document.querySelector(".signup-modal");
const container = document.querySelector(".container");

container.addEventListener('click', modal);

function modal(){
    if(!signupModal.hasClass("isModal")) return;
    closeModal();
}

function openModal(){
    signupModal.classList.toggle('isModal');
}

function closeModal(){
    signupModal.classList.remove('isModal');
}

function signup(){
    const signupId = document.getElementById('signup-id').value;
    console.log(`아이디 : ${signupId}`);

    console.log("회원가입 버튼 누름 - POST 요청");
    closeModal();
    // fetch('')
}

function login(){
    console.log("로그인 버튼 누름 - POST 요청");
}