<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
<title>QC결과조회 (일별)</title>
<link rel="stylesheet" href="./css/qcResult.css">
</head>
<body>
    <div class="header">
        <section>
            <div class="container">
                <div class="check-title">검사일</div>
                <input class="check-inputbox1" type="date" >
                <div class="check-wave"> ~ </div>
                <input class="check-inputbox2" type="date" >
                <input type="radio" name="check-date" value="check-total" id="check-total" checked>
                <label for="check-total">전체</label>
                <input type="radio" name="check-date" value="check-inside" id="check-inside">
                <label for="check-inside" class="check-inside">내부</label>
                <input class="check-external" type="radio" name="check-date" value="check-external" id="check-external">
                <label for="check-external">외부</label>
             
            <div class="check-part-title">검사파트</div>
            <select class="check-part-select">
                <option value="">(전체)</option>
            </select>
            <div class="lotno-title">Lot No</div>
            <input type="text">
            <div class="level-title">Level</div>
            <select class="level-select">
                <option value="">(전체)</option>
            </select>
            </div>
            <div class="button-container">
                <button class="excel-btn">Excel</button>
                <button class="save-btn">저 장</button>
            </div>
        </section>
        <section>
            <div class="container">
                <div class="check-item-title">검사항목</div>
                <input class="check-inputbox" type="text">
                <button class="check-item-button"></button>
                <input type="radio" name="check-item" value="check-item-total" id="check-item-total" checked>
                <label for="check-item-total">전체</label>
                <input type="radio" name="check-item" value="check-item-accept" id="check-item-accept" >
                <label for="check-item-accept">Accept</label>
                <input type="radio" name="check-item" value="check-item-reject" id="check-item-reject">
                <label for="check-item-reject">Reject</label>
                <div class="substance-title">물질명</div>
                <select class="substance-select">
                    <option value="">(전체)</option>
                </select>
                <div>QC 코드</div>
                <input class="qccode-input" type="text">
                <div class="check-jangbi-title">검사장비</div>
                <select class="check-jangbi-select">
                    <option value="">(전체)</option>
                </select>
           </div>
            <div class="button-container">
                <button class="find-btn">조 회</button>
                <button class="delete-btn">삭 제</button>
            </div>
        </section>
    </div>
    <div class="body">
        <table id="list1" ></table>
    </div>
	<div class="state-container">
	 <div>상태 메세지 > </div>
	 <div>저장 성공!</div>
	</div>
    <div class="footer">
        <div class="footer-header">
            <input type="radio" name="graph" id="regular" value="regular" checked>
            <label for="regular">정규그래프</label>
            <input type="radio" name="graph" id="actual" value="actual">
            <label for="actual">실측그래프</label>
            <button class="graph-view">그래프 표시</button>
            <button class="graph-output">그래프 출력</button>
        </div>
        <canvas id="myChart" style="height: 150px; width:100%;"></canvas>
    </div>
    <script src="./js/qcResult.js" defer></script>
</body>
</html>