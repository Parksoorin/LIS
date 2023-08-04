let open = false;

function handleOpen () {
    open = true;
    let modal = document.getElementById('myModal');
    modal.style.display = 'block'; /* 모달 창을 보이도록 설정합니다. */
};
  
  function handleClose() {
    open = false;
    let modal = document.getElementById('myModal');
    modal.style.display = 'none'; /* 모달 창을 숨깁니다. */
  }