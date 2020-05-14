<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/Theme-LightWayAdmin/bootstrap/css/bootstrap.min.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/Theme-LightWayAdmin/font-awesome/css/font-awesome.min.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/Theme-LightWayAdmin/css/local.css"/>" />

<script type="text/javascript" src="<c:url value="/resources/Theme-LightWayAdmin/js/jquery-1.10.2.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/Theme-LightWayAdmin/bootstrap/js/bootstrap.min.js"/>"></script>

<!-- you need to include the shieldui css and js assets in order for the charts to work -->
<link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
<script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<script type="text/javascript" src="http://www.prepbootstrap.com/Content/js/gridData.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var pathName = window.location.pathname;
	
	$(".navLi").removeClass("active");
	$("#navUl").children().each(function(){ 
		if($(this).children("a").attr("href").indexOf(pathName.split("/")[1]) > -1 && pathName != "/"){
			$(this).addClass("active");
		}
	});
	
})
</script>      
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">            
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/">당직 관리 시스템</a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav" id="navUl">
                    <!-- <li class="active"><a href="#"><i class="fa fa-bullseye"></i> 당직 스케줄</a></li> -->
                    <!-- <li id="navLi1" class="navLi"><a href="#"><i class="fa fa-bullseye"></i> 당직 스케줄</a></li> -->
                    <li id="navLi2" class="navLi"><a href="/board/list"><i class="fa fa-tasks"></i> 당직 체크 문서</a></li>                    
                    <!-- <li id="navLi3" class="navLi"><a href="#"><i class="fa fa-globe"></i> 근무 횟수</a></li> -->
                    <li id="navLi4" class="navLi"><a href="/exception/list"><i class="fa fa-list-ol"></i> 당직 예외 설정</a></li>
					<!-- <li><a href="typography.html"><i class="fa fa-font"></i> Typography</a></li>
                    <li><a href="bootstrap-elements.html"><i class="fa fa-list-ul"></i> Bootstrap Elements</a></li>
                    <li><a href="bootstrap-grid.html"><i class="fa fa-table"></i > Bootstrap Grid</a></li>  -->                   
                </ul>
                <ul class="nav navbar-nav navbar-right navbar-user">
                    <!-- <li class="dropdown messages-dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> Messages <span class="badge">2</span> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-header">2 New Messages</li>
                            <li class="message-preview">
                                <a href="#">
                                    <span class="avatar"><i class="fa fa-bell"></i></span>
                                    <span class="message">Security alert</span>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li class="message-preview">
                                <a href="#">
                                    <span class="avatar"><i class="fa fa-bell"></i></span>
                                    <span class="message">Security alert</span>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="#">Go to Inbox <span class="badge">2</span></a></li>
                        </ul>
                    </li> -->
                    <li class="dropdown user-dropdown">
                       <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> 회원 정보<b class="caret"></b></a>
                       <ul class="dropdown-menu">
                       		<c:if test="${member == null}"><li><a href="/"><i class="fa fa-user"></i> 로그인</a></li></c:if>
				  			<c:if test="${member == null}"><li><a href="/member/register"><i class="fa fa-gear"></i> 회원가입</a></li></c:if>
				  			<c:if test="${member != null}"><li><a href="/member/memberUpdateView"><i class="fa fa-gear"></i> 회원정보수정</a></li></c:if>
		               		<c:if test="${member != null}">
		                    	<li class="divider"></li>
		                    	<li><a href="/member/logout"><i class="fa fa-power-off"></i> 로그아웃</a></li>
		                    </c:if>
                       </ul>
                   </li>
                </ul>
            </div>
        </nav>