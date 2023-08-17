<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="/css/QCManagementGrid.css" /></head
  >
  <body>
    <!-- 상단 조회바 -->
    <nav class="nav">
      <!-- 조회구분, 검사파트/QC물질명 조회 -->
      <div class="flex-box">
        <!-- 조회구분 -->
        <div class="flex-box search-division-box">
          <p class="nav-division-title">조회구분</p>

          <div class="flex-box-column">
            <div class="radio-container">
              <input type="radio" name="use" id="useAll" />
              <label class="search-radio-label" for="useAll">전체</label>
              <input type="radio" name="use" id="use" checked />
              <label class="search-radio-label" for="use">사용</label>
              <input type="radio" name="use" id="useNot" />
              <label class="search-radio-label" for="useNot">폐기</label>
            </div>

            <div class="radio-container">
              <input type="radio" name="inOut" id="inOutAll" checked />
              <label class="search-radio-label" for="inOutAll">전체</label>
              <input type="radio" name="inOut" id="inside" />
              <label class="search-radio-label" for="inside">내부</label>
              <input type="radio" name="inOut" id="outside" />
              <label class="search-radio-label" for="outside">외부</label>
            </div>
          </div>
        </div>

        <!-- 검사파트/QC물질명 조회 -->
        <div class="flex-box">
          <div class="inspection-select-container">
            <div class="inspection-select-box check-part-select">
              <label class="inspection-label" for="inspectionPart"
                >검사파트</label
              >
              <select
                class="inspection-select"
                name="inspectionParts"
                id="inspectionPart"
              >
                <option value="inspectionPartAll">(전체)</option>
              </select>
            </div>

            <div class="inspection-select-box">
              <label class="inspection-label" for="qcMaterial">QC물질명</label>
              <select
                class="inspection-select"
                name="qcMaterials"
                id="qcMaterial"
              >
                <option value="qcMaterialAll">(전체)</option>
              </select>
            </div>
          </div>
          
          <div class="search-box">
            <button class="btn btn-big check-btn">조회</button>
          </div>
        </div>
      </div>

      <!-- 검사항목 조회용 파트 -->
      <div class="inspection-item-container">
        <label class="inspection-item-label" for="inspectionItemPart"
          >검사항목 조회용 파트</label
        >
        <select
          class="inspection-items"
          name="inspectionItemParts"
          id="inspectionItemPart"
        >
          <option value="inspectionItemAll">(전체)</option>
        </select>
      </div>
    </nav>

    <!-- 그리드 -->
    <div class="search-container">
      <div class="search-left-box">
        <div class="search-grid-top">
          <p class="search-grid-title">QC품질 검사항목관리 1.0</p>
          <div class="search-select-container">
            <input
              class="qcQuality-select-box"
              name="qcQualityItems"
              id="qcQualityItem"
              type="text"
              placeholder="Enter text to search..."
            />

            <button class="btn btn-small search-btn">검색</button>
            <button class="btn btn-small clear-btn">Clear</button>
          </div>
        </div>
        
        <div class="grid-container">
          <table id="list1" ></table>
        </div>
      </div>

      <div class="search-right-box">
        <div class="search-grid-top">
          <p class="search-grid-title">검사항목 리스트</p>
          <div class="search-select-container">
            <input
              class="inspectionList-select-box"
              name="inspectionLists"
              id="inspectionList"
              type="text"
              placeholder="Enter text to search..."
            />

            <button class="btn btn-small search-btn">검색</button>
            <button class="btn btn-small clear-btn">Clear</button>
          </div>
        </div>
        
        <div class="grid-container">
          <table id="list2" ></table>
        </div>
      </div>
    </div>

    <div class="result-container">
      <p class="result-title">QC품질별 검사항목 설정</p>
      <div class="result-top-box">
        <div class="result-subtop-box">
          <div class="result-option-container">
            <label class="result-label" for="qcCode">QC코드</label>
            <input
              class="result-input qcCode-input"
              id="qcCode"
              type="text"
              disabled
            />

            <label class="result-label" for="qcMaterialName">QC물질명</label>
            <input
              class="result-input qcMaterial-input"
              id="qcName"
              type="text"
              disabled
            />

            <label class="result-label" for="startDate">시작일</label>
            <input
              class="result-input date"
              id="startDate"
              type="text"
              disabled
            />

            <div class="must-option">
              <input
                type="checkbox"
                name="result-check-subOption"
                id="resultCheckSuboption"
              />
              <label for="resultCheckSuboption"
                >Low,High 값입력, Mean,SD 계산</label
              >
            </div>
          </div>

          <div class="flex-box result-check-container">
            <input type="checkbox" name="result-check-option" id="3SDRange" />
            <label for="3SDRange">3SD범위 사용</label>

            <input type="checkbox" name="result-check-option" id="1_2S" />
            <label for="1_2S">1_2S</label>

            <input type="checkbox" name="result-check-option" id="1_3S" />
            <label for="1_3S">1_3S</label>

            <input type="checkbox" name="result-check-option" id="2_2S" />
            <label for="2_2S">2_2S</label>

            <input type="checkbox" name="result-check-option" id="R_4S" />
            <label for="R_4S">R_4S</label>

            <input type="checkbox" name="result-check-option" id="4_1S" />
            <label for="4_1S">4_1S</label>

            <input type="checkbox" name="result-check-option" id="10X" />
            <label for="10X">10X</label>
          </div>
        </div>

        <div class="result-btn-container">
          <button class="btn btn-mid item-btn item-add-btn">항목추가</button>
          <button class="btn btn-mid item-btn item-save-btn">항목저장</button>
          <button class="btn btn-mid item-btn item-delete-btn">항목삭제</button>
        </div>
      </div>
      
      <div class="grid-3">
        <table id="list3" ></table>
      </div>
    </div>
    
<script>
$('#list1').jqGrid({
    url: "/qcManagementLisq100.do",	// 서버주소 
    reordercolNames:true,
    postData : { 
        type:"A",								
	}, // 보낼 파라미터
    mtype:'POST',	// 전송 타입
    datatype : "json",	// 받는 데이터 형태 
    colNames:['플래그', 'QC 코드', 'QC물질명', 'Lot No', 'Level', '검사파트', '시작일', '종료일', '고정검체번호',],	//컬럼명
    colModel:[
		{ name: '플래그',				index: 'iud',			hidden: true, },
		{ name: 'qcCode', 			index: 'qcCode',		width: '40', 	align: "left" },
		{ name: 'qcName', 			index: 'qcName',		width: '80', 	align: "left" },
		{ name: 'lotNo', 			index: 'lotNo',			width: '50', 	align: "left" },
		{ name: 'qcLevel',			index: 'qcLevel',		width: '20', 	align: "left" },
		{ name: 'testPart',			index: 'testPart',		width: '60', 	align: "left" },
		{ name: 'startDate',		index: 'startDate',		width: '40', 	align: "left" },
		{ name: 'endDate',			index: 'endDate',		width: '40', 	align: "left" },
		{ name: 'qcSpecimenSer',	index: 'qcSpecimenSer',	width: '40', 	align: "left" },
    ], //서버에서 startDate 데이터 설정
    jsonReader: {
	     repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
	     root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
	     records:'records'  // 보여지는 데이터 개수(레코드) totalRecord 
    },
    autowidth: true,
    autoheight: true,
	loadtext : "자료 조회중입니다. 잠시만 기다리세요..." ,   // 데이터 로드중일때      
	emptyrecords: "Nothing to display",  // 데이터 없을때
	rowNum: 2000, 
	rownumbers: false,  
	gridview : true,  // 선 표시 true/false
	sortable: true,
	loadonce: true,
	loadComplete: function(data){  
		console.log(data);
	},	// loadComplete END   
	beforeSelectRow: function(rowid, e) {  // 하나의 행만 체크
		$("#list1").jqGrid('resetSelection');
		return(true);
	},
	onSelectRow: function(rowid) {
		console.log($("#list1").getRowData(rowid));
		const selectRow = $("#list1").getRowData(rowid);
		
		$("#qcCode").val(selectRow.qcCode);
		$("#qcName").val(selectRow.qcName);
		$("#startDate").val(selectRow.startDate);
		
		$("#list3").jqGrid("GridUnload"); // 첫 번째 조회했던 그 값으로만 조회될 때 초기화
		$('#list3').jqGrid({
		    url: "/qcManagementLisq110.do",	// 서버주소 
		    reordercolNames:true,
		    postData : { 
		        qcCode: selectRow.qcCode
			}, // 보낼 파라미터
		    mtype:'POST',	// 전송 타입
		    datatype : "json",	// 받는 데이터 형태 
		    colNames:['플래그', '검사코드', '검사명', '검사파트', 'Mean', 'SD', 'CV', '허용(L)', '허용(H)', '서술형', '단위', '시작일', '종료일', '1(2S)', '판정(1_2S)', '1(3S)', '판정(1_3S)', '2(2S)', '판정(2_2S)',
		    	'R(4S)', '판정(R_4S)', '4(1S)', '판정(4_1S)', '10X', '판정(10X)', '순번', '그래프'
		    ],	//컬럼명
		    colModel:[
				{ name: '플래그',				index: 'iud',			hidden: true, },
				{ name: 'testCode',			index: 'testCode',		width: '60', 	align: "left" },
				{ name: 'gumsaName',		index: 'gumsaName',		width: '180', 	align: "left" },
				{ name: 'jundalPart',		index: 'jundalPart',	width: '80', 	align: "left" },
				{ name: 'meanValue',		index: 'meanValue',		width: '70', 	align: "left", editable: true, edittype: 'text' },
				{ name: 'sdValue',			index: 'sdValue',		width: '60', 	align: "left" },
				{ name: 'cvValue',			index: 'cvValue',		width: '60', 	align: "left" },
				{ name: 'lowValue',			index: 'lowValue',		width: '60', 	align: "left" },
				{ name: 'highValue',		index: 'highValue',		width: '60', 	align: "left" },
				{ name: 'susulValue',		index: 'susulValue',	width: '60', 	align: "left" },
				{ name: 'danui',			index: 'danui',			width: '60', 	align: "left" },
				{ name: 'startDate',		index: 'startDate',		width: '80', 	align: "left" },
				{ name: 'endDate',			index: 'endDate',		width: '80', 	align: "left" },
				{ name: 'rule12S',			index: 'rule12S',		width: '40', 	align: "center", formatter: checkBoxFormatter },
				{ name: 'gubun12S',			index: 'gubun12S',		width: '60', 	align: "left" },
				{ name: 'rule13S',			index: 'rule13S',		width: '40', 	align: "center", formatter: checkBoxFormatter },
				{ name: 'gubun13S',			index: 'gubun13S',		width: '60', 	align: "left" },
				{ name: 'rule22S',			index: 'rule22S',		width: '40', 	align: "center", formatter: checkBoxFormatter },
				{ name: 'gubun22S',			index: 'gubun22S',		width: '60', 	align: "left" },
				{ name: 'ruleR4S',			index: 'ruleR4S',		width: '40', 	align: "center", formatter: checkBoxFormatter },
				{ name: 'gubunR4S',			index: 'gubunR4S',		width: '60', 	align: "left" },
				{ name: 'rule41S',			index: 'rule41S',		width: '40', 	align: "center", formatter: checkBoxFormatter },
				{ name: 'gubun41S',			index: 'gubun41S',		width: '60', 	align: "left" },
				{ name: 'rule10X',			index: 'rule10X',		width: '40', 	align: "center", formatter: checkBoxFormatter },
				{ name: 'gubun10X',			index: 'gubun10X',		width: '60', 	align: "left" },
				{ name: 'testCodeSeq',		index: 'testCodeSeq',	width: '40', 	align: "right" },
				{ name: 'graphYN',			index: 'graphYN',		width: '40', 	align: "center", formatter: checkBoxFormatter },
		    ], //서버에서 startDate 데이터 설정
		    jsonReader: {
			     repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
			     root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
			     records:'records'  // 보여지는 데이터 개수(레코드) totalRecord 
		    },
		    height: '80%',
			loadtext : "자료 조회중입니다. 잠시만 기다리세요..." ,   // 데이터 로드중일때      
			emptyrecords: "Nothing to display",  // 데이터 없을때
			rowNum: 2000, 
			rownumbers: false,  
			multiselect: true,  // 체크 박스 생성
			multiselectWidth: 30, // 체크 박스 크기
			gridview : true,  // 선 표시 true/false 
			sortable: true,
			loadonce: true,
			loadComplete: function(data){  
				console.log(data);
			},	// loadComplete END   
			beforeSelectRow: function(rowid, e) {  // 하나의 행만 체크
				$("#list3").jqGrid('resetSelection');
				return(true);
			},
			onSelectRow: function(rowid) {
				console.log(rowid)
			}
		});
	}
});

$('#list2').jqGrid({
    url: "/qcManagementLisc100.do",	// 서버주소 
    reordercolNames:true,
    postData : { 
        type:"B",								
	}, // 보낼 파라미터
    mtype:'POST',	// 전송 타입
    datatype : "json",	// 받는 데이터 형태 
    colNames:['플래그', '검사코드', '검사명',],	//컬럼명
    colModel:[
		{ name: '플래그',				index: 'iud',			hidden: true, },
		{ name: 'testCode',			index: 'testCode',		width: '20', 	align: "left" },
		{ name: 'gumsaName',		index: 'gumsaName',		width: '60', 	align: "left" },
    ], //서버에서 startDate 데이터 설정
    jsonReader: {
	     repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
	     root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
	     records:'records'  // 보여지는 데이터 개수(레코드) totalRecord 
    },
    autowidth: true,
    autoheight: true,
	loadtext : "자료 조회중입니다. 잠시만 기다리세요..." ,   // 데이터 로드중일때      
	emptyrecords: "Nothing to display",  // 데이터 없을때
	rowNum: 2000, 
	rownumbers: false,  
	multiselect: true,  // 체크 박스 생성
	multiselectWidth: 30, // 체크 박스 크기
	gridview : true,  // 선 표시 true/false      
	sortable: true,
	loadonce: true,
	loadComplete: function(data){  
		console.log(data);
	},	// loadComplete END   
	beforeSelectRow: function(rowid, e) {  // 하나의 행만 체크
		$("#list2").jqGrid('resetSelection');
		return(true);
	},
	onSelectRow: function(rowid) {
		console.log(rowid)
	}
});

function checkBoxFormatter(cellvalue, options, rowObject) {
    if (cellvalue == 'Y') { // replace myProperty with your actual property
        // if condition is met, return disabled checkbox
        return '<input type="checkbox" checked />';
    } else {
        // else, return enabled checkbox
        return '<input type="checkbox" />';
    }
};


</script>
  </body>
</html>
