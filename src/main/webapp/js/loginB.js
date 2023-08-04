const signupModal= document.querySelector(".signup-modal");
const container = document.querySelector(".container");
const curtain = document.getElementById("curtain");
container.addEventListener('click', modal);

function modal(){
    if(!signupModal.classList.contains("isModal")) return;
    closeModal();
}

function openModal(event){
    signupModal.classList.toggle('isModal');
	event.stopImmediatePropagation();
    curtain.classList.add('dark-curtain');
}

function closeModal(){
    signupModal.classList.remove('isModal');
    curtain.classList.remove('dark-curtain');
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

