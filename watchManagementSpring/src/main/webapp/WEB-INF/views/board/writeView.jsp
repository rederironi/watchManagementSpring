<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		부가적인 테마
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
	 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	 	
	 	<title>게시판</title>
	</head>
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
<body>
	<div class="container">
	<header>
		<h1> 게시판</h1>
	</header>
	<hr />
	 
	<div>
		<%@include file="nav.jsp" %>
	</div>
	<hr />
    
       <div class="col-sm-12 pt-3">
           <div class="card">
               <div class="card-header card-header-primary">
                   <h4 class="card-title"><i class="fas fa-square"></i> 게시판</h4>
                   <p class="card-catagory"></p>
               </div>
               <div class="card-body">
                   <div class="table-responsive">
                   <c:if test="${member.userId != null}">
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
                        <div class="text-center mt-3">
					        <button class="btn btn-success write_btn" type="submit">작성</button>	
							<button class="btn btn-info fileAdd_btn" type="button">파일추가</button>	
					    </div>
					</form>
				</c:if>
				<c:if test="${member.userId == null}">
					<p>로그인 후에 작성하실 수 있습니다.</p>
				</c:if>	                       
                   </div>
               </div>
           </div>
        </div>
	</div>
</body>
</html>