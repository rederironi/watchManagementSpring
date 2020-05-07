<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	부가적인 테마
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 	
 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
 	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
	
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
 	
 	<title>당직 예외 설정</title>
</head>
<body>
<div>
	<%@include file="/WEB-INF/views/nav.jsp" %>
</div>
<script type="text/javascript">
	
	$(document).ready(function(){
		var formObj = $("form[name='readForm']");
		
		// 수정 
		$(".update_btn").on("click", function(){
			formObj.attr("action", "/exception/updateView");
			formObj.attr("method", "get");
			formObj.submit();				
		})
		
		// 삭제
		$(".delete_btn").on("click", function(){
			
			var deleteYN = confirm("삭제하시겠습니까?");
			if(deleteYN == true){
				
			formObj.attr("action", "/exception/delete");
			formObj.attr("method", "post");
			formObj.submit();
				
			}
		})
		
		// 목록
		$(".list_btn").on("click", function(){
			
			location.href = "/exception/list?page=${scri.page}"
					      +"&perPageNum=${scri.perPageNum}"
					      +"&searchType=${scri.searchType}&keyword=${scri.keyword}"
					      +"&searchEType=${scri.searchEType}&eTypeKeyword=${scri.eTypeKeyword}";
		})
		
	})
</script>
	<div class="container" style="margin-top:20px;">
		<header>
			<h1> 당직 예외 설정</h1>
		</header>
		<hr />
		<section id="container">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="bno" name="eno" value="${read.eno}" />
				<input type="hidden" id="page" name="page" value="${scri.page}"> 
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				<input type="hidden" id="searchEType" name="searchEType" value="${scri.searchEType}"> 
				<input type="hidden" id="eTypeKeyword" name="eTypeKeyword" value="${scri.eTypeKeyword}"> 
			</form>
			
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">구분</label>
				<select id="etype" name="etype" class="form-control" onchange="typeSelect();" disabled>
					<option value="D"<c:if test="${read.etype == 'D'}"> selected</c:if>>날짜</option>
					<option value="S"<c:if test="${read.etype == 'U'}"> selected</c:if>>사용자</option>
				</select>
			</div>
			<div class="form-group">
				<label for="content" class="col-sm-2 control-label">선택값</label>
				<c:if test="${read.etype == 'D'}">
					${read.edate}
				</c:if>
				<c:if test="${read.etype == 'U'}">
					${read.euser}
				</c:if>
			</div>
			<br /><br />
			<div class="form-group">
				<label for="content" class="col-sm-2 control-label">내용</label>
				<textarea id="content" name="content" class="form-control" readonly="readonly"><c:out value="${read.content}" /></textarea>
			</div>
			<div class="form-group">
				<label for="writer" class="col-sm-2 control-label">작성자</label>
				<input type="text" id="writer" name="writer" class="form-control" value="${read.writer}"  readonly="readonly"/>
			</div>
			<div class="form-group">
				<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
				<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />	
			</div>
			<hr>
			<div>
				<button type="button" class="update_btn btn btn-warning">수정</button>
				<button type="button" class="delete_btn btn btn-danger">삭제</button>
				<button type="button" class="list_btn btn btn-primary">목록</button>	
			</div>
		</section>
		<hr>
	</div>
</body>
</html>