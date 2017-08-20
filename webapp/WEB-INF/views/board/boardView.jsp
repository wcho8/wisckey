<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	var defaultParams = {
		mypage: "${paramVO.mypage}",
		ptypeid: "${paramVO.ptypeid}"
	};
	
	var writerno = "${vo.userno}";
	var userno = "${session.userno}";
	
	if(userno == writerno){
		$("#update").show();
		$("#boardDelete").show();
	}else{
		$("#update").hide();
		$("#boardDelete").hide();
	}
	
	$("#update").click(function(){
		var params = $.param($.extend({},defaultParams, {brdid:"${paramVO.brdid}"}));
		var url = "/Board/BoardEdit?";
		$(location).attr("href", url+params);
	});
	
	$("#boardDelete").click(function(){
		var url = "/Board/delBoardData?";
		var params = $.param($.extend({},defaultParams, {brdid:"${paramVO.brdid}"}));
		if(confirm("정말로 삭제하시겠습니까?")){
			$.post(url, params, function(data){
				alert("삭제되었습니다.");
				$(location).attr("href", "/Board/?" + $.param(defaultParams));
			});	
		}
	});
	
	$("#boardList").click(function(){
		$(location).attr("href", "/Board/?" + $.param(defaultParams));
	});
	
	$("#likes").click(function(){
		var params = $.param($.extend({},defaultParams, {brdid:"${paramVO.brdid}"}));
		$.post("/Board/modBoardLikes", params, function(data){
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
	
	$("#dislike").click(function(){
		var params = $.param($.extend({},defaultParams, {brdid:"${paramVO.brdid}"}));
		$.post("/Board/modBoardDislikes", params, function(data){
			var msg = "";
			if(data == "Fail"){
				msg = "이미 비추하였습니다.";
			}else if(data == "Success"){
				msg = "비추하였습니다.";
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
	
	$("#addReply").click(function(){
		var url = "/Board/addBoardReply";
		var replyContent = $("#reply").val();
		var params = $.extend({}, defaultParams, {repContent:replyContent, brdid:"${paramVO.brdid}", userno:"${session.userno}"});
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

//댓글 추천/비추
function likes(like, repid){
	var url = "";
	var msg = "";
	if(like == 'Y'){
		url = "/Board/modRepLikes";
	}else if(like == 'N'){
		url = "/Board/modRepDislikes";
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
<style>
.left_ul>li{
	border-bottom:1px solid black;
}
.right_menu>div{
	border:1px dashed red; 
}
#boardDelete, #update,#boardList{
	margin-left:5px; 
	line-height: 20px; 
	width:40px; 
	vertical-align:middle; 
	padding:0px;
}
</style>
<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width:100%;"></div>
	<div class="row">
		<div class="main_body">
			<jsp:include page="./leftmenu.jsp"></jsp:include>
			<div id="right_menu" style="float:left; width:700px; margin-left:35px;">
				<div style="clear:both;"></div>
				<div id="main_board" style="width:100%;border:1px solid #cacaca;margin-top:5px;padding:10px;background-color:white;">
					<div id="boardTitle" style="width:100%; background-color:lightgrey;font-size:20px;padding:5px;border-top:2px solid grey;">
						<b>[${vo.typename}] ${vo.title}</b> <span style="float:right;font-size:14px;">${vo.regdate}</span><br/>
					</div>
					<div id="other_infos" style="width:100%;padding:5px;background-color:white;font-size:12px;">
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
					<div style="clear:both;"></div>
					<div style="float: left; width:100%;">
						<button class="btn delete" id="boardDelete" style="float: right; margin-top:5px;">삭제</button>
						<button class="btn confirm" id="boardList" style="float: right; margin-top: 5px;">목록	</button>
						<button class="btn update" id="update" style="float:right; margin-top:5px; display:none;">수정</button>	
					</div>
					<div style="clear:both;"></div>
					<div id="reply_box" style="margin-top:20px; border-radius:2em; border:1px solid #cacaca; padding:10px; font-size:12px;">
						댓글쓰기<br/>
						<textarea id="reply" style="width:600px;height:60px;text-align:left;overflow:auto;border-radius:1em;margin-top:5px;padding-top:5px;"></textarea>
						<button id="addReply" style="height:50px;width:50px;">등록</button>
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
