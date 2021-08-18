<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="first">
		<div id="first_view" >		
			<a href="/">Home</a> > 이벤트 > 전체
		</div>
</div>
<div id="second">
		<div id="second_view">
			<div id="second_left">
				<h1 style="font-weight:bold;">이벤트</h1>
			</div>
			<div id="second_right">
				<ul class="ul01" style="float: right;">
               		<li class="Menu" style="color:red; border-bottom:3px solid red;" 
               		onClick="location.href=''">전체</li>
	               	<li class="Menu" onClick="location.href=''">진행중</li>
	               	<li class="Menu" onClick="location.href=''">종료</li>
           </ul>
			</div>
		</div>
	</div>
<link rel="stylesheet" type="text/css" href="css/evt.css">
<div class="tab">
    <ul style="font-size:25px;">
        <li data-id="con1" class="on" onClick="location.href='evt1'">이벤트</li>
        <li data-id="con2" >게시판</li>
    </ul>
</div>
<link rel="stylesheet" type="text/css" href="css/boardmain.css">
<div id="wrap" align="center">
<h1>게시글 리스트</h1>
<table class="list">
	<tr><td colspan="5" style="border: white; text-align: right">
		
		<div style="float:right;"><a href="boardWriteForm">게시글 등록</a></div>	</td>
	</tr>
	<tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회</th></tr>
	<c:forEach var="board" items="${boardList}">
		<tr class="record">	<td align="center">${board.num }</td>
			<td><a href="boardView?num=${board.num}">	${board.title}</a>
				<c:if test="${board.replycnt!=0}">
					<span style="color:red;font-weight:bold;"> [${board.replycnt}] </span>
				</c:if>
			</td>
			<td align="center">${board.userid}</td>
			<td align="center"><fmt:formatDate value="${board.writedate}" /></td>
			<td align="center">${board.readcount}</td>
		</tr>
	</c:forEach>
</table><br>
<div id="paging">
	<c:if test="${paging.prev}">
		<a href="boardmain?page=${paging.beginPage-1}">◀</a></c:if> 
	<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" step="1" var="index">
	    <c:choose>
	        <c:when test="${paging.page==index}"> ${index} </c:when>
	        <c:otherwise><a href="boardmain?page=${index}">${index}</a></c:otherwise>
	    </c:choose>
	</c:forEach>
	<c:if test="${paging.next}">
		<a href="boardmain?page=${paging.endPage+1}">▶</a></c:if>
</div>
</div>
<%@ include file="/WEB-INF/views/include/footer_top.jsp" %>    
<%@ include file="/WEB-INF/views/include/footer.jsp" %>