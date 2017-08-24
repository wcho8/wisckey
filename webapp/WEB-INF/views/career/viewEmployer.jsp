<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<script type="text/javascript">
$(document).ready(function(){
	
	var defaultParams={
		brdid: "${paramVO.brdid}",
		userno: "${session.userno}",
		nickname: "${session.nickname}",
		mypage: "${paramVO.mypage}",
	};
	
	
	$("#employerList").click(function(){
		var params = $.param(defaultParams);
		$(location).attr("href", "/Career/?"+params);
	})
	
	$("#addReply").click(function(){
		var url = "/Career/addEmployerReply";
		var replyContent = $("#reply").val();
		var params = $.extend({}, defaultParams, {repContent:replyContent});
		if(params.repContent==""||params.repContent==null){
			alert("댓글은 공백일 수 없습니다.");
			return;
		}
		if(params.userno==""||params.userno==null){
			alert("로그인하여 주십시오.");
			return;
		}else{
			$.post(url, params, function(data){
				alert("댓글이 등록되었습니다.");
				location.reload(true);
			});
		}
	});

	$("#employerDelete").click(function(){
		var url = "/Career/deleteEmployer";
		var params = $.extend({}, defaultParams, {});
		$.post(url, params, function(data){
			alert("게시글이 삭제되었습니다.");
			$(location).attr("href","/Career/");
		});
	});
	
	
	//update
	var writerno = "${vo.userno}";
	
	if(defaultParams.userno == writerno){
		$("#employerUpdate").show();
		$("#employerDelete").show();
	}
	
	$("#employerUpdate").click(function(){
		var url = "/Career/writeEmployer?";
		var params = $.param(defaultParams);
		$(location).attr("href", url+params);
	});
	
	
	
	var title = new String($("#title").text());
	var length = ~-encodeURI(title).split(/%..|./).length;
	//76바이트가 넘으면 alt
	if(length>76){
		$('span#title').attr('title',title);
		var title = cutInUTF8(title, 76);
		title += "...";
		$("#title").text(title);
	}

})

function cutInUTF8(str, n) {
    var len = Math.min(n, str.length);
    var i, cs, c = 0, bytes = 0;
    for (i = 0; i < len; i++) {
        c = str.charCodeAt(i);
        cs = 1;
        if (c >= 128) cs++;
        if (c >= 2048) cs++;
        if (n < (bytes += cs)) break;
    }
    return str.substr(0, i);
}

function deleteReply(repid){
	var url = "/Career/deleteEmployerReply";
	var params = $.extend({}, defaultParams, {repid: repid});
	$.post(url, params, function(data){
		alert("댓글이 삭제되었습니다.");
		location.reload(true);
	});
}

function updateReply(repid){
	var text = $("#repContent").val();
	$("#replyUpdate").hide();
	$("#replyDelete").hide();
	$("#repContent").css("display","none");
	$("#confirmUpdate").show();
	$("#repUpdate").show();
	
	var url = "/Career/findReplyContent";
	var params = $.extend({}, defaultParams, {repid:repid});
	$.post(url, params, function(data){
		$("#repUpdate").val(data.content);
	});
}

function confirmUpdate(repid){
	var content = $("#repUpdate").val();
	var url ="/Career/modEmployerReply";
	var params = $.extend({}, defaultParams, {repid: repid, content:content});
	$.post(url, params, function(data){	
		location.reload(true);
	});
}
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
#title_list li>a {
	opacity: 0.7;
	text-decoration: none;
	
}
#l_title{
/*
	border: 2px solid #808080;
	border-radius: 25px;
	padding-left: 10px;
	box-shadow: 2px 2px #778899;
*/
	border-right:2px solid #a80e34;
}
#title_list>li{
	list-style-type: disc;
	list-style-position: inside ;
}
#employerDelete, #employerUpdate,#employerList{
	margin-left:5px; 
	line-height: 20px; 
	width:45px; 
	vertical-align:middle; 
	padding:0px;
}

#replyDelete, #replyUpdate{
	margin-left:5px; 
	line-height: 15px; 
	width:35px; 
	vertical-align:middle; 
	padding:0px;
}

#confirmUpdate{
	margin-left:5px;
	line-height:25px;
	width:45px;
	vertical-align:middle;
	padding:0px;
}
</style>

<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width: 100%"></div>
	<div class="row">
		<div class="main_body" style="overflow: hidden;">
			<div class="left_menu" style="float:left; width:130px; padding-top: 7px; margin-left: 40px;">
				<div id="l_first_title" style="font-weight: bold; border-right: 2px solid #910019;">
					<div style="font-weight: bold; padding-left:5px; font-size: 110%; ">취업</div>
					<div style="clear:both;"></div>
					<ul id="title_list" style="list-style:none; padding-top:5px; padding-left: 10px; text-decoration: none;">
						<li><a id="current" href="/Career/?ptypeid=8">취업공고</a></li>
						<li><a href="/Career/employBoard?ptypeid=3">취업게시판</a></li>
					</ul>
				</div>
			</div>
			<div class="center_menu" style="float: left; margin-left: 35px; width: 700px;">
				
				
				<div style="clear:both;"></div>
				
				<div id="notice_main" style="width: 100%; border: 1px solid #cacaca; margin-top: 5px; padding: 10px; background-color: white;">
					<div id="notice_title" style="width: 100%; background-color: lightgrey; font-size: 19px; padding:5px; border-top: 2px solid grey; ">
						<span id="title" style="font-weight:bold;" title="" value="${vo.title}">${vo.title }</span>  <span style="float: right; font-size:14px;"> ${vo.regdate }</span><br/>
					</div>
					<div id="notice_extra" style="width:100%; background-color: white; padding:5px; font-size:12px;">
						<span style="float: left;">
							작성자: <b>${vo.writer }</b> 
							<span style="font-size: 12px; margin-left:20px;">&nbsp;접수기한: ${vo.deadline}</span>
						</span>
						<span style="float: right;">
							조회수: ${vo.count}
						</span>
					</div>
					
					<div style="clear:both;"></div>
					
					<div class="hr_dash" style="opacity: 0.3; background: grey;"></div>
					
					<div id="notice_content" style="width:100%; min-height: 300px; margin-top:10px;">
						${vo.content }
					</div>
					
					<div class="hr_dash" style="background: grey;"></div>
					<div style="clear:both;"></div>
					
					<div style="float: left; width:100%;">
						<button class="btn delete" id="employerDelete" style="float: right; margin-top:5px; display:none;">삭제</button>
						<button class="btn confirm" id="employerList" style="float: right; margin-top: 5px;">목록	</button>
						<button class="btn update" id="employerUpdate" style="float:right; margin-top:5px; display:none;">수정</button>	
					</div>
					
					<div style="clear:both;"></div>
					<div id="employer_reply" style="margin-top:20px; border: 1px solid #cacaca; border-left:0; border-right:0;padding: 10px; font-size: 12px;">
						댓글쓰기<br/>
						<textarea id="reply" style="width:600px; height: 60px; text-align: left; overflow:auto;  margin-top:5px; padding-top:5px;"></textarea>
						<button id="addReply" style="float: right; height:50px; width: 50px; margin-top:8px;">등록</button>
					</div>
					
					<div style="height: 1px; background-color: lightgrey; width:100%; margin-top:15px;"></div>
					
					<c:forEach items="${reps }" var="rep">
						<div style="border-bottom: 1px solid lightgrey;padding-bottom: 15px; margin-top:15px; padding-left:12px;" id="${rep.repid}">
							<b>${rep.replier} </b> 
							<span style="font-size:12px;">(${rep.repRegdate})</span>
							<button class="btn updateRep" id="replyUpdate" style="float:right;" onclick="javascript:deleteReply(${rep.repid});"><span style="font-size: 80%;">삭제</span></button>
							<button class="btn deleteRep" id="replyDelete" style="float:right;" onclick="javascript:updateReply(${rep.repid});"><span style="font-size: 80%;">수정</span></button>
							<br/>
						<span id="repContent" style="font-size:13px;margin-top:10px;">${rep.repContent}</span>
						<textarea style="width:89%; display:none;" id="repUpdate"></textarea>
						<button id="confirmUpdate" onclick="javascript:confirmUpdate(${rep.repid});" style="display:none;"><span style="font-size:90%;">완료</span></button>
						
						</div>
						
					</c:forEach>
					
					<div style="clear:both;"></div>
				</div>
			</div>
		</div>
	</div>
</div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
    