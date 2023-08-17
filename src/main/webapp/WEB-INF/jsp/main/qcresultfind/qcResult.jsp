<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <!-- <script src="./js/qcResult.js" defer></script> -->
    <script>

    $(document).ready(function() {
        $.ajax({
            type: "POST",
            url: "http://localhost:8888/qcResultFindAll.do",
            dataType: "json",
            contentType : "text/plain; charset=utf-8",
            error: function() {
            console.log('통신실패!!');
            },
            success: function(data) {
            console.log("통신데이터 값 : ");
            console.log(data);
            

                    var dynamicColumns = Object.keys(data.rows[0]);
            var colNames = ['플래그'].concat(dynamicColumns);
            var colModel = [
                {
                    name: 'iud',
                    index: 'iud',
                    width: '20',
                    align: 'center',
                    hidden: true,
                    formatter: 'select',
                    formatoptions: { value: 'N:불용' },
                    edittype: 'select',
                    editoptions: { value: 'N:불용' }
                }
            ];

            // 동적 컬럼을 컬럼 모델에 추가
            for (var i = 0; i < dynamicColumns.length; i++) {
                colModel.push({
                    name: dynamicColumns[i],
                    index: dynamicColumns[i],
                    width: 20,
                    align: 'center',
                    hidden: false
                });
            }

            console.log(colNames);
            console.log(colModel);
            // jqGrid 초기화
            $("#list1").jqGrid({
                url: "http://localhost:8888/qcResultFindAll.do",	// 서버주소 
                reordercolNames:true,
                postData : { 
                    type:"A",								
                }, // 보낼 파라미터
                mtype:'POST',	// 전송 타입
                datatype : "json",	// 받는 데이터 형태 
                colNames : colNames,
                colModel : colModel,
                jsonReader: {
                    repeatitems: false,
                    root: 'rows',
                    records: 'records'
                },
                autowidth: true,
                shrinkToFit: true,
                height: 'auto',
                loadtext: '자료 조회중입니다. 잠시만 기다리세요...',
                emptyrecords: 'Nothing to display',
                rowNum: -1,
                rownumbers: true,
                gridview: true,
                loadComplete: function (data) {
                    console.log(data);
                },
                onSelectRow: function (rowid) {
                    console.log(rowid);
                }
            });
        },
        onSelectRow: function (rowid) {
            console.log(rowid);
        }

                


        
        });
    });



//       $('#list1').jqGrid({
//     url: "http://localhost:8888/qcResultFindAll.do",
//     mtype: 'POST',
//     datatype: 'json',
//     jsonReader: {
//         repeatitems: false,
//         root: 'rows',
//         records: 'records'
//     },
//     loadComplete: function (data) {
//         console.log(data);

//         var dynamicColumns = Object.keys(data.rows[0]);
//         var colNames = ['플래그'].concat(dynamicColumns);
//         var colModel = [
//             {
//                 name: 'iud',
//                 index: 'iud',
//                 width: '20',
//                 align: 'center',
//                 hidden: true,
//                 formatter: 'select',
//                 formatoptions: { value: 'N:불용' },
//                 edittype: 'select',
//                 editoptions: { value: 'N:불용' }
//             }
//         ];

//         // 동적 컬럼을 컬럼 모델에 추가
//         for (var i = 0; i < dynamicColumns.length; i++) {
//             colModel.push({
//                 name: dynamicColumns[i],
//                 index: dynamicColumns[i],
//                 width: 20,
//                 align: 'center',
//                 hidden: false
//             });
//         }

//         // jqGrid 초기화
//         $("#list1").jqGrid({
//             colNames: colNames,
//             colModel: colModel,
//             jsonReader: {
//                 repeatitems: false,
//                 root: 'rows',
//                 records: 'records'
//             },
//             autowidth: true,
//             shrinkToFit: true,
//             height: 'auto',
//             loadtext: '자료 조회중입니다. 잠시만 기다리세요...',
//             emptyrecords: 'Nothing to display',
//             rowNum: -1,
//             rownumbers: true,
//             gridview: true,
//             loadComplete: function (data) {
//                 console.log(data);
//             },
//             onSelectRow: function (rowid) {
//                 console.log(rowid);
//             }
//         });
//     },
//     onSelectRow: function (rowid) {
//         console.log(rowid);
//     }
// });

// setTimeout(function() {$("#list").jqGrid('setGridParam',{datatype:'json'}); },50);
    // colNames:['','플래그','QC물질명','검사명', 'Level', 'Lot NO', 'Fixed Mean', 'FixedSD', 'Fixe...'
    //         ,'Cum...', 'CumSD', 'CumCV (%)', '장비명', ],	//컬럼명
    // colModel:[
    // {name : "컬럼이름", width:'10', index : "컬럼이름" , editable : true, edittype: 'checkbox', editoptions: { value: "Y:N", defaultValue :"Y"}},
    //     { name: 'iud'		  , index: 'iud'		, width: '10' , align:"center", hidden: true,
    //          formatter:"select", 
    //          formatoptions :{value:"N:불용"},
    //          edittype:"select", 
    //          editoptions: {value:"N:불용"}   
    //          },
    //      { name: 'qcName'	  , index: 'qcName'    , width: '20' ,align:"center"    , hidden: false}					,
    //      { name: 'gumsaName'	  , index: 'gumsaName'	, width: '20'  , align: "center" },
    //      { name: 'qcLevel'	  , index: 'qcLevel'    , width: '20' ,align:"center"    , hidden: false}	,
    //      { name: 'lotNo'	  , index: 'lotNo'    , width: '20' ,align:"center"    , hidden: false}	,
    //      { name: 'fixedMean'	  , index: 'fixedMean'    , width: '20' ,align:"center"    , hidden: false}	,
    //      { name: 'fixedSD'	  , index: 'fixedSD'    , width: '20' ,align:"center"    , hidden: false}	,
    //      { name: 'fixedCV'	  , index: 'fixedCV'    , width: '20' ,align:"center"    , hidden: false}	,
    //      { name: 'cumMean'	  , index: 'cumMean'    , width: '20' ,align:"center"    , hidden: false}	,
    //      { name: 'cumSD'	  , index: 'cumSD'    , width: '20' ,align:"center"    , hidden: false}	,
    //      { name: 'cumCV'	  , index: 'cumCV'    , width: '20' ,align:"center"    , hidden: false}	,
    //      { name: 'name'	  , index: 'name'    , width: '20' ,align:"center"    , hidden: false}	,
    //      ], //서버에서 받은 데이터 설정
//     jsonReader: {
//          repeatitems: false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
//          root:'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
//          records:'records'  // 보여지는 데이터 갯수(레코드) totalRecord 
//     },
//     autowidth: true,
//     shrinkToFit: true,
//     height: "auto",//테이블의 세로 크기, Grid의 높이         
//   loadtext : "자료 조회중입니다. 잠시만 기다리세요..." ,   // 데이터 로드중일때      
//   emptyrecords: "Nothing to display",  // 데이터없을떄
//   rowNum:-1, 
//   rownumbers: true,         
//   gridview : true,  // 선표시 true/false         
//   loadComplete: function(data){  
//       console.log(data);
//       console.log(data.rows[0]);
//       var dynamicColumns = Object.keys(data.rows[0]);
//       console.log(dynamicColumns);

//       var colNames = ['', '플래그', 'QC물질명', '검사명', 'Level', 'Lot NO', 'Fixed Mean', 'FixedSD', 'Fixe...'
//                 , 'Cum...', 'CumSD', 'CumCV (%)', '장비명'].concat(dynamicColumns);
//       var colModel = [
//     {name : "컬럼이름", width:'10', index : "컬럼이름" , editable : true, edittype: 'checkbox', editoptions: { value: "Y:N", defaultValue :"Y"}},
//         { name: 'iud'		  , index: 'iud'		, width: '10' , align:"center", hidden: true,
//              formatter:"select", 
//              formatoptions :{value:"N:불용"},
//              edittype:"select", 
//              editoptions: {value:"N:불용"}   
//              },
//          { name: 'qc_name'	  , index: 'qc_name'    , width: '20' ,align:"center"    , hidden: false}					,
//          { name: 'gumsa_name1'	  , index: 'gumsa_name1'	, width: '20'  , align: "center" },
//          { name: 'qc_level'	  , index: 'qc_level'    , width: '20' ,align:"center"    , hidden: false}	,
//          { name: 'lot_no'	  , index: 'lot_no'    , width: '20' ,align:"center"    , hidden: false}	,
//          { name: 'fixedMean'	  , index: 'FixedMean'    , width: '20' ,align:"center"    , hidden: false}	,
//          { name: 'fixedSD'	  , index: 'fixedSD'    , width: '20' ,align:"center"    , hidden: false}	,
//          { name: 'fixedCV'	  , index: 'fixedCV'    , width: '20' ,align:"center"    , hidden: false}	,
//          { name: 'CumMean'	  , index: 'CumMean'    , width: '20' ,align:"center"    , hidden: false}	,
//          { name: 'CumSD'	  , index: 'CumSD'    , width: '20' ,align:"center"    , hidden: false}	,
//          { name: 'CumCV'	  , index: 'CumCV'    , width: '20' ,align:"center"    , hidden: false}	,
//          { name: 'name'	  , index: 'name'    , width: '20' ,align:"center"    , hidden: false}	,
//          ];

//           // 동적 컬럼을 컬럼 모델에 추가
//           for (var i = 0; i < dynamicColumns.length; i++) {
//                 colModel.push({
//                     name: dynamicColumns[i],
//                     index: dynamicColumns[i],
//                     width: 20,
//                     align: "center",
//                     hidden: false
//                 });
//             }

//             setTimeout(function() {
//             $("#list1").jqGrid('GridUnload');
//              // jqGrid 초기화
//              $("#list1").jqGrid({
//                 colNames: colNames,
//                 colModel: colModel,
//                 // ... 다른 옵션들 ...
                
//                 });

//             }, 2000);


//   },	// loadComplete END   
//   onSelectRow: function(rowid) {
//          console.log(rowid)
//   }
// })



const xValues = [50,60,70,80,90,100,110,120,130,140,150];
const yValues = [7,8,8,9,9,9,10,11,14,14,15];

new Chart("myChart", {
type: "line",
data: {
    labels: xValues,
    datasets: [{
    fill: false,
    lineTension: 0,
    backgroundColor: "rgba(0,0,255,1.0)",
    borderColor: "rgba(0,0,255,0.1)",
    data: yValues
    }]
},
options: {
    legend: {display: false},
    scales: {
    yAxes: [{ticks: {min: 6, max:16}}],
    }
}
});

    </script>
</body>
</html>