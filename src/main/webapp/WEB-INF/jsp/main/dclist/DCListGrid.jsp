<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/css/DCListGrid.css" />
    <style>
        .up {
            border-radius: 4px;
            padding: 5px;
            border: 1px solid #DADADA;
            background: rgb(168, 199, 210);
        }

        .down {
            display: flex;
            justify-content: space-between;
        }

         .footer {
            clear: both; 
            padding: 20px;
            border-top: 1px solid #ccc;
            text-align: left; 
            position: relative;
            bottom: 0;
            left: 0;
            width: 49%; 
            height: 50px;
            background-color: rgb(168, 199, 210);
            font-size: 10px;
            overflow: hidden;
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
            height:95%; 
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
            height: 22px;
        }

        .search-buttons {
            display: flex;
            align-items: center;
        }

        .search-buttons button {
            margin-left: 5px;
            white-space: nowrap;
        }


        .img::before {
            content: "";
            display: inline-block;
            width: 16px;
            height: 16px;
            background: url(/images/icons/searchsearch.png) no-repeat center / contain;
            margin-right: 5px;
            vertical-align: middle;
        }

        .img2::before {
            content: "";
            display: inline-block;
            width: 16px;
            height: 16px;
            background: url(/images/icons/add.png) no-repeat center / contain;
            margin-right: 5px;
            vertical-align: middle;
        }
        
        .img3::before {
            content: "";
            display: inline-block;
            width: 16px;
            height: 16px;
            background: url(/images/icons/delete.png) no-repeat center / contain;
            margin-right: 5px;
            vertical-align: middle;
        }
        
        .img4::before {
            content: "";
            display: inline-block;
            width: 16px;
            height: 16px;
            background: url(/images/icons/collect.png) no-repeat center / contain;
            margin-right: 5px;
            vertical-align: middle;
        }
        
        .img5::before {
            content: "";
            display: inline-block;
            width: 16px;
            height: 16px;
            background: url(/images/icons/garbage.png) no-repeat center / contain;
            margin-right: 5px;
            vertical-align: middle;
        }
        
         .img6::before {
            content: "";
            display: inline-block;
            width: 16px;
            height: 16px;
            background: url(/images/icons/save.png) no-repeat center / contain;
            margin-right: 5px;
            vertical-align: middle;
        }
        
        .img7::before {
            content: "";
            display: inline-block;
            width: 16px;
            height: 16px;
            background: url(/images/icons/exit.png) no-repeat center / contain;
            margin-right: 5px;
            vertical-align: middle;
        }
        
        .img8::before {
            content: "";
            display: inline-block;
            width: 16px;
            height: 16px;
            background: url(/images/icons/key.png) no-repeat center / contain;
            margin-right: 5px;
            vertical-align: middle;
        }
        
        .img9::before {
            content: "";
            display: inline-block;
            width: 16px;
            height: 16px;
            background: url(/images/icons/close.png) no-repeat center / contain;
            margin-right: 5px;
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <div class="up">
        <div>
            <button class="btn-sec check"><span class="img4"></span> 조 회</button>
            <button class="btn-sec input"><span class="img8"></span> 입 력</button>
            <button class="btn-sec delete"><span class="img5"></span> 삭 제</button>
            <button class="btn-sec save"><span class="img6"></span> 저 장</button>
            <input type="checkbox" id="includeExpired" />
            <label for="includeExpired">사용종료 포함</label>
            <button class="btn-sec close" style="float:right"><span class="img9"></span> 닫 기</button>
        </div>
    </div>

    <div class="down">
        <div class="container" style="width: 49%;">
            <div class="search-container">
                <div class="search-bar">
                    <input type="text" id="searchInput" class="search-input" placeholder="검색어를 입력하세요">
                    <div class="search-buttons">
                        <button class="btn-sec check"><span class="img"></span> 찾기</button>
                        <button class="btn-sec check"><span class="img3"></span> 지우기</button>
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
                       <button class="btn-sec check"><span class="img"></span> 찾기</button>
                        <button class="btn-sec check"><span class="img3"></span> 지우기</button>
                        <button class="btn-sec input"><span class="img2"></span> 사용등록</button>
                       <button class="btn-sec input"><span class="img7"></span> 사용종료</button>
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