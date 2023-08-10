<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/oneGridC.css" />
</head>
<body>
	<!-- 위 -->
	<div class="up">
        <div class="up-btn">
            <button class="btn"><img src="/images/search.png" class="icon">조회</button>
		    <button class="btn"><img src="/images/save.png" class="icon">저장</button>
        </div>	
	</div>
	
	<!-- 아래 -->
	<div class="down">	
		<div class="down-left">	<!-- 아래.왼쪽 -->
			<div class="down-left-btn">	<!-- 아래.왼쪽.위.버튼 -->
				<button class="btn"><img src="/images/search.png" class="icon">입력</button>
				<button class="btn"><img src="/images/delete.png" class="icon-x">삭제</button>
			</div>
			<div class="down-left-text">
                <select id="left-select"></select>
                <button class="FC-btn"><img src="/images/search.png" class="icon">Find</button>
                <button class="FC-btn"><img src="/images/clear.png" class="icon">Clear</button>
            </div>
			<div class="grid">
                <div class="frame">
                    <h1>그리드1</h1>
                </div>
            </div>
		</div>
		<div class="down-right">	<!-- 아래.오른쪽 -->
			<div class="down-right-up">	<!-- 아래.오른쪽.위 -->
				<div class="down-right-btn">	<!-- 아래.오른쪽.위.버튼 -->
					<button class="btn"><img src="/images/search.png" class="icon">입력</button>
					<button class="btn"><img src="/images/delete.png" class="icon-x">삭제</button>
					<button class="btn"><img src="/images/settings.png" class="icon">컬럼설정</button>
				</div>
				<div class="grid2">
                    <div class="frame"><h1>그리드2</h1></div>
                </div>
			</div>
			<div class="down-right-down">	<!-- 아래.오른쪽.아래 -->
				<div class="down-right-btn2">	<!-- 아래.오른쪽.아래.버튼 -->
					<button class="btn"><img src="/images/search.png" class="icon">입력</button>
					<button class="btn"><img src="/images/delete.png" class="icon-x">삭제</button>
					<button class="btn"><img src="/images/settings.png" class="icon">컬럼설정</button>
				</div>
				<div class="grid3">
                    <div class="frame"><h1>그리드3</h1></div>
                </div>
			</div>
		</div>
	</div>
</body>
</html>