<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
<script src="https://cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>
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
                <button id="export" class="excel-btn">Excel</button>
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
    <div id="footer" class="footer">
        <div class="footer-header">
            <input type="radio" name="graph" id="regular" value="regular" checked>
            <label for="regular">정규그래프</label>
            <input type="radio" name="graph" id="actual" value="actual">
            <label for="actual">실측그래프</label>
            <button onclick="createChartRendering()" class="graph-view">그래프 표시</button>
            <button onclick="onclickPrint()" class="graph-output">그래프 출력</button>
        </div>
        <div class="chart-container" id="chart-container">
            <!-- <canvas id="myChart" style="height: 150px; width:100%;"></canvas> -->
        </div>
        
    </div>
    <!-- <script src="./js/qcResult.js" defer></script> -->
    <script>
       
        

        window.onbeforeprint = function () { 
            

            // 프린트 할 영역 필터링 
            $(".header").css("display", "none"); 
            $(".body").css("display", "none"); 
            // $(".chart-container").css("float", "left"); 
            $(".chart-container").css("overflow", "visible"); 
            $(".chart-container").css("height", "auto");
        }; 

        function onclickPrint() { 
             window.print(); 
        };
        window.onafterprint = function () { 
      
            $(".header").css("display", "block"); 

            $(".body").css("display", "block"); 
            $(".chart-container").css("display", "block"); 
            $(".chart-container").css("overflow", "auto"); 
            $(".chart-container").css("height", "165px");

  };       


        // 체크된 박스의 로우 정보들을 배열로 반환하는 함수
        const multiselectCheckboxChecked = () => {
            var obj = $("#list1");
            var idx = obj.jqGrid('getGridParam', 'selarrrow');
            const arr = new Array();
            for(var i = 0; i < idx.length;i++)
            {
                var rowData = $("#list1").jqGrid("getRowData", idx[i]);
                // console.log(rowData);
                arr.push(rowData);
            }
            return arr;
     }


     



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
                multiselect: true,
                sortable: true,
                loadonce : true,
                loadComplete: function (data) {
                    console.log(data);
                },
                onSelectRow: function (rowid) {
                    console.log(rowid);
                },
                

            });
        },
        onSelectRow: function (rowid) {
            console.log(rowid);
        }

            
        
        });

        $("#export").click(function() {
            // jqGrid의 데이터 테이블을 선택하여 table2excel 라이브러리 사용
            $("#list1").table2excel({
                name: "Worksheet Name",
                filename: "data", // 내보낼 Excel 파일명
                fileext: ".xlsx" // 파일 확장자
            });
        });
    });




    const createChartRendering = () => {
        const $chartContainer = document.getElementById('chart-container');
        $chartContainer.innerHTML = '';

        const arr = multiselectCheckboxChecked();

        console.log(arr);

        for (let i = 0; i < arr.length; i++) {
            const datatimeRegexp = /[0-9]{4}-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])/;
            const xValues = [];
            const yValues = [];

            for (const [key, value] of Object.entries(arr[i])) {
                if (!datatimeRegexp.test(key)) {
                    continue;
                }
                if(!value) continue;

                xValues.push(key);
                yValues.push(value);
            }
            // console.log(xValues);
            // console.log(yValues);
            const {lot_no, gumsa_name1} = arr[i]; 
            const name = "myChart" + i;
            // console.log(gumsa_name1);
            const chartCanvas = document.createElement('canvas');
            chartCanvas.setAttribute("id", name);
            chartCanvas.style.height = '150px';
            chartCanvas.style.width = '100%';
            $chartContainer.append(chartCanvas);

            const ctx = chartCanvas.getContext('2d');
            new Chart(ctx, {
                type: "line",
                data: {
                    labels: xValues,
                    datasets: [{
                        label: lot_no,
                        fill: false,
                        lineTension: 0,
                        backgroundColor: "rgba(0,0,255,1.0)",
                        borderColor: "rgba(0,0,255,0.1)",
                        data: yValues
                    }]
                },
                options: {
                	plugins: {
                        title: {
                            display: true,
                            text: gumsa_name1,
                            position: 'left'
                        }
                    },
                    legend: { display: false },
                    scales: {
                        yAxes: [{ ticks: { min: 0, max: 450 } }],
                    }
                }
            });
        }
    }

    </script>
</body>
</html>