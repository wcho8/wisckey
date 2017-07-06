<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width: 100%"></div>
	<div class="row">
		<div class="main_body" style="overflow: hidden;">
			<div id="left_menu" style="float: left; width: 130px; border-right: 1px solid #ccc;">
				<div id="l_title" style="font-weight: bold; font-size: 130%">ABOUT
				</div>
				<ul id="title_list"
					style="list-style: none; padding-left: 0px; text-decoration: none;">
					<li><a href="/About/introWisckey">-위스키 소개</a></li>
					<li><a href="/About/introUniv">-학교소개</a></li>
					<li><a href="/About/notice">-공지사항</a></li>
					<li><a href="/About/otherSites">-주요사이트</a></li>
				</ul>
			</div>

			<div class="center_menu" style="float: left; margin-left: 35px; width: 870px;">
				<div style="width: 100%; margin-top:10px; float:left;">
					<b style="font-size: 30px;">주요사이트</b>
				</div>
				<div>
					
				</div>
			</div>
		</div>
	</div>
</div>



<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
