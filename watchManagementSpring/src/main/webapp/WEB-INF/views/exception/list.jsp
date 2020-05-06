<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
	 
	 	<title>당직 예외 설정</title>
	</head>
	<script type="text/javascript">
		function fn_eTypeSelect(){ 
			if($("#eTypeSelect option:selected").val() == "D"){
				self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("#searchType option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val()) + "&searchEType=" + "type" + "&eTypeKeyword=" + $("#eTypeSelect option:selected").val();
			} else if ($("#eTypeSelect option:selected").val() == "U"){
				self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("#searchType option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val()) + "&searchEType=" + "type" + "&eTypeKeyword=" + $("#eTypeSelect option:selected").val();
			} else {
				self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("#searchType option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val()) + "&searchEType=" + "type" + "&eTypeKeyword=" + $("#eTypeSelect option:selected").val();
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
			
			<select id="eTypeSelect" onchange="fn_eTypeSelect();">
				<option value=""<c:out value="${scri.eTypeKeyword eq '' ? 'selected' : ''}"/>>모두</option>
				<option value="D"<c:out value="${scri.eTypeKeyword eq 'D' ? 'selected' : ''}"/>>날짜</option>
				<option value="U"<c:out value="${scri.eTypeKeyword eq 'U' ? 'selected' : ''}"/>>사용자</option>
			</select>
			<section id="container">
				<form role="form" method="get">
					<table class="table table-hover">
						<thead>
							<tr><th>번호</th><th>구분</th><th>선택값</th><th>내용</th><th>등록일</th></tr>
						</thead>
						
						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out value="${list.eno}" /></td>
								<td>
									<%-- <a href="/exception/readView?eno=${list.eno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"></a> --%>
									<c:if test="${list.etype == 'D'}">
										날짜
									</c:if>
									<c:if test="${list.etype == 'U'}">
										사용자
									</c:if>
								</td>
								<td>
									<c:if test="${list.etype == 'D'}">
										<c:out value="${list.edate}" />
									</c:if>
									<c:if test="${list.etype == 'U'}">
										<c:out value="${list.euser}" />
									</c:if>
								</td>
								<td><a href="/exception/readView?eno=${list.eno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${list.content}" /></a></td>
								<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							</tr>
						</c:forEach>
						
					</table>
					<div class="search row">
						<div class="col-xs-2 col-sm-2">
							<select name="searchType" id="searchType" class="form-control">
								<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
								<%-- <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option> --%>
								<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
								<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
								<%-- <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option> --%>
							</select>
						</div>
						 
						<div class="col-xs-10 col-sm-10">
							<div class="input-group">
								<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
								<span class="input-group-btn">
									<button id="searchBtn" type="button" class="btn btn-default">검색</button> 	
								</span>
							</div>
						</div>
						 
						<script>
							 $(function(){
								 $('#searchBtn').click(function() {
									 self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("#searchType option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val()) + "&searchEType=" + "type" + "&eTypeKeyword=" + $("#eTypeSelect option:selected").val();
								 });
							 });   
						</script>
					</div>
					<div class="col-md-offset-3">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if> 
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if> 
						</ul>
					</div>
				</form>
			</section>
		</div>
	</body>
</html>