<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- pagination -->
<script type="text/javascript">
function page_change(pagenum) {
	var url = curPage;
	var params = $.extend({}, defaultParams, {
		mypage:pagenum
	});
	url += $.param(params);
	
	$(location).attr("href", url);
}
</script>
<div id="paging" class="pagination">
	<c:set var="mypage" value="${paramVO.mypage}" />
	<c:set var="block" value="${paramVO.block}" />
	<c:set var="startpage" value="${paramVO.startpage}" />
	<c:set var="endpage" value="${paramVO.endpage}" />
	<c:set var="nextpage" value="${(endpage + 1) <= block}" />
	<c:set var="lastpage" value="${mypage == block}" />
	<c:if test="${mypage > 1}">
		<a href="javascript:page_change(1);" class="first">처음</a>
	</c:if>
	<c:if test="${mypage <= 1}">
		<a href="#" class="first">처음</a>
	</c:if>
	<c:if test="${mypage > 5}">
		<a href="javascript:page_change('${startpage - 1}');" class="prev">이전</a>
	</c:if>
	<c:if test="${mypage <= 5}">
		<a href="#" class="prev">이전</a>
	</c:if>	
	<c:forEach begin="${startpage}" end="${endpage}" varStatus="PageNum">
		<c:if test="${PageNum.index != mypage}">
			<a href="javascript:page_change('${PageNum.index}');">${PageNum.index}</a>
		</c:if>
		<c:if test="${PageNum.index == mypage}">
			<strong>${PageNum.index}</strong>
		</c:if>
	</c:forEach>
	<c:if test="${nextpage}"><a href="javascript:page_change('${endpage + 1}');" class="next">다음</a></c:if>
	<c:if test="${!nextpage}" ><a href="#" class="next">다음</a></c:if>
	<c:if test="${!lastpage}"><a href="javascript:page_change('${block}');" class="last">맨끝</a></c:if>
	<c:if test="${lastpage}"><a href="#" class="last">맨끝</a></c:if>
</div>
<!-- /pagination -->