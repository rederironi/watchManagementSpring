<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		부가적인 테마
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	 	
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
	var userID = "${update.euser}";
	
		$(document).ready(function(){
			
			
			//input을 datepicker로 선언
            $("#edate").datepicker({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
            });                    
            
            //초기값을 오늘 날짜로 설정
            //$('#edate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
			
            $(".ui-datepicker-trigger").hide();
			
			
			var formObj = $("form[name='updateForm']");
			
			$(document).on("click","#fileDel", function(){
				$(this).parent().remove();
			})
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/exception/readView?eno=${update.eno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
				 	   + "&searchEType=${scri.searchEType}"
				       + "&eTypeKeyword=${scri.eTypeKeyword}";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/exception/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
			$.ajax({
				url : "/member/listUser",
				type : "POST",
				dateType : "json",
				data : "",
				success: function(data){
					var option = "<option value=''>-------</option>";
					$.each(data, function (index, item){
						//$("#eUserDiv").append(index + ' | ' + item.userId + '<br />');
						option += "<option value='" + item.userId + "'";
						if(item.userId.trim() == userID.trim()){
							option += " selected"
						}
						option +=  ">" + item.userId + "(" + item.userName + ")" + "</option>";
					}); 
					$("#euser").html(option);
				}
			})
			
			//$("#euser").val(userID).prop("selected", true);
			
			typeSelect();
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
			
			var type = $("#etype option:selected").val();
			
			if(type == "D"){
				if($("#edate").val() == ""){
					alert("날짜를 선택해 주세요.");
					$("#edate").focus();
					return true;
				}
			} else if(type == "S"){
				if($("#euser").val() == ""){
					alert("사용자를 주세요.");
					$("#euser").focus();
					return true;
				}
			}
		}
		
		function typeSelect(){
			var type = $("#etype option:selected").val();
			
			if(type == "D"){
				$("#edate").show();
				$("#euser").hide();
				$("#euser option:eq(0)").prop("selected", true);
			} else if(type == "U"){
				$("#euser").show();
				$("#edate").hide();
			}
			
		}
	</script>
<body>
	<div class="container">
	<header>
		<h1> 당직 예외 설정</h1>
	</header>
	<hr />
	 
	<div>
		<%@include file="nav.jsp" %>
	</div>
	<hr />
    
       <div class="col-sm-12 pt-3">
       	   <c:if test="${member.userId != null}">
           <div class="card">
               <div class="card-header card-header-primary">
                   <h4 class="card-title"><i class="fas fa-square"></i> 당직 예외 설정</h4>
                   <p class="card-catagory"></p>
               </div>
               <div class="card-body">
                   <div class="table-responsive">
                   
                   	<form name="updateForm" role="form" method="post" action="/exception/update" enctype="multipart/form-data">
                        <table class="table" id="fileIndex">
                            <tbody>
	                            <tr style="line-height:32px;">
	                                <td>구분</td>
	                                <td colspan="3">
	                                   <select id="etype" name="etype" onchange="typeSelect();">
											<option value="D"<c:if test="${update.etype == 'D'}"> selected</c:if>>날짜</option>
											<option value="U"<c:if test="${update.etype == 'U'}"> selected</c:if>>사용자</option>
										</select>
	                                </td>                    
	                            </tr>
	                            <tr>
	                                <td>선택값</td>
	                                <td colspan="3">
										<input type="text" id="edate" name="edate" title="날짜를 입력하세요." value="${update.edate}" maxlength="10" autocomplete="off"<c:if test="${update.etype != 'D'}"> style="display:none;"</c:if> />
										<select id="euser" name="euser"<c:if test="${update.etype != 'U'}"> style="display:none;"</c:if>>
										</select>
	                                </td>
	                            </tr>  
	                            <tr>
	                                <td>내용</td>
	                                <td colspan="3">
	                                    <input type="text" id="content" name="content" class="chk" title="내용을 입력하세요." value="${update.content}" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <td>작성자</td>
	                                <td colspan="3">
	                                    <input type="text" id="writer" name="writer" title="작성자를 입력하세요." readonly="readonly" value="${update.writer}" readonly="readonly" />
	                                </td>
	                            </tr>
	                            <tr>
								<tr>
									<td>작성날짜</td>
									<td colspan="3">
										<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
									</td>					
								</tr>
                            </tbody>
                        </table>
					</form>          
                   </div>
               </div>
           </div>
           
           <div class="text-center mt-3">
		        <button type="button" class="update_btn">저장</button>
				<button type="button" class="cancel_btn">취소</button>
		    </div>
		    </c:if>
		    <c:if test="${member.userId == null}">
					<p>로그인 후에 작성하실 수 있습니다.</p>
			</c:if>	   
        </div>
	</div>
</body>
</html>