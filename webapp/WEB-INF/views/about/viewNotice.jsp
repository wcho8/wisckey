<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="../common/header.jsp"></jsp:include>

<script type="text/javascript">
$(document).ready(function(){
	var defaultParams = {
			mypage:"${paramVO.mypage}"
	};
	
	var userno = "${session.userno}";

	var writerno = "${vo.userno}";
	
	if(userno == writerno){
		$("#noticeUpdate").show();
		$("#noticeDelete").show();
	}
	
	console.log(userno);
	console.log(writerno);
	
	$("#noticeDelete").click(function(){
		var url = "/About/deleteNotice";
		var params = $.extend({}, defaultParams, {nid: "${paramVO.nid}"});
		if(confirm("정말로 삭제하시겠습니까?")){
			$.post(url, params, function(data){
				alert("게시글이 삭제되었습니다.");
				$(location).attr("href", "/About/?"+$.param(defaultParams));
			});
		}
	});

	$("#noticeUpdate").click(function(){
		var url = "/About/writeForm?";
		var params = $.param($.extend({}, defaultParams, {nid: "${paramVO.nid}"}));
		$(location).attr("href", url+params);
	});
	
	$("#noticeList").click(function(){
		var url = "/About/";
		$(location).attr("href", url);
	});

	$("#addReply").click(function(){
		var url = "/About/addNoticeReply";
		var replyContent = $("#reply").val();
		var params = $.extend({}, defaultParams, {repContent:replyContent, nid:"${paramVO.nid}", userno:"${session.userno}"});
		if(params.repContent == "" || params.repContent == null){
			alert("댓글은 공백일 수 없습니다.");
			return;
		}
		if(userno == "" || userno == null){
			alert("로그인하여 주십시오.");
			return;
		}else{
			$.post(url, params, function(data){
				alert("댓글이 등록되었습니다.");
				location.reload(true);
			});
		}
	});
});

</script>
<style type="text/css">
#title_list li>a:hover {
	text-decoration: none;
	font-size: 105%;
	font-weight: bold;
	opacity: 1;
	color: black;
}
#current{
	font-size: 110%;
	font-weight: bold;
	opacity:1;
	color: black;
}
#title_listli>a {
	opacity: 0.7;
	text-decoration: none;
	
}
#title_list>li{
	list-style-type: disc; 
	list-style-position: inside;	
}
#noticeDelete, #noticeUpdate,#noticeList{
	margin-left:5px; 
	line-height: 20px; 
	width:45px; 
	vertical-align:middle; 
	padding:0px;
}


</style>


<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width: 84.3%; margin-left: 100px; "></div>
	<div class="row">
		<div class="main_body" style="overflow: hidden;">
			<div id="left_menu" style="float: left; width: 130px;  padding-top: 7px; margin-left: 40px;"> 
				<div id="l_first_title" style="font-weight: bold; border-right: 2px solid #910019;">
					<div style="font-weight: bold; padding-left:5px; font-size: 110%; ">ABOUT <br/></div>
					<div style="clear:both;"></div>
					<ul id="title_list" style="list-style: none; padding-left: 10px; text-decoration: none; padding-top: 5px;">
						<li><a href="/About/introWisckey">위스키 소개</a></li>
						<li><a href="/About/introUniv">학교소개</a></li>
						<li><a id="current" href="/About/">공지사항</a></li>
						<li><a href="/About/otherSites">주요사이트</a></li>
					</ul>
				</div>
			</div>

			<div class="center_menu" style="float: left; margin-left: 25px; width: 700px;">
				
				<div id="notice_main" style="width: 100%; border: 1px solid #cacaca; margin-top: 5px; padding: 10px; background-color: white;">
					<div id="notice_title" style="width: 100%; background-color: lightgrey; font-size: 20px; padding:5px; border-top: 2px solid grey; ">
						<b>${vo.title }</b> <span style="float: right; font-size:14px;"> ${vo.regdate }</span><br/>
					</div>
					<div id="notice_extra" style="width:100%; background-color: white; padding:5px; font-size:12px;">
						<span style="float: left;">
							작성자: <b>${vo.writer }</b>
						</span>
						<span style="float: right;">
							조회수: ${vo.count} 추천: ${vo.likes} 
						</span>
					</div>

					<div style="clear:both;"></div>
					
					<div class="hr_dash" style="opacity: 0.3; background: grey;"></div>
					
					<div id="notice_content" style="width:100%; min-height: 300px; padding-top: 20px; padding-left: 10px;">
						${vo.content }
					</div>
					
					<div class="hr_dash" style="background: grey;"></div>
					<div style="clear:both;"></div>

					<div style="float: left; width:100%;">
						<button class="btn delete" id="noticeDelete" style="float: right; display:none;"><span style="font-size:80%;">삭제</span></button>
						<button class="btn update" id="noticeUpdate" style="float:right; display:none;"><span style="font-size:80%;">수정</span></button>	
						<button class="btn confirm" id="noticeList" style="float: right;"><span style="font-size:80%;">목록</span></button>			
					</div>

					<div style="clear:both;"></div>
					<div id="notice_reply" style="margin-top:20px;border: 1px solid #cacaca; border-left:0; border-right:0;padding: 10px; font-size: 12px;">
						댓글쓰기<br/>
						<textarea id="reply" style="width:600px; height: 60px; text-align: left; overflow:auto; margin-top:5px; padding-top:5px;"></textarea>
						<button id="addReply" style="float: right;height:50px; margin-top:8px; width: 50px;">등록</button>
					</div>
					<div style="height: 1px; background-color: lightgrey; width:100%; margin-top:15px;"></div>
					
					<c:forEach items="${reps }" var="rep">
						<div style="border-bottom: 1px solid lightgrey;padding-bottom: 13px; margin-top:15px; padding-left:12px;" id="${rep.repid}">
							<b>${rep.replier} </b> <span style="font-size:12px;">(${rep.repRegdate})</span>
							<br/>
						<span style="font-size:13px;margin-top:10px;">${rep.repContent}</span>
						</div>
					</c:forEach>
					
					<div style="clear:both;"></div>
				</div>
			</div>
		</div>
	</div>
</div>
    
    
    
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
    