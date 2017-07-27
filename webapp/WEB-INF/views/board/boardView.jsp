<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	var defaultParams = {
		brdid: "${paramVO.brdid}",
		userno: "${session.userno}",
		nickname: "${session.nickname}",
		mypage: "${paramVO.mypage}"
	};
	
	var writerno = "${vo.userno}";
	
	if(defaultParams.userno == writerno){
		$("#update").show();
	}
	
	$("#update").click(function(){
		var url = "/Board/BoardEdit?";
		var params = $.param(defaultParams);
		$(location).attr("href", url+params);
	})
	
	$("#boardList").click(function(){
		var params = $.param(defaultParams);
		$(location).attr("href", "/Board/?"+params);
	});
	
	$("#likes").click(function(){
		$.post("/Board/modBoardLikes", defaultParams, function(data){
			if(data > 0){
				alert("추천하였습니다.");
				location.reload(true);
			}
		});
	});
	
	$("#dislike").click(function(){
		$.post("/Board/modBoardDislikes", defaultParams, function(data){
			if(data > 0){
				alert("비추하였습니다.");
				location.reload(true);
			}
		});
	})
	
	$("#addReply").click(function(){
		var url = "/Board/addBoardReply";
		var replyContent = $("#reply").val();
		var params = $.extend({}, defaultParams, {repContent:replyContent});
		if(params.repContent == "" || params.repContent == null){
			alert("댓글은 공백일 수 없습니다.");
			return;
		}
		if(params.userno == "" || params.userno == null){
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

//댓글 추천/비추
function likes(like, repid){
	var url = "";
	var msg = "";
	if(like == 'Y'){
		url = "/Board/modRepLikes";
		msg = "추천하였습니다.";
	}else if(like == 'N'){
		url = "/Board/modRepDislikes";
		msg = "비추하였습니다.";
	}
	var params = $.extend({}, defaultParams, {repid:repid});
	
	$.post(url, params, function(data){
		alert(msg);
		location.reload(true);
	});
}

</script>
<style>
.left_ul>li{
border-bottom:1px solid black;
}
.right_menu>div{
border:1px dashed red; 
}
</style>
<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width:100%;"></div>
	<div class="row">
		<div class="main_body">
			<div id="leftMenu_x" style="float:left; width:170px; height:250px; border-radius:2em; border:1px solid #cacaca;background-color: white; padding:5px;">
				<div class="left_title" style="text-align:center;margin-top:10px;border-bottom:1px solid lightgrey;">자유 게시판 </div>
				<ul class="left_ul" style="list-style:none; padding-left:0px;">
					<li><a href="#">게시판</a></li>
					<li><a href="#">갤러리</a></li>
				</ul>
			</div> 
			<div id="right_menu" style="float:left; width:870px; margin-left:30px;">
				<div style="float:left; width:100%;">
					<button class="btn btn-default" id="boardList" style="float:right;">목록</button>
					<button id="update" style="float:right;display:none;" class="btn btn-default">수정</button>
				</div>
				<div style="clear:both;"></div>
				<div id="main_board" style="width:100%;border:1px solid #cacaca;margin-top:5px;padding:10px;background-color:white;">
					<div id="boardTitle" style="width:100%; background-color:lightgrey;font-size:20px;padding:5px;border-top:2px solid grey;">
						<b>[${vo.typename}] ${vo.title}</b> <span style="float:right;font-size:14px;">${vo.regdate}</span><br/>
					</div>
					<div id="other_infos" style="width:100%;padding:5px;font-size:12px;">
						<span style="float:left;">
							작성자: <b>${vo.writer}</b>
						</span>
						<span style="float:right;">
							조회수: ${vo.count} 추천: ${vo.likes} 비추: ${vo.dislikes} 댓글: ${repCnt} <!-- 비추 + 댓글 필요 --> 
						</span>
					</div>
					<div style="clear:both;"></div>
					<div class="hr_dash" style="background:grey;"></div>
					<div id="textContent" style="width:100%; min-height:250px;margin-top:10px;">
						${vo.content}
					</div>
					<div style="margin-top:25px; text-align:center; margin-bottom:20px;">
						<button id="likes" class="btn"><img src="/images/icon/thumbs-up.png" style="width:14px;"> 추천 ${vo.likes}</button>
						<button id="dislike" class="btn"><img src="/images/icon/thumb-down.png" style="width:14px;"> 비추 ${vo.dislikes}</button>
					</div>
					<div class="hr_dash" style="background:grey;"></div>
					<div id="reply_box" style="margin-top:20px; border-radius:2em; border:1px solid #cacaca; padding:10px; font-size:12px;">
						댓글쓰기<br/>
						<textarea id="reply" style="width:750px;height:60px;text-align:left;overflow:auto;border-radius:1em;margin-top:5px;padding-top:5px;"></textarea>
						<button id="addReply" style="height:60px;width:65px;">등록</button>
					</div>
					<div style="height:1px;background-color:lightgrey;width:100%;margin-top:15px;"></div>
					<c:forEach items="${reps}" var="rep">
						<div style="border-bottom:1px solid lightgrey;padding-bottom:15px;margin-top:15px;" id="${rep.repid}">
							<b>${rep.replier}</b><span style="font-size:12px;"> (${rep.repRegdate})</span>
							<span style="float:right;font-size:12px;">
								<a href="javascript:likes('Y', ${rep.repid})" style="font-size:12px;"><img src="/images/icon/thumbs-up.png" style="width:12px;"> ${rep.repLikes}</a> | 
								<a href="javascript:likes('N', ${rep.repid})" style="font-size:12px;"><img src="/images/icon/thumb-down.png" style="width:12px;"> ${rep.repDislikes}</a>
							</span>
							<br/>
							<span style="font-size:13px;margin-top:10px;word-break:break-all;width:100%;">${rep.repContent}</span>
						</div>
					</c:forEach>
					<div style="clear:both;"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>

<!-- e:container -->