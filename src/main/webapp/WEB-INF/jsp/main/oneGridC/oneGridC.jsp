<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/js/common/jquery/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/jqGrid/css/ui.jqgrid.css" />
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
                <table id="list1"></table>
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
                    <table id="list2"></table>
                </div>
			</div>
			<div class="down-right-down">	<!-- 아래.오른쪽.아래 -->
				<div class="down-right-btn2">	<!-- 아래.오른쪽.아래.버튼 -->
					<button class="btn"><img src="/images/search.png" class="icon">입력</button>
					<button class="btn"><img src="/images/delete.png" class="icon-x">삭제</button>
					<button class="btn"><img src="/images/settings.png" class="icon">컬럼설정</button>
				</div>
				<div class="grid3">
                    <table id="list3"></table>
                </div>
			</div>
		</div>
	</div>
	<script>
	$('#list1').jqGrid({
	    url: "<c:url value='/oneGrid3.do'/>",	// 서버주소 
	    reordercolNames:true,
	    postData : { type:"A" }, // 보낼 파라미터
	    mtype:'POST',	// 전송 타입
	    datatype : "json",	// 받는 데이터 형태 
	    colNames:['플래그','이름','나이'],	//컬럼명
	    colModel:[
	   	 	 { name: 'iud', index: 'iud', width: '100', align:"center", hidden: true,
		    	 formatter:"select", formatoptions :{value:"N:불용"}, edittype:"select", editoptions: {value:"N:불용"} },
		     { name: 'name', index: 'name', width: '100', align:"center", hidden: false},
		     { name: 'age', index: 'age', width: '1000', align: "center" }
		], //서버에서 받은 데이터 설정
	    jsonReader: {
		     repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
		     root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
		     records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord 
	    },
	    autowidth: true,
		shrinkToFit: true,
	    height: "auto",//테이블의 세로 크기, Grid의 높이         
	  	loadtext : "자료 조회중입니다. 잠시만 기다리세요..." ,   // 데이터 로드중일때      
	  	emptyrecords: "Nothing to display",  // 데이터없을떄
	  	rowNum:-1, 
	  	rownumbers: true,         
	  	gridview : true,  // 선표시 true/false         
	  	loadComplete: function(data){  
	      console.log(data);
	  	},	// loadComplete END   
	  	onSelectRow: function(rowid) {
	     	console.log(rowid);
	  	}
	});
	</script>
	<script type="text/javascript">
	var searchResultColNames =  ['게시글관리번호', '번호', '제목', '작성자', '날짜', '조회수'];
	var searchResultColModel =  [
	                  {name:'MgtNo',  index:'MgtNo',  align:'center', hidden:true},
	                  {name:'Num',    index:'Num',    align:'left',   width:'12%'},
	                  {name:'Title',  index:'Title',  align:'center', width:'50%'},
	                  {name:'Writer', index:'Writer', align:'center', width:'14%'},
	                  {name:'Date',   index:'Date',   align:'center', width:'12%'},
	                  {name:'Hit',    index:'Hit',    align:'center', width:'12%'}
	                ];

	$(function() {
	  $("#list2").jqGrid({
	    height: 261,
	    width: 1019,
	    colNames: searchResultColNames,
	    colModel: searchResultColModel,
	    rowNum : 10,
	    pager: "pager" 
	  });
	});
	</script>
</body>
</html>