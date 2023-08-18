$("#signup-btn").on("click", function() {
	$("#modal-container").css("display", "block");
})
  
$("#close-btn").on("click", function() {
	$("#userId").val("");
	$("#userPw").val("");
	$("#userPwCheck").val("");
	$("#valid-check").css("display", "none");
	$("#modal-container").css("display", "none");
})
  
$("#joinBtn").on("click", function() {
	var id = $("#userId").val();
	var password = $("#userPw").val();
	var passwordCheck = $("#userPwCheck").val();
	
	if (id === "") {
		console.log("아이디를 입력해주세요.");
		$("#valid-check").css("display", "block");
		$("#valid-check").text("아이디를 입력해주세요.");
	} else if (password === "") {
		console.log("패스워드를 입력해주세요.");
		$("#valid-check").css("display", "block");
		$("#valid-check").text("패스워드를 입력해주세요.");
	} else if (password !== passwordCheck) {
		console.log("패스워드와 패스워드 확인이 일치하지 않습니다.");
		$("#valid-check").css("display", "block");
		$("#valid-check").text("패스워드와 패스워드 확인이 일치하지 않습니다.");
	} else {
		$.ajax({
			type: "post",
			url: "/joinUserD.do",
			data: {
				id: id,
				password: password
			},
			dataType: "json",
			error: function() {
				alert("에러 발생");
			},
			success: function(data) {
				var result = data.result;
				console.log(result);
				if (result === "error") {
					alert("이미 존재하는 아이디입니다.");
				} else {
					alert("회원가입이 완료되었습니다.");
					location.reload();
				}
			}
		})
	}
})

const loginFn = function () {
	var id = $("#loginId").val();
	var password = $("#loginPw").val();
	
	if (id === "") {
		console.log("아이디를 입력해주세요.");
		$("#login-check").css("display", "block");
		$("#login-check").text("아이디를 입력해주세요.");
	} else if (password === "") {
		console.log("패스워드를 입력해주세요.");
		$("#login-check").css("display", "block");
		$("#login-check").text("패스워드를 입력해주세요.");
	} else {
		$.ajax({
			type: "post",
			url: "/loginUserD.do",
			data: {
				id: id,
				password: password
			},
			dataType: "json",
			error: function() {
				alert("회원 정보가 일치하지 않습니다.");
			},
			success: function(data) {
				var d = data;
				var result = data.result;
				console.log(d);
				console.log(result);
				
				if (result === "error") {
					alert("로그인 실패");
				} else {
					alert("로그인 성공");
					location.href = "http://localhost:8080/qcManagementGrid.do";
				}
			}
		})
	}
}

$("#login-btn").on("click", function() {
	loginFn();
});

$("#loginPw").on("keyup", function(key) {
	if (key.keyCode == 13) {
		loginFn();
	}
});
