<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<script type="text/javascript">
$(document).ready(function(){
	var defaultParams={
		mypage: "${paramVO.mypage}",
		ptypeid: "${paramVO.ptypeid}"
	}
	
	var writerno = "${vo.userno}";
	var userno = "${session.userno}";

	if(userno == writerno){
		$("#educationUpdate").show();
		$("#educationDelete").show();
	}
	
	$("#educationList").click(function(){
		var params = $.param(defaultParams);
		$(location).attr("href", "/School/education?"+params);
	});
	$("#addReply").click(function(){
		var url = "/School/addEducationReply";
		var replyContent = $("#reply").val();
		var params = $.extend({}, defaultParams, {repContent:replyContent,brdid:"${paramVO.brdid}"});
		if(params.repContent==""||params.repContent==null){
			alert("댓글은 공백일 수 없습니다.");
			return;
		}
		if(userno==""||userno==null){
			alert("로그인하여 주십시오.");
			return;
		}else{
			$.post(url, params, function(data){
				alert("댓글이 등록되었습니다.");
				location.reload(true);
			});
		}
	});
	
	$("#educationDelete").click(function(){
		var url = "/School/deleteEducation";
		var params =$.extend({},defaultParams, {brdid:"${paramVO.brdid}"});
		if(confirm("정말로 삭제하시겠습니까?")){
			$.post(url, params, function(data){
				alert("게시글이 삭제되었습니다.");
				$(location).attr("href","/School/education?"+$.param(defaultParams));
			});
		}
	});
	
	
	$("#educationUpdate").click(function(){
		var url = "/School/educationWrite?";
		var params = $.param($.extend({},defaultParams, {brdid:"${paramVO.brdid}"}));
		$(location).attr("href", url+params);
	})
	
	$("#likes").click(function(){
		var params = $.param($.extend({},defaultParams, {brdid:"${paramVO.brdid}"}));
		$.post("/School/modEducationLikes", params, function(data){
			var msg = "";
			if(data == "Fail"){
				msg = "이미 추천하였습니다.";
			}else if(data == "Success"){
				msg = "추천하였습니다.";
			}else{
				msg = "오류가 발생하였습니다. 다시 시도해 주십시오.";
			}
			alert(msg);
			if(data == "Success"){
				location.reload(true);
			}else{
				return;
			}
		});
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
	console.log("title length: "+ length);
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
//댓글 추천/비추
function likes(like, repid){
	var url = "";
	var msg = "";
	if(like == 'Y'){
		url = "/School/modRepLikes";
	}else if(like == 'N'){
		url = "/School/modRepDislikes";
	}
	
	var params = $.extend({}, defaultParams, {repid:repid, userno:"${session.userno}"});
	
	$.post(url, params, function(data){
		var msg = "";
		if(like == 'Y'){
			if(data == "Fail"){
				msg = "이미 추천하였습니다.";
			}else if(data == "Success"){
				msg = "추천하였습니다.";
			}else{
				msg = "오류가 발생하였습니다. 다시 시도해 주십시오.";
			}
		}else if(like == "N"){
			if(data == "Fail"){
				msg = "이미 비추하였습니다.";
			}else if(data == "Success"){
				msg = "비추하였습니다.";
			}else{
				msg = "오류가 발생하였습니다. 다시 시도해 주십시오.";
			}
		}
		alert(msg);
		if(data == "Success"){
			location.reload(true);
		}else{
			return;
		}
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
	list-style-position: none ;
}
#educationDelete, #educationUpdate,#educationList{
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
			<div class="left_menu" style="float:left; width:150px; padding-top: 7px; margin-left: 40px;">
				<div id="l_first_title" style="font-weight: bold; border-right: 2px solid #910019; ">
					<div style="font-weight: bold; padding-left:5px; font-size: 110%; ">학업 <br/></div>
					<div style="clear:both;"></div>
					<ul id="title_list" style="list-style: none; padding-top:5px; padding-left: 10px; text-decoration: none;">
						<!--  <li style="display:hidden;"><a href="/School/pastWork">족보</a></li>-->
						<li><a id="current" href="/School/education?ptypeid=5">학업게시판</a></li>
					</ul>
				</div>
			</div>
			<div class="center_menu" style="float: left; margin-left: 35px; width: 700px;">
				
				<div id="education_main" style="width: 100%; border: 1px solid #cacaca; margin-top: 5px; padding: 10px; background-color: white;">
					<div id="education_title" style="width: 100%; background-color: lightgrey; font-size: 20px; padding:5px; border-top: 2px solid grey; ">
						<span id="title" style="font-weight:bold;">[${vo.typename}] ${vo.title }</span><span style="float: right; font-size:14px;"> ${vo.regdate }</span><br/>
					</div>
					<div id="education_extra" style="width:100%; background-color: white; padding:5px; font-size:12px;">
						<span style="float: left;">
							작성자: <b>${vo.writer }</b>
						</span>
						<span style="float: right;">
							조회수: ${vo.count} 추천: ${vo.likes} 
						</span>
					</div>
					
					<div style="clear:both;"></div>
					
					<div class="hr_dash" style="opacity: 0.3; background: grey;"></div>
					
					<div id="education_content" style="width:100%; min-height: 300px; margin-top:10px;">
						${vo.content }
					</div>
					
					<div style="clear:both;"></div>
					<div class="hr_dash" style="background:inherit;"></div>
					
					<div style="margin-top: 25px; text-align: center; margin-bottom: 20px;">
						<button id="likes" class="btn"><img src="/images/icon/thumbs-up.png" style="width:14px;"> 추천 ${vo.likes}</button>
					</div>
					<div class="hr_dash" style="background: grey;"></div>
					<div style="clear:both;"></div>
					
					<div style="float: left; width:100%;">
						<button class="btn delete" id="educationDelete" style="float: right; margin-top:5px; display:none;">삭제</button>
						<button class="btn confirm" id="educationList" style="float: right; margin-top: 5px;">목록</button>
						<button class="btn update" id="educationUpdate" style="float:right; margin-top:5px; display:none;">수정</button>	
					</div>
					
					<div style="clear:both;"></div>
					<div id="education_reply" style="margin-top:20px; border: 1px solid #cacaca; border-left:0; border-right:0;padding: 10px; font-size: 12px;">
						댓글쓰기<br/>
						<textarea id="reply" style="width:600px; height: 60px; text-align: left; overflow:auto; margin-top:5px; padding-top:5px;"></textarea>
						<button id="addReply" style="float: right;height:50px; margin-top: 8px; width: 50px;">등록</button>
					</div>
					
					<div style="height: 1px; background-color: lightgrey; width:100%; margin-top:15px;"></div>
					
					<c:forEach items="${reps }" var="rep">
						<div style="border-bottom: 1px solid lightgrey;padding-bottom: 15px; margin-top:15px; padding-left:12px;" id="${rep.repid}">
							<b>${rep.replier} </b> <span style="font-size:12px;">(${rep.repRegdate})</span>
							<span style="float:right;font-size:12px;">
								<a href="javascript:likes('Y', ${rep.repid})" style="font-size:12px;"><img src="/images/icon/thumbs-up.png" style="width:12px;"> ${rep.repLikes}</a> | 
								<a href="javascript:likes('N', ${rep.repid})" style="font-size:12px;"><img src="/images/icon/thumb-down.png" style="width:12px;"> ${rep.repDislikes}</a>
							</span>
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
