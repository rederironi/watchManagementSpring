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
				                                    <input class="form-control" type="text" id="userId" name="userId" title="ID" />
													<button class="idChk btn btn-default" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
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
				                                    <input class="form-control" type="text" id="userName" name="userName" title="성명" />
				                                </td>
				                            </tr>
			                            </tbody>
			                        </table>
								</form>          
			                   </div>
			               </div>
			           </div>
			           
			           <div class="text-center mt-3">
					        <button type="submit" class="btn btn-success" id="submit">회원가입</button>
							<button type="reset" class="btn btn-primary cencle">취소</button>
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
			if($("#userId").val()==""){
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
				return false;
			}
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
			var idChkVal = $("#idChk").val();
			if(idChkVal == "N"){
				alert("중복확인 버튼을 눌러주세요.");
			}else if(idChkVal == "Y"){
				$("#regForm").submit();
			}
		});
	})
	
	function fn_idChk(){
		$.ajax({
			url : "/member/idChk",
			type : "post",
			dataType : "json",
			data : {"userId" : $("#userId").val()},
			success : function(data){
				if(data == 1){
					alert("중복된 아이디입니다.");
				}else if(data == 0){
					$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	}
</script>
</body>
</html>