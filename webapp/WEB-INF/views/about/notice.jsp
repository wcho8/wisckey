<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">

function writePost(){
	window.location="/About/writeForm";
}


$(document).ready(function(){
	var url="/About/listNotice";
	
	$.post(url, {}, function(data){
		console.log(data[0].fix);
		for(var i=0; i<data.length; i++){
			var d = new Date(data[i].date);
			
			$('#top_table > tbody:last').append
	 		('<tr style="border-bottom: 1px solid #ccc;">'+
	 		'<td style="text-align:left; padding-left:10px; width:550px;"><a href="/About/viewNotice" style="text-decoration:none">'
	 		+ data[i].title +'</a></td><td style="width:200px;">'+data[i].writer+'</td><td style="width:100px;">'
	 		+ d.toDateString().substring(4, d.toDateString().length)+'</td><td>'+data[i].hit+'</td></tr>');
		}
	})
});
</script>

<style type="text/css">
#title_list li>a:active {
	font-size: 110%;
	font-weight: bold;
	text-decoration: none;
}

#title_list li>a:hover {
	text-decoration: none;
	font-size: 110%;
	font-weight: bold;
	opacity: 1;
	color: black;
}

#title_list li>a:visited {
	font-size: 110%;
	font-weight: bold;
	text-decoration: none;
}

#title_list li>a {
	opacity: 0.4;
	text-decoration: none;
}

#top_row_title, #bottom_row_title{
	text-align: left;
	padding-left: 10px;
}
#top_table tr>td:nth-child(1), #bottom_table tr>td:nth-child(1){
	width: 550px;
}
#top_table tr>td:nth-child(2), #bottom_table tr>td:nth-child(2){
	width: 200px;
}
#top_table tr>td:nth-child(3), #bottom_table tr>td:nth-child(3){
	width: 90px;
}
#top_table tr>td:nth-child(4), #bottom_table tr>td:nth-child(4){
	width: 90px;
}


</style>
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
					<li><a href="/About/otherSites">-주요사이트 소개</a></li>
				</ul>
			</div>

			<div class="center_menu"
				style="float: left; margin-left: 10px; width: 900px; height: 100%;">
				<div id="notice_fixed" style="width: 990px; height: 20%; border-top: 1.5px solid #ff0000;">
					<table id="top_table" style="background-color:#fffafa;">
						<tr id="top_row" style=" width: 1000px; height:40px; text-align: center; border-bottom: 1px solid #ccc; padding: 10px;">
							<td><span></span>제목</td>
							<td>작성자</td>
							<td>작성일</td>
							<td>조회</td>
						</tr>
						<tbody style="text-align: center; padding:10px;"></tbody>
					</table>
				</div>

				<div id="notice_updated" style="width: 990px; height:70%; border-bottom: 1.5px solid #ff0000;">
					<table id="bottom_table" style="border-top: 1px solid #ccc;text-align: center; padding: 10px;">
						<tr id="bottom_row" >
							<td id="bottom_row_title"></td> 
							<td id="bottom_row_writer"></td>
							<td id="bottom_row_date"></td>
							<td id="bottom_row_hit"></td>
						</tr>
					</table>
				</div>
			</div>
			
			<div id="writeBtn" style="float: right;">
				<button type="button" class="btn" onClick="javascript:writePost()">글쓰기</button>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
