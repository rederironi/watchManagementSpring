<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		                   <h4 class="card-title"><i class="fas fa-square"></i> 당직 체크 문서 등록</h4>
		                   <p class="card-catagory"></p>
		               </div>
		               <div class="card-body">
		                   <div class="table-responsive">
								<form name="writeForm" method="post" action="/board/write" enctype="multipart/form-data">
			                        <table class="table" id="fileIndex">
			                            <tbody>
				                            <tr style="line-height:32px;">
				                                <td>제목</td>
				                                <td colspan="3">
				                                    <input type="text" id="title" name="title" class="form-control chk" title="제목을 입력하세요."/>
				                                </td>                      
				                            </tr>
				                            <tr>
				                                <td>내용</td>
				                                <td colspan="3">
				                                    <textarea id="content" name="content" class="form-control chk" title="내용을 입력하세요."></textarea>                                   
				                                </td>
				                            </tr>  
				                            <tr>
				                                <td>작성자</td>
				                                <td colspan="3">
				                                    <input type="text" id="writer" name="writer" class="form-control chk" title="작성자를 입력하세요." readonly value="${member.userId}" />
				                                </td>
				                            </tr>
			                            </tbody>
			                        </table>
								</form>          
		                    </div>
	                    </div>
                    </div>
					<div class="text-center mt-3" style="margin-bottom:10px;">
				        <button type="button" class="btn btn-primary write_btn">작성</button>
				        <button type="button" class="btn btn-default cancel_btn">취소</button>
				        <button class="btn btn-info fileAdd_btn" type="button">파일추가</button>	
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
		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click", function(){
			if(fn_valiChk()){
				return false;
			}
			formObj.attr("action", "/board/write");
			formObj.attr("method", "post");
			formObj.submit();
		});
		fn_addFile();
		
		$(".cancel_btn").on("click", function(){
			event.preventDefault();
			location.href = "/board/list";
		})
	})
	function fn_valiChk(){
		var regForm = $("form[name='writeForm'] .chk").length;
		for(var i = 0; i<regForm; i++){
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
</script>	
</body>
</html>