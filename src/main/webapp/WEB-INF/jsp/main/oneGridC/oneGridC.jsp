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
            <div style="height:auto; overflow:auto;"><table id="lisc001DTO"></table></div>
		</div>
		
		<div class="down-right">	<!-- 아래.오른쪽 -->
			<div class="down-right-up">	<!-- 아래.오른쪽.위 -->
				<div class="down-right-btn">	<!-- 아래.오른쪽.위.버튼 -->
					<button class="btn"><img src="/images/search.png" class="icon">입력</button>
					<button class="btn"><img src="/images/delete.png" class="icon-x">삭제</button>
					<button class="btn"><img src="/images/settings.png" class="icon">컬럼설정</button>
				</div>
                <div style="height:40vh; overflow:auto;"><table id="lisc002DTO"></table></div>
			</div>
			<div class="down-right-down">	<!-- 아래.오른쪽.아래 -->
				<div class="down-right-btn2">	<!-- 아래.오른쪽.아래.버튼 -->
					<button class="btn"><img src="/images/search.png" class="icon">입력</button>
					<button class="btn"><img src="/images/delete.png" class="icon-x">삭제</button>
					<button class="btn"><img src="/images/settings.png" class="icon">컬럼설정</button>
				</div>
                <div style="height:100%; overflow:hidden"><table id="lisc003"></table></div>
			</div>
		</div>
	</div>
	<script>
	$('#lisc001DTO').jqGrid({
	    url: "/oneGridC.do",	// 서버주소 
	    reordercolNames:true,
	    postData : { type:"A" }, // 보낼 파라미터
	    mtype:'POST',	// 전송 타입
	    datatype : "json",	// 받는 데이터 형태 
	    colNames:['코드','코드명', '비고'],	//컬럼명
	    colModel:[
	   	 	 { name: 'CODE_TYPE', index: 'CODE_TYPE', width: '40', align:"center"},
		     { name: 'CODE_TYPE_NAME', index: 'CODE_TYPE_NAME', width: '40', align:"center"},
		     { name: 'COMMENTS', index: 'COMMENTS', width: '10', align: "center" }
		], //서버에서 받은 데이터 설정
	    jsonReader: {
		     repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
		     root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
		     records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord 
	    },
	    autowidth: true,
	  	rownumbers: true,         
	  	gridview : false,  // 선표시 true/false  
		shrinkToFit: true,
	    height: "auto",//테이블의 세로 크기, Grid의 높이         
	  	loadtext : "자료 조회중입니다. 잠시만 기다리세요..." ,   // 데이터 로드중일때      
	  	emptyrecords: "Nothing to display",  // 데이터없을떄
	  	rowNum:-1, 
	  	loadComplete: function(data){  
	      console.log(data);
	  	},	// loadComplete END   
	  	
	  	onSelectRow: function(rowid) {
	  		$('#lisc001DTO').getRowData(rowid);
	     	//선택한 열의 데이터 가져오기  -  var selRowData = $("#lisc001DTO").getRowData(rowid);
	     	var rowid, codetype;
	     	rowid  = $("#lisc001DTO").jqGrid('getGridParam', 'selrow' );  // 선택한 열의 아이디값
	        codetype = $("#lisc001DTO").jqGrid('getRowData', rowid).CODE_TYPE;   // 선택한 열중에서 grid내의 정보를 가져온다.
	        console.log(codetype);
	        
	        $('#lisc002DTO').jqGrid({
	        	url: "/oneGridC002.do",	// 서버주소 
	    	    reordercolNames:true,
	    	    postData : { type: codetype }, // 보낼 파라미터
	    	    mtype:'POST',	// 전송 타입
	    	    datatype : "json",	// 받는 데이터 형태 
	    	    colNames:['코드','코드명', '비고'],	//컬럼명
	    	    colModel:[
	    	   	 	 { name: 'CODE_TYPE', index: 'CODE_TYPE', width: '40', align:"center"},
	    		     { name: 'CODE_TYPE_NAME', index: 'CODE_TYPE_NAME', width: '40', align:"center"},
	    		     { name: 'COMMENTS', index: 'COMMENTS', width: '10', align: "center" }
	    		], //서버에서 받은 데이터 설정
	    	    jsonReader: {
	    		     repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
	    		     root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
	    		     records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord 
	    	    },
	    	    autowidth: true,
	    	  	rownumbers: true,         
	    	  	gridview : false,  // 선표시 true/false  
	    		shrinkToFit: true,
	    	    height: "auto",//테이블의 세로 크기, Grid의 높이         
	    	  	loadtext : "자료 조회중입니다. 잠시만 기다리세요..." ,   // 데이터 로드중일때      
	    	  	emptyrecords: "Nothing to display",  // 데이터없을떄
	    	  	rowNum:-1, 
	    	  	loadComplete: function(data){  
	    	      console.log(data);
	    	  	},	// loadComplete END   
	    	  	
	    	  	onSelectRow: function(rowid){}
	        })
	  	}
	}); 
	</script>
</body>
</html>