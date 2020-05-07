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
                    <br />
                    <select id="eTypeSelect" onchange="fn_eTypeSelect();" class="form-control" style="margin-left:18px;width:200px;">
						<option value=""<c:out value="${scri.eTypeKeyword eq '' ? 'selected' : ''}"/>>모두</option>
						<option value="D"<c:out value="${scri.eTypeKeyword eq 'D' ? 'selected' : ''}"/>>날짜</option>
						<option value="U"<c:out value="${scri.eTypeKeyword eq 'U' ? 'selected' : ''}"/>>사용자</option>
					</select>
					<div class="panel-body">
						<div id="shieldui-grid1" role="grid" aria-readonly="true" class="sui-grid sui-grid-core">
							<div class="sui-gridheader">
								<table class="sui-table sui-non-selectable">
									<colgroup>
										<col width="100px;">
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<thead>
										<tr role="row" class="sui-columnheader">
											<th class="sui-headercell">
												<a href="#" class="sui-link sui-unselectable" unselectable="on" tabindex="-1">번호</a>
											</th>
											<th class="sui-headercell">
												<a href="#" class="sui-link sui-unselectable" unselectable="on" tabindex="-1">구분</a>
											</th>
											<th class="sui-headercell">
												<a href="#" class="sui-link sui-unselectable" unselectable="on" tabindex="-1">선택값</a>
											</th>
											<th class="sui-headercell">
												<a href="#" class="sui-link sui-unselectable" unselectable="on" tabindex="-1">내용</a>
											</th>
											<th class="sui-headercell">
												<a href="#" class="sui-link sui-unselectable" unselectable="on" tabindex="-1">등록일</a>
											</th>
										</tr>
									</thead>
									<tbody class="sui-hide">
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="sui-gridcontent">
								<form role="form" method="get">
									<table class="sui-table sui-hover sui-selectable">
										<colgroup>
											<col width="100px;">
											<col>
											<col>
											<col>
											<col>
										</colgroup>
										<tbody>
										<c:forEach items="${list}" var = "list">
										<tr class="sui-row" role="row">
											<td role="gridcell" tabindex="-1" class="sui-cell"><c:out value="${list.eno}" /></td>
											<td role="gridcell" tabindex="-1" class="sui-cell">
												<%-- <a href="/exception/readView?eno=${list.eno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"></a> --%>
												<c:if test="${list.etype == 'D'}">
													날짜
												</c:if>
												<c:if test="${list.etype == 'U'}">
													사용자
												</c:if>
											</td>
											<td role="gridcell" tabindex="-1" class="sui-cell">
												<c:if test="${list.etype == 'D'}">
													<c:out value="${list.edate}" />
												</c:if>
												<c:if test="${list.etype == 'U'}">
													<c:out value="${list.euser}" />
												</c:if>
											</td>
											<td role="gridcell" tabindex="-1" class="sui-cell"><a href="/exception/readView?eno=${list.eno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${list.content}" /></a></td>
											<td role="gridcell" tabindex="-1" class="sui-cell"><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
										</tr>
										</c:forEach>
										</tbody>
									</table>
								</form>
							</div>
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
							<div class="sui-pager sui-pager-core">
								<ul class="sui-pagination">
									<c:if test="${pageMaker.prev}">
										<li class="sui-pager-element"><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
									</c:if> 
									
									<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
										<li class="sui-pager-element" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
										<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
									</c:forEach>
									
									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li class="sui-pager-element"><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
									</c:if> 
								</ul>
								<div class="sui-pager-info-box" style="padding-top:0;">
									<button type="button" class="btn btn-primary" onclick="location.href='/exception/writeView'">등록</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	 </div>
</div>
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
</body>
</html>