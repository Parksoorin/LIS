<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

</head>
<body>
	<div id="wrap" class="wrap">
		<div id="contents">
		<tiles:insertAttribute name="content" />
		</div>
	</div>
</body>