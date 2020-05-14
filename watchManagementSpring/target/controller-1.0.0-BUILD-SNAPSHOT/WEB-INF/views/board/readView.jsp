<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 	<title>당직 체크 문서</title>
</head>
<body>
<div id="wrapper">
	<%@include file="/WEB-INF/views/nav.jsp" %>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
                        <h3 class="panel-title"> 당직 체크 문서</h3>
                    </div>
		           <div class="card">
		               <div class="card-header card-header-primary">
		                   <h4 class="card-title"><i class="fas fa-square"></i> 당직 체크 문서 보기</h4>
		                   <p class="card-catagory"></p>
		               </div>
		               <div class="card-body">
		               		<div class="table-responsive">
		               		<form name="readForm" role="form" method="post">
								<input type="hidden" id="bno" name="bno" value="${read.bno}" />
								<input type="hidden" id="page" name="page" value="${scri.page}"> 
								<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
								<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
								<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
								<input type="hidden" id="FILE_NO" name="FILE_NO" value=""> 
							</form>
								<div class="form-group">
									<label for="title" class="col-sm-2 control-label">제목</label>
									<c:out value="${read.title}" />
								</div>
								<div class="form-group">
									<label for="content" class="col-sm-2 control-label">내용</label>
									<div style="min-height:100px;display:block;"><c:out value="${read.content}" /></div>
								</div>
								<div class="form-group">
									<label for="writer" class="col-sm-2 control-label">작성자</label>
									<c:out value="${read.writer}" />
								</div>
								<div class="form-group">
									<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
									<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
								</div>
								<hr>
								<span>파일 목록</span>
								<div class="form-group" style="border: 1px solid #dbdbdb;">
									<c:forEach var="file" items="${file}">
										<a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
									</c:forEach>
								</div>
								<div class="text-center mt-3" style="margin-bottom:10px;">
							        <button type="button" class="update_btn btn btn-primary">수정</button>
							        <button type="button" class="delete_btn btn btn-danger">삭제</button>
									<button type="button" class="list_btn btn btn-default">목록</button>	
							    </div>
								
								<!-- 댓글 -->
								<div id="reply">
									<ol class="replyList">
										<c:forEach items="${replyList}" var="replyList">
											<li>
												<p>
												작성자 : ${replyList.writer}<br />
												작성 날짜 :  <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" />
												</p>
												  
												<p>${replyList.content}</p>
												<div>
													<button type="button" class="replyUpdateBtn btn btn btn-primary" data-rno="${replyList.rno}">수정</button>
													<button type="button" class="replyDeleteBtn btn btn btn-danger" data-rno="${replyList.rno}">삭제</button>
												</div>
											</li>
										</c:forEach>   
									</ol>
								</div>
							</div>
						</div>
						<form name="replyForm" method="post" class="form-horizontal">
							<input type="hidden" id="bno" name="bno" value="${read.bno}" />
							<input type="hidden" id="page" name="page" value="${scri.page}"> 
							<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
							<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
							<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
						
							<div class="form-group">
								<label for="writer" class="col-sm-2 control-label">댓글 작성자</label>
								<div class="col-sm-10">
									<input type="text" id="writer" name="writer" class="form-control" readonly value="${read.writer}" />
								</div>
							</div>
							
							<div class="form-group">
								<label for="content" class="col-sm-2 control-label">댓글 내용</label>
								<div class="col-sm-10">
									<input type="text" id="content" name="content" class="form-control"/>
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="button" class="replyWriteBtn btn btn-success">작성</button>
								</div>
							</div>
						</form>
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
			formObj.attr("action", "/board/updateView");
			formObj.attr("method", "get");
			formObj.submit();				
		})
		
		// 삭제
		$(".delete_btn").on("click", function(){
			
			var deleteYN = confirm("삭제하시겠습니까?");
			if(deleteYN == true){
				
			formObj.attr("action", "/board/delete");
			formObj.attr("method", "post");
			formObj.submit();
				
			}
		})
		
		// 목록
		$(".list_btn").on("click", function(){
			
			location.href = "/board/list?page=${scri.page}"
					      +"&perPageNum=${scri.perPageNum}"
					      +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
		})
		
		$(".replyWriteBtn").on("click", function(){
			var formObj = $("form[name='replyForm']");
			formObj.attr("action", "/board/replyWrite");
			formObj.submit();
		});
		
		//댓글 수정 View
		$(".replyUpdateBtn").on("click", function(){
			location.href = "/board/replyUpdateView?bno=${read.bno}"
							+ "&page=${scri.page}"
							+ "&perPageNum=${scri.perPageNum}"
							+ "&searchType=${scri.searchType}"
							+ "&keyword=${scri.keyword}"
							+ "&rno="+$(this).attr("data-rno");
		});
		
		//댓글 삭제 View
		$(".replyDeleteBtn").on("click", function(){
			location.href = "/board/replyDeleteView?bno=${read.bno}"
				+ "&page=${scri.page}"
				+ "&perPageNum=${scri.perPageNum}"
				+ "&searchType=${scri.searchType}"
				+ "&keyword=${scri.keyword}"
				+ "&rno="+$(this).attr("data-rno");
		});
	})
	function fn_fileDown(fileNo){
		var formObj = $("form[name='readForm']");
		$("#FILE_NO").attr("value", fileNo);
		formObj.attr("action", "/board/fileDown");
		formObj.submit();
	}
</script>	
</body>
</html>