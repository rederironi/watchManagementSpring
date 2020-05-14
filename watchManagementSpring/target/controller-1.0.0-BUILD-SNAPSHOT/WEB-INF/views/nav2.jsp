<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 -->

<link rel="stylesheet" href="<c:url value="/resources/css_bootstrap/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-theme.min.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.5.0.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<nav class="navbar navbar-expand-md navbar-light bg-light">
    <a href="/" class="navbar-brand">당직 관리 시스템</a>
    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div id="navbarCollapse" class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
            <li class="nav-item">
                <a href="#" class="nav-link">당직 스케줄 보기</a>
            </li>
            <li class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">당직 체크 문서 보기</a>
                <div class="dropdown-menu">
                    <a href="/board/list" class="dropdown-item">당직 체크 문서 보기</a>
                    <a href="/board/writeView" class="dropdown-item">당직 체크 문서 등록</a>
					<!--<a href="#" class="dropdown-item">Sent Items</a>
                    <div class="dropdown-divider"></div>
                    <a href="#"class="dropdown-item">Trash</a> -->
                </div>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">근무 횟수 보기</a>
            </li>
            <li class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">설정</a>
                <div class="dropdown-menu">
                    <a href="/exception/list" class="dropdown-item">당직 예외 설정</a>
                    <a href="/exception/writeView" class="dropdown-item">당직 예외 설정 등록</a>
					<!--<a href="#" class="dropdown-item">Sent Items</a>
                    <div class="dropdown-divider"></div>
                    <a href="#"class="dropdown-item">Trash</a> -->
                </div>
            </li>
        </ul>
        <ul class="nav navbar-nav ml-auto">
            <li class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">회원정보</a>
                <div class="dropdown-menu dropdown-menu-right">
		  			<c:if test="${member == null}"><a class="dropdown-item" href="/">로그인</a></c:if>
		  			<c:if test="${member == null}"><a class="dropdown-item" href="/member/register">회원가입</a></c:if>
		  			<c:if test="${member != null}"><a class="dropdown-item" href="/member/memberUpdateView">회원정보수정</a></c:if>
                    <c:if test="${member != null}">
                    	<div class="dropdown-divider"></div>
                    	<a class="dropdown-item" href="/member/logout">로그아웃</a>
                    </c:if>
                </div>
            </li>
        </ul>
    </div>
</nav>
<style>
selectbox { position: relative; width: 200px; /* 너비설정 */ border: 1px solid #999; /* 테두리 설정 */ z-index: 1; } 
selectbox:before { /* 화살표 대체 */ content: ""; position: absolute; top: 50%; right: 15px; width: 0; height: 0; margin-top: -1px; border-left: 5px solid transparent; border-right: 5px solid transparent; border-top: 5px solid #333; } 
selectbox label { position: absolute; top: 1px; /* 위치정렬 */ left: 5px; /* 위치정렬 */ padding: .8em .5em; /* select의 여백 크기 만큼 */ color: #999; z-index: -1; /* IE8에서 label이 위치한 곳이 클릭되지 않는 것 해결 */ } 
selectbox select { width: 100%; height: auto; /* 높이 초기화 */ line-height: normal; /* line-height 초기화 */ font-family: inherit; /* 폰트 상속 */ padding: .8em .5em; /* 여백과 높이 결정 */ border: 0; opacity: 0; /* 숨기기 */ filter:alpha(opacity=0); /* IE8 숨기기 */ -webkit-appearance: none; /* 네이티브 외형 감추기 */ -moz-appearance: none; appearance: none; }
</style>