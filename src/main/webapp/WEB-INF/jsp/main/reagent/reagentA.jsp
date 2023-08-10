<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 첫번째줄은 JSP 페이지의 지시어이다. 이것은 해당 JSP 페이지의 속성을 설정한다. language 속성은 페이지에서 사용할 Java 언어를 정의하며, contentType은 출력되는 콘텐츠의 유형과 문자 인코딩을 설정한다. -->
<!-- 두번째줄은 JSP 페이지에서 JSTL(Core JSP Standard Tag Library)을 사용하기 위한 태그 라이브러리를 선언하는 부분이다. JSTL은 JSP 페이지에서 반복문, 조건문 등과 같은 일반적인 로직을 처리하기 위한 태그들을 제공한다. -->
<!-- prefix는 사용할 태그의 접두사를 정의하고, uri 는 해당 태그 라이브러리의 위치를 지정한다. -->

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인</title>
  <link rel="stylesheet" type="text/css" href="/css/reagent.css" />
</head>
<body>

<div class="divAll">

    <div class="divUp">
        <div class="divUpLeft">
            <label for="part"><div class="topButton">파트</div></label>
            <select id="part" name="reagentPart">
                <option value="">전체</option>
                <option value="reagentPart1">reagentPart1</option>
                <option value="reagentPart2">reagentPart2</option>
                <option value="reagentPart3">reagentPart3</option>
            </select>

            <label for="acc"><div class="topButton">거래처</div></label>
            <select id="acc" name="account">
                <option value="">전체</option>
                <option value="account1">account1</option>
                <option value="account2">account2</option>
                <option value="account3">account3</option>
            </select>

            <label for="manu"><div class="topButton">제조사</div></label>
            <select id="manu" name="manufacturer">
                <option value="">전체</option>
                <option value="manufacturer1">manufacturer1</option>
                <option value="manufacturer2">manufacturer2</option>
                <option value="manufacturer3">manufacturer3</option>
            </select>
        </div>
        <div class="divUpRight">
            <button class="btn check"><img src="/images/icons/searchsearch.png" class="img"> 조 회</button>
            <button class="btn input"><img src="/images/icons/printer.png" class="img">입 력</button>
            <button class="btn save"><img src="/images/icons/save.png" class="img"> 저 장</button>
            <button class="btn delete"><img src="/images/icons/delete.png" class="img2">삭 제</button>
            <button class="btn excel"><img src="/images/icons/excel.png" class="img">EXCEL</button>
        </div>
    </div>

    <div class="divDown"> 
        <div class="divDownLeft">
            <div class="divDownLeftUpButton">
                <select id="search" name="searchAll" class="optionSearch">
                    <option value="" disabled selected hidden>Enter text to search</option>
                    <option value="search1">search1</option>
                    <option value="search2">search2</option>
                    <option value="search3">search3</option>
                </select>

                <button class="btn">검 색</button>
                <button class="btn">클리어</button>
            </div>
            <div class="divDownLeftList">그리드1</div>
        </div>

        <div class="divDownRight">
            <div class="divDownRightUp">
                <div class="divDownRightUpList">
                    <div class="divDownRightUpListUp">시약별 검사코드 관리</div>
                    <div class="divDownRightUpListDown">그리드2</div>
                </div>
                <div class="divDownRightUpButton">
                    <button class="btn"><img src="/images/icons/up.png" class="img1">등 록</button>
                    <button class="btn"><img src="/images/icons/down.png" class="img1">제 외</button>
                </div>
            </div>
        
            <div class="divDownRightDown">
                <div class="divDownRightDownButton">
                    <select id="search" name="searchAllRight" class="optionSearchRight">
                        <option value="" disabled selected hidden>Enter text</option>
                        <option value="search1">search1</option>
                        <option value="search2">search2</option>
                        <option value="search3">search3</option>
                    </select>
    
                    <button class="btn">검 색</button>
                    <button class="btn">클리어</button>
                </div>
                <div class="divDownRightDownList">
                    그리드3
                </div>
            </div>
        </div>
    </div>

</div>
   <script>  
   </script>
</body>
</html>


