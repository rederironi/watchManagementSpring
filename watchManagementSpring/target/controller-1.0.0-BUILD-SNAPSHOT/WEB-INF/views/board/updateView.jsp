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
		       	   <c:if test="${member.userId != null}">
		           <div class="card">
		               <div class="card-header card-header-primary">
		                   <h4 class="card-title"><i class="fas fa-square"></i> 당직 체크 문서 수정</h4>
		                   <p class="card-catagory"></p>
		               </div>
		               <div class="card-body">
		                   <div class="table-responsive">
			                   	<form name="updateForm" method="post" action="/board/write" enctype="multipart/form-data">
			                   		<input type="hidden" name="bno" value="${update.bno}" readonly="readonly"/>
									<input type="hidden" id="page" name="page" value="${scri.page}"> 
									<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
									<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
									<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
									<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
									<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
			                   	
			                        <table class="table" id="fileIndex">
			                            <tbody>
				                            <tr style="line-height:32px;">
				                                <td>제목</td>
				                                <td colspan="3">
				                                    <input type="text" id="title" name="title" class="form-control chk" title="제목을 입력하세요." value="${update.title}" />
				                                </td>                      
				                            </tr>
				                            <tr>
				                                <td>내용</td>
				                                <td colspan="3">
				                                    <textarea id="content" name="content" class="form-control chk" title="내용을 입력하세요."><c:out value="${update.content}" /></textarea>                                   
				                                </td>
				                            </tr>  
				                            <tr>
				                                <td>작성자</td>
				                                <td colspan="3">
				                                    <input type="text" id="writer" name="writer" class="form-control chk" title="작성자를 입력하세요." readonly value="${update.writer}" />
				                                </td>
				                            </tr>
				                            <tr>
				                                <td>작성날짜</td>
				                                <td colspan="3">
				                                    <fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				                                </td>
				                            </tr>
				                            <c:forEach var="file" items="${file}" varStatus="var">
				                            <tr>
												<td colspan="4">
													<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO }">
													<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
													<a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
													<button id="fileDel" onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');" type="button" style='float:right;'>삭제</button><br>
												</td>
											</tr>
											</c:forEach>
			                            </tbody>
			                        </table>
								</form>          
		                    </div>
		               </div>
		           </div>
		           <div class="text-center mt-3" style="margin-bottom:10px;">
				        <button type="button" class="btn btn-primary update_btn">수정</button>
						<button type="button" class="btn btn-default cancel_btn">취소</button>
						<button type="button" class="btn btn-info fileAdd_btn">파일추가</button>	
				    </div>
				    </c:if>
				    <c:if test="${member.userId == null}">
						<p style="margin:20px;">로그인 후에 작성하실 수 있습니다.</p>
					</c:if>	  
				</div>
			</div>
		</div>
	 </div>
</div>			                    
<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='updateForm']");
		
		$(document).on("click","#fileDel", function(){
			$(this).parent().remove();
		})
		
		fn_addFile();
		
		$(".cancel_btn").on("click", function(){
			event.preventDefault();
			location.href = "/board/readView?bno=${update.bno}"
				   + "&page=${scri.page}"
				   + "&perPageNum=${scri.perPageNum}"
				   + "&searchType=${scri.searchType}"
				   + "&keyword=${scri.keyword}";
		})
		
		$(".update_btn").on("click", function(){
			if(fn_valiChk()){
				return false;
			}
			formObj.attr("action", "/board/update");
			formObj.attr("method", "post");
			formObj.submit();
		})
	})
		
	function fn_valiChk(){
		var updateForm = $("form[name='updateForm'] .chk").length;
		for(var i = 0; i<updateForm; i++){
			if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
		function fn_addFile(){
		var fileIndex = 1;
		//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
		$(".fileAdd_btn").on("click", function(){
			$("#fileIndex").append("<tr><td colspan='4'><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></td></tr>");
		});
		$(document).on("click","#fileDelBtn", function(){
			$(this).parent().parent().remove();
			
		});
	}
		var fileNoArry = new Array();
		var fileNameArry = new Array();
		function fn_del(value, name){
			
			fileNoArry.push(value);
			fileNameArry.push(name);
			$("#fileNoDel").attr("value", fileNoArry);
			$("#fileNameDel").attr("value", fileNameArry);
		}
</script>	
</body>
</html>