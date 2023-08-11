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
              <input type="radio" name="use" id="use" />
              <label class="search-radio-label" for="use">사용</label>
              <input type="radio" name="use" id="useNot" />
              <label class="search-radio-label" for="useNot">폐기</label>
            </div>

            <div class="radio-container">
              <input type="radio" name="inOut" id="inOutAll" />
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
            <select
              class="qcQuality-select-box"
              name="qcQualityItems"
              id="qcQualityItem"
            >
              <option value="">(전체)</option>
            </select>

            <button class="btn btn-small search-btn">검색</button>
            <button class="btn btn-small clear-btn">Clear</button>
          </div>
        </div>
        
        <table id="list1" ></table>
      </div>

      <div class="search-right-box">
        <div class="search-grid-top">
          <p class="search-grid-title">검사항목 리스트</p>
          <div class="search-select-container">
            <select
              class="inspectionList-select-box"
              name="inspectionLists"
              id="inspectionList"
            >
              <option value="">(전체)</option>
            </select>

            <button class="btn btn-small search-btn">검색</button>
            <button class="btn btn-small clear-btn">Clear</button>
          </div>
        </div>
      </div>
    </div>

    <div class="result-container">
      <p class="result-title">QC품질별 검사항목 설정</p>
      <div class="result-top-box">
        <div class="result-subtop-box">
          <div class="result-option-container">
            <input
              type="checkbox"
              name="result-check-all"
              id="resultCheckAll"
            />
            <label class="result-check-all" for="resultCheckAll"
              >전체선택</label
            >

            <label class="result-label" for="qcCode">QC코드</label>
            <input
              class="result-input qcCode-input"
              id="qcCode"
              type="text"
              placeholder="Chemistry QC"
            />

            <label class="result-label" for="qcMaterialName">QC물질명</label>
            <input
              class="result-input qcMaterial-input"
              id="qcMaterialName"
              type="text"
              placeholder="BioRad Chemistry Control"
            />

            <label class="result-label" for="startDate">시작일</label>
            <input
              class="result-input"
              id="startDate"
              type="date"
              value="2016-11-01"
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
    </div>
    
<script>
$('#list1').jqGrid({
    url: "/qcManagementLisq100.do",	// 서버주소 
    reordercolNames:true,
    postData : { 
        type:"QCManagement",								
	}, // 보낼 파라미터
    mtype:'POST',	// 전송 타입
    datatype : "json",	// 받는 데이터 형태 
    colNames:['플래그', 'QC 코드','QC물질명','Lot No', 'Level', '검사파트', '시작일', '종료일', '고정검체번호',],	//컬럼명
    colModel:[
		{ name: 'iud',				index: 'iud',			width: '20', align:"center", hidden: true,
			formatter:"select", 
			formatoptions :{value:"N:불용"},
			edittype:"select", 
			editoptions: {value:"N:불용"}   
		},
		{ name: 'qcCode', 			index: 'qcCode',		width: '40', align: "left", hidden: false},
		{ name: 'qcName', 			index: 'qcName',		width: '80', align: "left" },
		{ name: 'lotNo', 			index: 'lotNo',			width: '50', align: "left" },
		{ name: 'qcLevel',			index: 'qcLevel',		width: '20', align: "left" },
		{ name: 'testPart',			index: 'testPart',		width: '60', align: "left" },
		{ name: 'startDate',		index: 'startDate',		width: '40', align: "left" },
		{ name: 'endDate',			index: 'endDate',		width: '40', align: "left" },
		{ name: 'qcSpecimenSer',	index: 'qcSpecimenSer',	width: '40', align: "left" },
    ], //서버에서 startDate 데이터 설정
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
      console.log(rowid)
  }
  
})
</script>
  </body>
</html>
