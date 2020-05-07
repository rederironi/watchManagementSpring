<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입</title>
</head>
<body>
<div id="wrapper">
	<%@include file="/WEB-INF/views/nav.jsp" %>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<div class="container">
				       <div class="col-sm-12 pt-3">
				           <div class="card">
				               <div class="card-header card-header-primary">
				                   <h4 class="card-title"><i class="fas fa-square"></i> 회원가입</h4>
				                   <p class="card-catagory"></p>
				               </div>
				               <div class="card-body">
				                   <div class="table-responsive">
				                   
				                   	<form action="/member/register" method="post" id="regForm">
				                        <table class="table" id="fileIndex">
				                            <tbody>
					                            <tr style="line-height:32px;">
					                                <td>아이디</td>
					                                <td colspan="3">
					                                    <input class="form-control" type="text" id="userId" name="userId" title="ID" value="${member.userId}" readonly="readonly"/>
					                                </td>                      
					                            </tr>
					                            <tr>
					                                <td>패스워드</td>
					                                <td colspan="3">
					                                    <input class="form-control" type="password" id="userPass" name="userPass" title="Password" />                                   
					                                </td>
					                            </tr>  
					                            <tr>
					                                <td>성명</td>
					                                <td colspan="3">
					                                    <input class="form-control" type="text" id="userName" name="userName" title="성명" value="${member.userName}"/>
					                                </td>
					                            </tr>
				                            </tbody>
				                        </table>
									</form>          
				                   </div>
				               </div>
				           </div>
				           
				           <div class="text-center mt-3">
						        <button class="btn btn-success" type="button" id="submit">회원정보수정</button>
								<button class="cencle btn btn-primary" type="button">취소</button>
					       </div>
			        </div>
				</div>
			</div>
		</div>
	 </div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		// 취소
		$(".cencle").on("click", function(){
			
			location.href = "/";
					    
		})
	
		$("#submit").on("click", function(){
			if($("#userPass").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#userPass").focus();
				return false;
			}
			if($("#userName").val()==""){
				alert("성명을 입력해주세요.");
				$("#userName").focus();
				return false;
			}
			$.ajax({
				url : "/member/passChk",
				type : "POST",
				dateType : "json",
				data : $("#updateForm").serializeArray(),
				success: function(data){
					
					if(data==true){
						if(confirm("회원수정하시겠습니까?")){
							$("#updateForm").submit();
						}
						
					}else{
						alert("패스워드가 틀렸습니다.");
						return;
						
					}
				}
			})
		});
	})
</script>
</body>
</html>