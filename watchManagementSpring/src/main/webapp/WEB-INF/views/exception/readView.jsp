<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 	<title>당직 예외 설정</title>
</head>
<body>
<div id="wrapper">
	<%@include file="/WEB-INF/views/nav.jsp" %>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
                        <h3 class="panel-title"> 당직 예외 설정</h3>
                    </div>
		           <div class="card">
		               <div class="card-header card-header-primary">
		                   <h4 class="card-title"><i class="fas fa-square"></i> 당직 예외 설정 보기</h4>
		                   <p class="card-catagory"></p>
		               </div>
		               <div class="card-body">
		               		<div class="table-responsive">
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
								<c:out value="${read.content}" />
							</div>
							<div class="form-group">
								<label for="writer" class="col-sm-2 control-label">작성자</label>
								<c:out value="${read.writer}" />
							</div>
							<div class="form-group">
								<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
								<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />	
							</div>       
			               </div>
			           </div>
			           
			            <div class="text-center mt-3" style="margin-bottom:10px;">
					        <button type="button" class="update_btn btn btn-primary">수정</button>
					        <button type="button" class="delete_btn btn btn-danger">삭제</button>
							<button type="button" class="list_btn btn btn-default">목록</button>	
					    </div>
					</div>
				</div>
			</div>
		 </div>
	</div>
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
</body>
</html>