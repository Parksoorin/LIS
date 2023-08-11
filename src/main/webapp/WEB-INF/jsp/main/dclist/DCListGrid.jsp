<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Reset-css -->
    <link rel="stylesheet" href="reset.css">
    <link href="./style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"> <!-- Font Awesome 아이콘 라이브러리 -->
    <style>
        .up {
            background-color: rgb(168, 199, 210); 
            position: relative;
            display: flex;
            justify-content: space-between;
            padding: 5px;
        }

        .down {
            display: flex;
            justify-content: space-between;
        }

        .footer {
            clear: both; 
            padding: 20px;
            border-top: 1px solid #ccc;
            position: relative;
            bottom: 0;
            left: 0;
            width: 49%; 
            background-color: rgb(168, 199, 210);
            font-size: small;
        }

        .grid1,
        .grid2 {
            width: 100%; 
            height: 600px; 
            box-sizing: border-box; 
            overflow: auto; 
            border: 1px solid #ccc;
            padding: 10px;
        }

        .grid2 {
        height: 100%; 
         }

        
        .tabs {
            display: flex;
            align-items: center;
            background-color: white;
            height: 25px;
            border-bottom: 1px solid #ccc;
            padding-left: 10px;
        }

        .tab {
            padding: 1px 2.5px;
            cursor: pointer;
            border: 1px solid #ccc;
            border-bottom: none;
            border-radius: 5px 5px 0 0;
            background-color: #f5f5f5;
        }

        .tab:first-child {
            margin-right: 5px;
 
        }

        .tab:last-child {
            margin-left: 5px;
            border-right: 1px solid #ccc;
        }

        
        .search-container {
            background-color: rgb(168, 199, 210); 
            padding: 10px;
            margin-top: 2px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .search-bar {
            display: flex;
            align-items: center;
            width: 100%;
        }

        .search-input {
            width: 70%;
            height: 15px;
        }

        .search-buttons {
            display: flex;
            align-items: center;
        }

        .search-buttons button {
            margin-left: 5px;
            white-space: nowrap;
        }
        
    </style>
</head>

<body>
    <div class="up">
        <div>
            <button class="btn btn-small">
                <i class="fas fa-search"></i> <!-- 조회버튼 아이콘(돋보기) -->
                조회
            </button>

            <button class="btn btn-small">
                <i class="fas fa-keyboard"></i> <!-- 입력버튼 아이콘(키보드모양) -->
                입력
            </button>

            <button class="btn btn-small">
                <i class="fas fa-trash-alt"></i> <!-- 삭제버튼 아이콘(휴지통모양) -->
                삭 제
            </button>

            <button class="btn btn-small">
                <i class="fas fa-save"></i> <!-- 저장버튼 아이콘(디스크모양) -->
                저장
            </button>

            <input type="checkbox" id="includeExpired" />
            <label for="includeExpired">사용종료 포함</label>
        </div>
        <div><button class="btn btn-small" style="float: right;">
                <i class="fas fa-door-open"></i> <!-- 닫기버튼 아이콘(문모양) -->
                닫기
            </button></div>
    </div>

    <div class="down">
        <div class="container" style="width: 49%;">
            <div class="search-container">
                <div class="search-bar">
                    <input type="text" id="searchInput" class="search-input" placeholder="검색어를 입력하세요">
                    <div class="search-buttons">
                        <button class="btn btn-small">
                            <i class="fas fa-search"></i> <!-- 돋보기 아이콘 -->
                            찾기
                        </button>

                        <button class="btn btn-small">
                            <i class="fas fa-eraser"></i> <!-- 지우기버튼 아이콘(지우개모양) -->
                            지우기
                        </button>
                    </div>
                </div>
            </div>
            <div class="grid1">
                그리드1
            </div>
        </div>
      
        <div class="container" style="width: 49%;"> 
            <div class="tabs">
                <div class="tab">
                    문서목록
                </div>
                <div class="tab">
                    파일등록
                </div>
            </div>

            <div class="search-container">
                <div class="search-bar">
                    <input type="text" id="searchInput3" class="search-input" placeholder="검색어를 입력하세요">
                    <div class="search-buttons">
                        <button class="btn btn-small">
                            <i class="fas fa-search"></i> <!-- 돋보기 아이콘 -->
                            찾기
                        </button>

                        <button class="btn btn-small">
                            <i class="fas fa-eraser"></i> <!-- 지우기버튼 아이콘(지우개모양) -->
                            지우기
                        </button>

                        <button class="btn btn-small">
                            <i class="fas fa-check"></i> <!-- 사용등록버튼 아이콘(체크모양) -->
                            사용등록
                        </button>

                        <button class="btn btn-small">
                            <i class="fas fa-times-circle" style="color: red;"></i> <!-- 사용종료버튼 아이콘(빨간색 엑스모양) -->
                            사용종료
                        </button>
                    </div>
                </div>
            </div>
            <div class="grid2">
                그리드2
            </div>
        </div>
    </div>

    <div class="footer">
        <p>a) 담당자, 과장, 실장 : 보고서에 싸인이 들어감<br>
        여러명이 담당인경우(예:CVR보고서)는 공란, 로그인 ID 자동입력됨</p>
        <p>b) 문서형식인 PDF, EXL, DOC, HTML 4가지중 하나로 입력</p>
    </div>
</body>

</html>

           


           

