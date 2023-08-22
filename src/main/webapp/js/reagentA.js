$('#list1').jqGrid(
				{
					url : "/reagentA.do", // 서버주소 
					reordercolNames : true,
					postData : {
						type : "listData",
					}, // 보낼 파라미터`
					mtype : 'POST', // 전송 타입
					datatype : "json", // 받는 데이터 형태 
					colNames : [ '제품코드', '제품명', '파트', '물품구분', '규격', '입고단위',
							'출고단위', '환산수량', '입고바코드', '출고단위별출력', '창고바코드',
							'창고출고단위', '사용등록바코드', '유효기간', '개봉유효기간', '보관방법',
							'개봉후보관방법', '거래처명', '제조사코드(명)', '바코드', '단가',
							'Lot no', '적용일', '불용일', '병원코드' ], //컬럼명
					colModel : [ {
						name : 'testCode',
						index : 'testCode',
						width : '75',
						align : "center",
						hidden : false
					}, {
						name : 'testName',
						index : 'testName',
						width : '100',
						align : "center",
						hidden : false
					}, {
						name : 'jundalPart',
						index : 'jundalPart',
						width : '100',
						align : "center"
					}, {
						name : 'testGubun',
						index : 'testGubun',
						width : '100',
						align : "center"
					}, {
						name : 'kukuk',
						index : 'kukuk',
						width : '100',
						align : "center"
					}, {
						name : 'inDanui',
						index : 'inDanui',
						width : '100',
						align : "center"
					}, {
						name : 'outDanui',
						index : 'outDanui',
						width : '100',
						align : "center"
					}, {
						name : 'changeQty',
						index : 'changeQty',
						width : '100',
						align : "center"
					}, {
						name : 'barcodeInYn',
						index : 'barcodeInYn',
						width : '100',
						align : "center"
					}, {
						name : 'barcodeDiv',
						index : 'barcodeDiv',
						width : '100',
						align : "center"
					}, {
						name : 'barcodeStoreYn',
						index : 'barcodeStoreYn',
						width : '100',
						align : "center"
					}, {
						name : 'storeDanui',
						index : 'storeDanui',
						width : '100',
						align : "center"
					}, {
						name : 'barcodeOutYn',
						index : 'barcodeOutYn',
						width : '100',
						align : "center"
					}, {
						name : 'expDay',
						index : 'expDay',
						width : '100',
						align : "center"
					}, {
						name : 'expOpenDay',
						index : 'expOpenDay',
						width : '100',
						align : "center"
					}, {
						name : 'keepName',
						index : 'keepName',
						width : '100',
						align : "center"
					}, {
						name : 'KeepOpenName',
						index : 'KeepOpenName',
						width : '100',
						align : "center"
					}, {
						name : 'supplierName',
						index : 'supplierName',
						width : '100',
						align : "center"
					}, {
						name : 'jejoName',
						index : 'jejoName',
						width : '100',
						align : "center"
					}, {
						name : 'barcode',
						index : 'barcode',
						width : '100',
						align : "center"
					}, {
						name : 'danga',
						index : 'danga',
						width : '100',
						align : "center"
					}, {
						name : 'lotNo',
						index : 'lotNo',
						width : '100',
						align : "center"
					}, {
						name : 'startDate',
						index : 'startDate',
						width : '100',
						align : "center"
					}, {
						name : 'endDate',
						index : 'endDate',
						width : '100',
						align : "center"
					}, {
						name : 'hospitalCode',
						index : 'hospitalCode',
						width : '100',
						align : "center"
					} ], //서버에서 받은 데이터 설정
					// 그리드의 각 열의 모델을 설정한다. 각 열의 너비와 정렬 방식 등이 지정되어 있다.
					// 서버에서 받은 데이터 설정
					jsonReader : { // 서버에서 받은 JSON 데이터를 어떻게 읽을 것인지 설정한다. 'root'는 실제 데이터가 들어있는 배열의 이름을 나타낸다.
						repeatitems : false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
						root : 'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
						records : 'records' // 보여지는 데이터 갯수(레코드) totalRecord 
					},
					shrinkToFit : true, // 그리드의 컬럼들을 그리드 너비에 맞게 자동으로 조절할지 여부를 설정한다.
					height : "auto", // Grid의 높이를 자동으로 조정한다.    
					loadtext : "자료 조회중입니다. 잠시만 기다리세요...", // 데이터 로드중일때 표시될 메시지를 설정한다.     
					emptyrecords : "Nothing to display", // 데이터가 없을떄 표시될 메시지를 설정한다.
					rowNum : 5000, // 한 페이지에 보여줄 행의 개수를 설정한다. -1로 설정하면 모든 행을 한번에 보여준다.
					rownumbers : true, // 각 행의 번호를 표시할지 여부를 설정한다.    
					gridview : true, // 그리드를 선표시할지 여부를 설정한다. true/false         
					loadComplete : function(data) { // 데이터 로드가 완료되었을 때 실행될 함수를 설정한다. 
						console.log(data);
					}, // loadComplete END   
					onSelectRow : function(rowid) { // 행이 선택될 때 실행될 함수를 설정한다.
						
						var listData =  $('#list1').jqGrid('getRowData', rowid).testCode;
						
						console.log(listData) 
// 						console.log(rowid) // 현재 선택된 행의 ID를 콘솔에 출력하고 있다.
						
						$("#list2").jqGrid("GridUnload"); // 첫 번째 조회했던 그 값으로만 조회될 때 초기화
						grid2(listData);
						
					}

				})
				

		var grid2 = function(data) {$('#list2').jqGrid({
			url : "/reagentA2.do", // 서버주소 
			reordercolNames : true,
			postData : {
				listData : data,
			}, // 보낼 파라미터
			mtype : 'POST', // 전송 타입
			datatype : "json", // 받는 데이터 형태 
			colNames : [ '검사코드', '검사명' ], //컬럼명
			colModel : [ {
				name : 'testCode',
				index : 'testCode',
				width : '20',
				align : "center",
				hidden : false
			}, {
				name : 'gumsaName',
				index : 'gumsaName',
				width : '20',
				align : "center",
				hidden : false
			} ], //서버에서 받은 데이터 설정
			// 그리드의 각 열의 모델을 설정한다. 각 열의 너비와 정렬 방식 등이 지정되어 있다.
			// 서버에서 받은 데이터 설정
			jsonReader : { // 서버에서 받은 JSON 데이터를 어떻게 읽을 것인지 설정한다. 'root'는 실제 데이터가 들어있는 배열의 이름을 나타낸다.
				repeatitems : false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
				root : 'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
				records : 'records' // 보여지는 데이터 갯수(레코드) totalRecord 
			},
			multiselect: true, // 체크박스 만들어줌.
			autowidth : true, // 그리드의 너비를 자동으로 조정할지 여부를 설정한다.
			shrinkToFit : true, // 그리드의 컬럼들을 그리드 너비에 맞게 자동으로 조절할지 여부를 설정한다.
			height : "auto", // Grid의 높이를 자동으로 조정한다.    
			loadtext : "자료 조회중입니다. 잠시만 기다리세요...", // 데이터 로드중일때 표시될 메시지를 설정한다.     
			emptyrecords : "Nothing to display", // 데이터가 없을떄 표시될 메시지를 설정한다.
			rowNum : 5000, // 한 페이지에 보여줄 행의 개수를 설정한다. 
			rownumbers : true, // 각 행의 번호를 표시할지 여부를 설정한다.    
			gridview : true, // 그리드를 선표시할지 여부를 설정한다. true/false   
			loadonce:false,
			loadComplete : function(data) { // 데이터 로드가 완료되었을 때 실행될 함수를 설정한다. 
				console.log(data);
			}, // loadComplete END   
			onSelectRow : function(rowid) { // 행이 선택될 때 실행될 함수를 설정한다.
// 				console.log(rowid) // 현재 선택된 행의 ID를 콘솔에 출력하고 있다.
			}

		})
		}

		$('#list3').jqGrid({
			url : "/reagentA3.do", // 서버주소 
			reordercolNames : true, // 열 제목을 재정렬할 수 있는지 여부를 나타낸다.
			postData : {
				type : "C",
			}, // 보낼 파라미터
			mtype : 'POST', // 전송 타입
			datatype : "json", // 받는 데이터 형태 
			colNames : [ '검사코드', '검사명' ], // 그리드의 각 열의 제목을 설정한다.
			colModel : [ {
				name : 'testCode',
				index : 'testCode',
				width : '100',
				align : "center",
				hidden : false
			}, {
				name : 'gumsaName',
				index : 'gumsaName',
				width : '100',
				align : "center",
				hidden : false
			} ],
			// formatter: 'checkbox'는 해당 열이 체크박스 형태로 표시됨을 나타내며, formatoptions: { disabled: false }는 체크박스를 활성화 상태로 표시하도록 설정한 것.
			// 그리드의 각 열의 모델을 설정한다. 각 열의 너비와 정렬 방식 등이 지정되어 있다.
			// 서버에서 받은 데이터 설정
			jsonReader : { // 서버에서 받은 JSON 데이터를 어떻게 읽을 것인지 설정한다. 'root'는 실제 데이터가 들어있는 배열의 이름을 나타낸다.
				repeatitems : false, //서버에서 받은 data와 Grid 상의 column 순서를 맞출것인지?
				root : 'rows', //서버의 결과 내용에서 데이터를 읽어오는 기준점
				records : 'records' // 보여지는 데이터 갯수(레코드) totalRecord 
			},
			multiselect: true, // 체크박스 만들어줌.
			autowidth : true, // 그리드의 너비를 자동으로 조정할지 여부를 설정한다.
			shrinkToFit : true, // 그리드의 컬럼들을 그리드 너비에 맞게 자동으로 조절할지 여부를 설정한다.
			height : "auto", // Grid의 높이를 자동으로 조정한다.    
			loadtext : "자료 조회중입니다. 잠시만 기다리세요...", // 데이터 로드중일때 표시될 메시지를 설정한다.     
			emptyrecords : "Nothing to display", // 데이터가 없을떄 표시될 메시지를 설정한다.
			rowNum : 5000, 
			rownumbers : true, // 각 행의 번호를 표시할지 여부를 설정한다.    
			gridview : true, // 그리드를 선표시할지 여부를 설정한다. true/false         
			loadComplete : function(data) { // 데이터 로드가 완료되었을 때 실행될 함수를 설정한다. 
// 				console.log(data);
			}, // loadComplete END   
			onSelectRow : function(rowid) { // 행이 선택될 때 실행될 함수를 설정한다.
				console.log(rowid) // 현재 선택된 행의 ID를 콘솔에 출력하고 있다.
			}

		})
		
		
		
		// addListData() 함수 정의, list1 열 추가	
		function addListData() {
			
			// jqGrid에 데이터 추가
			var grid = $('#list1');
			
			// 새로운 행의 ID 계산
			var newRowId = grid.jqGrid('getGridParam', 'records') + 1; 
			
			// 빈 객체로 시작
			var newData = {};
			
// 			console.log(newRowId);
			
			// jqGrid에 빈 데이터로 행 추가
			grid.jqGrid('addRowData', newRowId, newData);
			
			// 행을 편집 모드로 변경
			grid.jqGrid('editRow', newRowId, true);
			
			// 새로운 행 선택
			grid.setSelection(newRowId, true);
			
// 			console.log("New row added", newData);
		}	
			

		// deleteListData() 함수 정의, list1 열 삭제
		function deleteListData() {
			var grid = $('#list1');
			var selectedRowId = grid.jqGrid('getGridParam', 'selrow');
			
			if (selectedRowId) {
				// 선택된 행이 있다면 해당 행을 삭제
				grid.jqGrid('delRowData', selectedRowId);
				console.log("Row deleted: ", selectedRowId);
			} else {
				console.log("No row selected for deletion.");
			}
		}
		
		
		// list1 EXCEL 파일
		function saveExcel() {
			var grid = $('#list1');
		    var rowDataArray = [];

		 // 모든 데이터의 row ID 가져오기
		    var rowIds = grid.jqGrid('getDataIDs'); 
		 
		    for (var i = 0; i < rowIds.length; i++) {
		        var rowId = rowIds[i];
		        
		     	// 특정 row의 데이터 가져오기
		        var rowData = grid.jqGrid('getRowData', rowId); 
		        rowDataArray.push(rowData);
		    }

		 	// JSON 데이터를 엑셀 시트로 변환
		    var worksheet = XLSX.utils.json_to_sheet(rowDataArray); 

		 	// 엑셀 워크북 생성
		    var wb = XLSX.utils.book_new(); 
		 	// 시트를 워크북에 추가
		    XLSX.utils.book_append_sheet(wb, worksheet, 'Sheet1'); 

		    // 엑셀 파일 생성
		    var excelBuffer = XLSX.write(wb, { bookType: 'xlsx', type: 'array' });
		    var blob = new Blob([excelBuffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });

		    // 엑셀 파일 다운로드 링크 생성
		    var fileName = "list1.xlsx";
		    var downloadLink = document.createElement("a");
		    downloadLink.href = URL.createObjectURL(blob);
		    downloadLink.download = fileName;
		    downloadLink.click();
		}
		
		
		let data = [];
		
		// 조회 기능(클라이언트 측에서만 처리)
		function chooseSearch() {
		    var selectedPart = $('#part').val();        // 선택된 파트 값 가져오기
		    var selectedAccount = $('#acc').val();      // 선택된 거래처 값 가져오기
		    var selectedManufacturer = $('#manu').val(); // 선택된 제조사 값 가져오기
		
		    // 기존의 jqGrid 데이터를 가져옴
		    var rowDataArray = [];
			var grid = $("#list1"); // jqGrid의 ID를 사용하여 그리드 요소를 선택
			
			var rowIds = grid.jqGrid('getDataIDs'); // 모든 행의 ID를 가져옴
			
			for (var i = 0; i < rowIds.length; i++) {
			    var rowData = grid.jqGrid('getRowData', rowIds[i]); // 각 행의 데이터를 가져옴
			    rowDataArray.push(rowData);
			}
			console.log(rowDataArray);
			if(data.length==0){
				data = [...rowDataArray];
			}
			console.log('data----');
			console.log(data);
		
		    // 선택된 카테고리에 따라 데이터 필터링
		    var filteredData = data.filter(function(item) {
				console.log(item.jejoName);
				
				
		        return (!selectedPart || item.jundalPart === selectedPart) &&
		               (!selectedAccount || item.supplierName === selectedAccount) &&
		               (!selectedManufacturer || item.jejoName === selectedManufacturer);
		    });
		
			console.log(filteredData);
		    // jqGrid의 setGridParam 메서드를 사용하여 데이터를 업데이트
		    $("#list1").jqGrid("clearGridData");
		    $("#list1").jqGrid("setGridParam", {
		        datatype: "local",
		        data: filteredData
		    }).trigger("reloadGrid");
		}
		
	
		
		// 검색기능
		/*
		function wantSearch1() {
	    var keyword = $('input[name="search_name"]').val();  // 입력된 키워드 가져오기
	    console.log(keyword);
	    if (keyword) {
	        var postData = {
	            data: keyword,
	            searchType: 'SearchType',  // 검색 유형에 맞게 설정
	            rows: $("[title='Records per Page']").val()
	        };
	
	        // 기존의 jqGrid 데이터를 초기화
	        $("#list1").jqGrid("clearGridData", true);
	
	        // jqGrid의 setGridParam 메서드를 사용하여 검색 조건 및 데이터를 설정하고 그리드를 다시 로드
	        $("#list1").jqGrid("setGridParam", {
		            datatype: "json",
		            postData: postData,
		            loadComplete: function(data) {
		                console.log(data);  // 로드가 완료된 후 실행될 코드
		            }
		        }).trigger("reloadGrid");
		    } else {
		        // 키워드가 없을 때, 모든 데이터 보여주기
		        $("#list1").jqGrid("setGridParam", { search: false, postData: { filters: '' } }).trigger("reloadGrid");
		    }
		}
		*/
				
		

		// saveListData() 함수 정의
		function saveListData() {

			// list3에서 체크된 행의 ID(인덱스) 배열을 가져온다.
			var selectedRows = $('#list3').jqGrid('getGridParam', 'selarrrow');

// 			console.log(selectedRows);
			
			// 가져온 행 데이터를 list2 jqGrid에 추가
			for (var i = 0; i < selectedRows.length; i++) {
				
				// selectedRows[i] => 현재 선택된 행의 ID를 가져온다.
				var rowId = selectedRows[i];
				
				// list3에서 해당 행의 데이터를 가져온다. 가져온 데이터는 'rowData' 변수에 저장된다.
				var rowData = $('#list3').jqGrid('getRowData', rowId);
// 				console.log(rowData);
				// list2에 가져온 데이터를 추가한다.
				// 'addRowData'함수는 새로운 행을 그리드에 추가하는 함수
				// rowData의 내용이 새로운 행으로 추가된다.
				$('#list2').jqGrid('addRowData', undefined, rowData);
			}
		}
		
		// deleteListData2() 함수 정의, list2,3 내용 삭제
		function deleteListData2() {
			// list2 에서 체크된 행의 ID(인덱스) 배열을 가져온다.
			var selectedRows = $('#list2').jqGrid('getGridParam', 'selarrrow');
			
			// 가져온 행 데이터를 list2 jqGrid에서 삭제
			for (var i = 0; i < selectedRows.length; i++) {
				// selectedRows[i] => 현재 선택된 행의 ID를 가져온다.
				var rowId = selectedRows[i];
				
 				// list2 에서 해당 행을 삭제한다.
				$('#list2').jqGrid('delRowData', rowId);
			}
		}