$('#list1').jqGrid({
    url: "<c:url value='/qcResultFindAll.do'/>",	// 서버주소 
    reordercolNames:true,
    postData : { 
             type:"A",								
     }, // 보낼 파라미터
    mtype:'POST',	// 전송 타입
    datatype : "json",	// 받는 데이터 형태 
    colNames:['','플래그','QC물질명','검사명', 'Level', 'Lot NO', 'Fixed Mean', 'FixedSD', 'Fixe...'
            ,'Cum...', 'CumSD', 'CumCV (%)', '장비명', ],	//컬럼명
    colModel:[
    {name : "컬럼이름", width:'10', index : "컬럼이름" , editable : true, edittype: 'checkbox', editoptions: { value: "Y:N", defaultValue :"Y"}},
        { name: 'iud'		  , index: 'iud'		, width: '10' , align:"center", hidden: true,
             formatter:"select", 
             formatoptions :{value:"N:불용"},
             edittype:"select", 
             editoptions: {value:"N:불용"}   
             },
         { name: 'qcName'	  , index: 'qcName'    , width: '20' ,align:"center"    , hidden: false}					,
         { name: 'gumsaName'	  , index: 'gumsaName'	, width: '20'  , align: "center" },
         { name: 'qcLevel'	  , index: 'qcLevel'    , width: '20' ,align:"center"    , hidden: false}	,
         { name: 'lotNo'	  , index: 'lotNo'    , width: '20' ,align:"center"    , hidden: false}	,
         { name: 'fixedMean'	  , index: 'fixedMean'    , width: '20' ,align:"center"    , hidden: false}	,
         { name: 'fixedSD'	  , index: 'fixedSD'    , width: '20' ,align:"center"    , hidden: false}	,
         { name: 'fixedCV'	  , index: 'fixedCV'    , width: '20' ,align:"center"    , hidden: false}	,
         { name: 'cumMean'	  , index: 'cumMean'    , width: '20' ,align:"center"    , hidden: false}	,
         { name: 'cumSD'	  , index: 'cumSD'    , width: '20' ,align:"center"    , hidden: false}	,
         { name: 'cumCV'	  , index: 'cumCV'    , width: '20' ,align:"center"    , hidden: false}	,
         { name: 'name'	  , index: 'name'    , width: '20' ,align:"center"    , hidden: false}	,
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
         console.log(rowid)
  }
})



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