<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#userno_employer").hide();
	
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

	//delete
	if($("#userno_employer").text().localeCompare(defaultParams.userno)==0){
		$("#employerDelete").show();
	}else{
		$("#employerDelete").hide();
	}

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
	}
	
	$("#employerUpdate").click(function(){
		var url = "/Career/writeEmployer?";
		var params = $.param(defaultParams);
		$(location).attr("href", url+params);
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
#employerDelete, #employerUpdate,#employerList{
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
	<div class="hr_dash" style="width: 100%"></div>
	<div class="row">
		<div class="main_body" style="overflow: hidden;">
			<span id="userno_employer" value="${vo.userno}">${vo.userno}</span>
			<div class="left_menu" style="float:left; width:150px; padding-top: 7px; margin-left: 40px;">
				<div id="l_title" style="font-weight: bold;">
					<span style="font-weight: bold; margin-top: 10px; margin-left: 20px; font-size: 110%;">취업</span>
					<ul id="title_list" style="list-style:none; text-decoration: none;">
						<li><a id="current" href="/Career/">취업공고</a></li>
						<li><a href="/Career/employBoard">취업게시판</a></li>
					</ul>
				</div>
			</div>
			<div class="center_menu" style="float: left; margin-left: 35px; width: 700px;">
				
				
				<div style="clear:both;"></div>
				
				<div id="notice_main" style="width: 100%; border: 1px solid #cacaca; margin-top: 5px; padding: 10px; background-color: white;">
					<div id="notice_title" style="width: 100%; background-color: lightgrey; font-size: 20px; padding:5px; border-top: 2px solid grey; ">
						<b>${vo.title }</b> <span style="font-size: 14px; margin-left:20px;">&nbsp;접수기한: ${vo.deadline}</span> <span style="float: right; font-size:14px;"> ${vo.regdate }</span><br/>
					</div>
					<div id="notice_extra" style="width:100%; background-color: white; padding:5px; font-size:12px;">
						<span style="float: left;">
							작성자: <b>${vo.writer }</b>
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
						<button class="btn delete" id="employerDelete" style="float: right; margin-top:5px;">삭제</button>
						<button class="btn confirm" id="employerList" style="float: right; margin-top: 5px;">목록	</button>
						<button class="btn update" id="employerUpdate" style="float:right; margin-top:5px; display:none;">수정</button>	
					</div>
					
					<div style="clear:both;"></div>
					<div id="employer_reply" style="margin-top:20px; border-radius:2em; border: 1px solid #cacaca; padding: 10px; font-size: 12px;">
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
					
					<div style="clear:both;"></div>
				</div>
			</div>
		</div>
	</div>
</div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
    