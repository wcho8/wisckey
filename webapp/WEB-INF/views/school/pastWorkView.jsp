<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#userno_pastWork").hide();
	
	var defaultParams={
			brdid: "${paramVO.brdid}",
			userno: "${session.userno}",
			nickname: "${session.nickname}",
			mypage: "${paramVO.mypage}"
	}
	
	$("#pastWorkList").click(function(){
		var params = $.param(defaultParams);
		$(location).attr("href", "/School/pastWork?"+params);
	});
	$("#addReply").click(function(){
		var url = "/School/addPastWorkReply";
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
	
	if($("#userno_pastWork").text().localeCompare(defaultParams.userno)==0){
		$("pastWorkDelete").show();
	}else{
		$("pastWorkDelete").hide();
	}
	$("#pastWorkDelete").click(function(){
		var url = "/School/deletePastWork";
		var params =$.extend({},defaultParams, {});
		$.post(url, params, function(data){
			alert("게시글이 삭제되었습니다.");
			$(location).attr("href","/School/pastWork");
		})
	});
	
	var writerno = "${vo.userno}";
	
	if(defaultParams.userno == writerno){
		$("#pastWorkUpdate").show();
	}
	
	$("#pastWorkUpdate").click(function(){
		var url = "/School/pastWorkWrite?";
		var params = $.param(defaultParams);
		$(location).attr("href", url+params);
	})
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
</style>


<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width: 84.3%; margin-left: 100px; "></div>
	<div class="row">
		<div class="main_body" style="overflow: hidden;">
			<span id="userno_pastWork" value="${vo.userno}">${vo.userno}</span>
			<div class="left_menu" style="float:left; width:150px; padding-top: 7px; margin-left: 40px;">
				<div id="l_first_title" style="font-weight: bold; border-right: 2px solid #910019; ">
					<div style="font-weight: bold; padding-left:5px; font-size: 110%; ">학업 <br/></div>
					<div style="clear:both;"></div>
					<ul id="title_list" style="list-style: none; padding-top:5px; padding-left: 10px; text-decoration: none;">
						<li><a id="current" href="/School/pastWork">족보</a></li>
						<li><a href="">학업게시판</a></li>
					</ul>
				</div>
			</div>
			<div class="center_menu" style="float: left; margin-left: 35px; width: 700px;">
				<div id="pastWork_main" style="width: 100%; border: 1px solid #cacaca; margin-top: 5px; padding: 10px; background-color: white;">
					<div id="pastWork_title" style="width: 100%; background-color: lightgrey; font-size: 20px; padding:5px; border-top: 2px solid grey; ">
						<b>${vo.title }</b><span style="float: right; font-size:14px;"> ${vo.regdate }</span><br/>
					</div>
					<div id="pastWork_extra" style="width:100%; background-color: white; padding:5px; font-size:12px;">
						<span style="float: left;">
							작성자: <b>${vo.writer }</b>
						</span>
						<span style="float: right;">
							조회수: ${vo.count}
						</span>
					</div>
					
					<div style="clear:both;"></div>
					
					<div class="hr_dash" style="background: grey;"></div>
					
					<div id="pastWork_content" style="width:100%; min-height: 300px; margin-top:10px;">
						${vo.content }
					</div>
					
					<div class="hr_dash" style="background: grey;"></div>
					<div id="pastWork_reply" style="margin-top:20px; border-radius:2em; border: 1px solid #cacaca; padding: 10px; font-size: 12px;">
						댓글쓰기<br/>
						<textarea id="reply" style="width:600px; height: 60px; text-align: left; overflow:auto; border-radius: 1em; margin-top:5px; padding-top:5px;"></textarea>
						<button id="addReply" style="float: right;height:50px; width: 50px;">등록</button>
					</div>
					
					<div style="height: 1px; background-color: lightgrey; width:100%; margin-top:15px;"></div>
					
					<c:forEach items="${reps }" var="rep">
						<div style="border-bottom: 1px solid lightgrey;padding-bottom: 15px; margin-top:15px;" id="${rep.repid}">
							<b>${rep.replier} </b> <span style="font-size:12px;">(${rep.repRegdate})</span>
							<br/>
						<span style="font-size:13px;margin-top:10px;">${rep.repContent}</span>
						</div>
					</c:forEach>
				</div>
				<div style="clear:both;"></div>
					<div style="float:hidden; margin-top: 10px; width:100%;">
						<button class="btn delete" id="pastWorkDelete" style="float: right; margin-top:5px;">삭제</button>
						<button class="btn confirm" id="pastWorkList" style="float: right; margin-top: 5px;">목록	</button>
						<button class="btn update" id="pastWorkUpdate" style="float:right; margin-top:5px; display:none;">수정</button>	
					</div>
			</div>
		</div>
	</div>
</div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>