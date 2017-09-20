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
	
	if(window.location.hash != null || window.location.hash != ''){
		var hash = window.location.hash;
		var expandid = hash.split("#")[1];
		comment(expandid, 'y');
	}
	
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
		var params = $.param($.extend({},defaultParams, {brdid:"${paramVO.brdid}", userno:"${session.userno}"}));
		$.post("/Board/modBoardLikes", params, function(data){
			var msg = "";
			if(data == "Fail"){
				var url = "/Board/undoBoardLikes";
				$.post(url, params, function(data){
					msg = "추천 취소하였습니다.";
					alert(msg);
					if(data == 1){
						location.reload(true);
					}else{
						return;
					}			
				});
			}else if(data == "Success"){
				msg = "추천하였습니다.";
				alert(msg);
			}else{
				msg = "오류가 발생하였습니다. 다시 시도해 주십시오.";
				alert(msg);
			}
			if(data == "Success"){
				location.reload(true);
			}else{
				return;
			}
		});
	});
	
	$("#dislike").click(function(){
		var params = $.param($.extend({},defaultParams, {brdid:"${paramVO.brdid}",userno:"${session.userno}"}));
		$.post("/Board/modBoardDislikes", params, function(data){
			var msg = "";
			if(data == "Fail"){
				var url = "/Board/undoBoardDislikes";
				params.userno = "${session.userno}";
				$.post(url, params, function(data){
					msg = "비추천 취소하였습니다.";
					alert(msg);
					if(data == 1){
						location.reload(true);
					}else{
						return;
					}			
				});
			}else if(data == "Success"){
				msg = "비추하였습니다.";
				alert(msg);
			}else{
				msg = "오류가 발생하였습니다. 다시 시도해 주십시오.";
				alert(msg);
			}
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
		
		// 댓글익명
		var chk_rep_anonymous = "0";
				
		if ($("#rep_anonymous").is(':checked')) {
			chk_rep_anonymous = "1";
		}
		
		var params = $.extend({}, defaultParams, {repContent:replyContent, brdid:"${paramVO.brdid}", userno:"${session.userno}", chk_rep_anonymous:chk_rep_anonymous});
		
		//
		
		if(params.repContent == "" || params.repContent == null){
			alert("댓글은 공백일 수 없습니다.");
			return;
		}
		if(userno == "" || userno == null){
			alert("로그인하여 주십시오.");
			return;
		}else{
			//TODO 댓글익명
			$.post(url, params, function(data){
				alert("댓글이 등록되었습니다.");
				location.reload(true);
			});
		}
	});
	
	var title = new String($("#title").text());
	var length = ~-encodeURI(title).split(/%..|./).length;
	//76바이트가 넘으면 alt
	if(length>100){
		$('span#title').attr('title',title);
		var title = cutInUTF8(title, 100);
		title += "...";
		$("#title").text(title);
	}
	
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
				url = "/Board/undoBoardRepLikes";
				$.post(url, params, function(data){
					msg = "추천 취소하였습니다.";
					alert(msg);
					if(data == 1){
						location.reload(true);
					}else{
						return;
					}			
				});
			}else if(data == "Success"){
				msg = "추천하였습니다.";
				alert(msg);
			}else{
				msg = "오류가 발생하였습니다. 다시 시도해 주십시오.";
				alert(msg);
			}
		}else if(like == "N"){
			if(data == "Fail"){
				url = "/Board/undoBoardRepDislikes";
				$.post(url, params, function(data){
					msg = "비추천 취소하였습니다.";
					alert(msg);
					if(data == 1){
						location.reload(true);
					}else{
						return;
					}			
				});
			}else if(data == "Success"){
				msg = "비추하였습니다.";
				alert(msg);
			}else{
				msg = "오류가 발생하였습니다. 다시 시도해 주십시오.";
				alert(msg);
			}
		}
		if(data == "Success"){
			location.reload(true);
		}else{
			return;
		}

	});
}

//댓글 지우기
function delReply(repid){
	var url = "/Board/delBoardReply";
	var params = $.extend({}, defaultParams, {repid: repid});
	$.post(url, params, function(data){
		alert("댓글이 삭제되었습니다.");
		location.reload(true);
	});
}

//댓글 수정시에 불러오기
function modReply(repid){
	var text = $("#repText"+repid).val(); //답글 div에 아이디가 명확해야 그 div로 수정할 수 있음 --> repid를 추가하여 id를 만듬
	$("#repContent"+repid).css("display","none");
	$("#repText"+repid).show();
	$("#modBtn"+repid).show();
	$("#cancel"+repid).show();
	$("#comment"+repid).hide();
	$("#label"+repid).show();
	
	var url = "/Board/findBoardReplyData";
	var params = $.extend({}, defaultParams, {repid:repid});
	$.post(url, params, function(data){
		$("#repText"+repid).val(data.repContent);
	});
}

//댓글 수정
function confirmUpdate(repid){
	var content = $("#repText"+repid).val();
	var url ="/Board/modBoardReply";
	var params = $.extend({}, defaultParams, {repid: repid, repContent:content});
	$.post(url, params, function(data){	
		location.reload(true);
	});
}

//댓글 수정 취소
function cancelUpd(repid){
	$("#repContent"+repid).css("display","");
	$("#modBtn"+repid).hide();
	$("#cancel"+repid).hide();
	$("#repText"+repid).hide();
	$("#comment"+repid).show();
	$("#label"+repid).hide();
}

//답글 리스트 불러오기
function comment(repid, bOpen){
	if(bOpen == 'y'){
		$("#comment_div"+repid).show();
		$("#openCom"+repid).css('display','none');
		$("#closeCom"+repid).css('display','');
		var url = "/Board/findCommentList";
		var params = $.extend({}, defaultParams, {prepid:repid});
		$.post(url, params, function(data){
			$("#repList"+repid).append("<div style='height:1px;background-color:lightgrey;width:100%;margin-top:15px;'></div>")
			$.each(data, function(index, item){
				var y = 'Y';
				var n = 'N';
				var div = "";
					div +="	<div id='com" + item.repid + "' style='border-bottom:1px solid lightgrey;padding-bottom:15px;margin-top:15px;'>"
					
				if(item.chk_rep_anonymous == '1'){
					div +="<b>익명</b>" 
				}else if(item.chk_rep_anonymous == '0'){
					div +="	<b>"+item.replier+"</b>"
				}else{
					div +="	<b>"+item.replier+"</b>"
				}
					div +="			<span style='font-size:12px;'> (" + item.repRegdate+ ")</span>"
				if(item.replierno == "${session.userno}"){
					div +="		&nbsp;<a href='javascript:modComment(" + item.repid + ")' style='font-size:10px;' id=''>"
					div +="			<img src='/images/icon/edit.png' style='width:10px;' /></a>"
					div +="		<a href='javascript:delReply(" + item.repid + ")' style='font-size:10px;' id=''>"
					div +="			<img src='/images/icon/cancel.png' style='width:10px;' /></a>"
						}
					div +="		<span style='float:right;font-size:12px;'>"
					div +="			<a id='likes" + item.repid + "' style='font-size:12px;'><img src='/images/icon/thumbs-up.png' style='width:12px;'> " + item.repLikes + "</a> |"
					div +="			<a id='dislikes" + item.repid + "' style='font-size:12px;'><img src='/images/icon/thumb-down.png' style='width:12px;'> " + item.repDislikes + "</a>"
					div +="		</span>"
					div +="		<br/>"
					div +="		<div style='font-size:13px;margin-top:5px;word-break:break-all;width:100%;clear:both;' id='comm" + item.repid + "'>" + item.repContent + "</div>"
					div +=" </div>"
					div +="</div>"
				$("#repList"+repid).append(div);
				$("#likes"+item.repid).attr('href', "javascript:likes('Y', " + item.repid + ")"); //답글의 추천수 href
				$("#dislikes"+item.repid).attr('href', "javascript:likes('N', " + item.repid + ")");
			});
		});
	}else if(bOpen == 'n'){
		$("#comment_div"+repid).hide();
		$("#openCom"+repid).css('display','');
		$("#closeCom"+repid).css('display','none');
		$("#repList"+repid).empty();
	}
	$("#repList"+repid).show();
	$("#repReply"+repid).show();
}

//답글 수정시 불러오기
function modComment(repid){
	$("#com"+repid).hide();
	
	var url = "/Board/findBoardReplyData";
	var params = $.extend({}, defaultParams, {repid:repid});
	$.post(url, params, function(data){
		$("#comTxt"+data.prepid).val(data.repContent);
		$("#comTxt"+data.prepid).focus();
		$("#addCom"+data.prepid).attr("onclick", "javascript:updComment(" + data.prepid + ", " + data.repid + ")");
		$("#addCom"+data.prepid).text("수정");
	});
}

//답글 수정
function updComment(prepid, repid){
	var chk_rep_anonymous = "0";
	if ($("#com_anonymous").is(':checked')) {
		chk_rep_anonymous = "1";
	}
	alert(chk_rep_anonymous+"updateComment");
	var content = $("#comTxt"+prepid).val();
	var url ="/Board/modBoardReply";
	var params = $.extend({}, defaultParams, {repid: repid, repContent:content, chk_rep_anonymous:chk_rep_anonymous});
	$.post(url, params, function(data){	
		var urlParams = $.param({brdid:"${paramVO.brdid}", mypage:"${paramVO.mypage}"});
		$(location).attr("href", "/Board/BoardView?"+urlParams +"#"+prepid);
		location.reload(true);
	});
}

//답글 수정 취소
function cancelComment(repid){
	$("#comment"+repid).show();
	$("#comment_div"+repid).hide();
	$("#openCom"+repid).show();
	$("#closeCom"+repid).hide();
	$("#repList"+repid).empty();
	$("#comTxt"+repid).val('');
}

//답글 달기
function addComment(repid){
	var url = "/Board/addBoardReply";
	
	// 댓글익명
	var chk_rep_anonymous = "0";
	if ($("#com_anonymous"+repid).is(':checked')) {
		chk_rep_anonymous = "1";
	}
	alert(chk_rep_anonymous +"addComment");
	
	var params = $.extend({}, defaultParams, 
				{prepid:repid, 
				 brdid:"${paramVO.brdid}",
				 userno:"${session.userno}",
				 repContent:$("#comTxt"+repid).val(),
				 chk_rep_anonymous:chk_rep_anonymous});
	$.post(url, params, function(data){
		var urlParams = $.param({brdid:"${paramVO.brdid}", mypage:"${paramVO.mypage}"});
		$(location).attr("href", "/Board/BoardView?"+urlParams +"#"+repid);
		location.reload(true);
	}).error(function(){
		alert();
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
.commentList{
/* display:none; */
padding-left:10px;
width:100%;
}
.comment_div{
width:100%;
padding-top:12px;
}
.comment{
width:100%; 
background-color:#f3f3f3;
padding:1px 20px;
margin-top:12px;
clear:both;
padding-bottom:10px;
display:none;
}
</style>
<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width: 84.3%; margin-left: 100px; "></div>
	<div class="row">
		<div class="main_body">
			<jsp:include page="./leftmenu.jsp"></jsp:include>
			<div id="right_menu" style="float:left; width:700px; margin-left:35px;">
				<div style="clear:both;"></div>
				<div id="main_board" style="width:100%;border:1px solid #cacaca;margin-top:5px;padding:10px;background-color:white;">
					<div id="boardTitle" style="width:100%; background-color:lightgrey;font-size:20px;padding:5px;border-top:2px solid grey;">
						<div style="display:inline-block;font-weight:bold; max-width: 70%; word-wrap:break-word;"><span  id="title" >[${vo.typename}] ${vo.title }</span></div>
						<span style="float: right; font-size:14px;"> ${vo.regdate }</span><br/>					
					</div>
					<div id="other_infos" style="width:100%;padding:5px;background-color:white;font-size:12px;">
						<span style="float:left;">
							<c:choose>
							  <c:when test="${ vo.chk_anonymous == '1'    }">
							    작성자: <b>익명</b>
							  
							  </c:when>
							  <c:when test="${vo.chk_anonymous == '0'  }">
							작성자: <b>${vo.writer}</b>
							   
							  </c:when>
							  <c:otherwise>
							    do this when nothing else is true
							  </c:otherwise>
							</c:choose>
						
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
					<div id="reply_box" style="margin-top:20px;border: 1px solid #cacaca; border-left:0; border-right:0;padding: 10px; font-size: 12px;">
						<span>댓글쓰기 </span> 
						<div style="vertical-align: middle; width:70px; display: inline-block;">
							<label><input type="checkbox"  id = "rep_anonymous" style="vertical-align:middle; display:inline-block;width:15px; height:15px;margin-left: 5px;" checked="checked" />
							<span style="margin-left:3px;">익명</span></label>
						</div>
						<textarea id="reply" style="width:600px;height:60px;text-align:left;overflow:auto;border-radius:1em;margin-top:5px;padding-top:5px;"></textarea>
						<button id="addReply" style="height:50px;width:50px;">등록</button>
					</div>
					<div style="height:1px;background-color:lightgrey;width:100%;margin-top:15px;"></div>
					<c:forEach items="${reps}" var="rep">
						<div style="border-bottom:1px solid lightgrey;padding-bottom:15px;margin-top:15px;" id="${rep.repid}">
							  <c:if test="${ rep.chk_rep_anonymous == '1' }">
							    <b>익명</b>
							  </c:if>
							  <c:if test="${ rep.chk_rep_anonymous == '0'  }">
								<b>${rep.replier}</b>
							  </c:if>
							<span style="font-size:12px;"> (${rep.repRegdate})</span>
							
							<c:set var="replierno" value="${rep.replierno }" />
							<c:set var="userno" value="${session.userno }" />
							<c:if test="${replierno == userno }">
							&nbsp;<a href="javascript:modReply(${rep.repid})" style="font-size:10px;" id="modRep${rep.repid}">
								<img src='/images/icon/edit.png' style="width:10px;" /></a>
							<a href="javascript:delReply(${rep.repid})" style="font-size:10px;" id="delRep${rep.repid}">
								<img src="/images/icon/cancel.png" style="width:10px;" /></a>
							</c:if>
							<div style="vertical-align: middle; width: 70px; display:inline-block;">
								<label id="label${rep.repid}" style="display:none; margin-left: 5px;"><input type="checkbox"  id = "rep_anonymous${rep.repid}" style="vertical-align:middle; display:inline-block; width:15px; height:15px;" checked="checked" />
									<span style="font-size: 80%;padding-top:3px;">익명</span>
								</label>
							</div>
							<span style="float:right;font-size:12px;">
								<a href="javascript:likes('Y', ${rep.repid})" style="font-size:12px;"><img src="/images/icon/thumbs-up.png" style="width:12px;"> ${rep.repLikes}</a> | 
								<a href="javascript:likes('N', ${rep.repid})" style="font-size:12px;"><img src="/images/icon/thumb-down.png" style="width:12px;"> ${rep.repDislikes}</a>
							</span>
							<br/>
							<div style="font-size:13px;margin-top:5px;word-break:break-all;width:100%;clear:both;" id="repContent${rep.repid}">${rep.repContent}</div>
							<textarea style="width:89%; display:none; margin-top:12px;" id="repText${rep.repid}"></textarea>
							<a href="javascript:confirmUpdate(${rep.repid});"><img src="/images/icon/success.png" id="modBtn${rep.repid}" style="display:none; width:4%; margin-top:30px;"></a>
							<a href="javascript:cancelUpd(${rep.repid});"><img src="/images/icon/error.png" id="cancel${rep.repid}" style="display:none; width:4%; margin-top:30px;" /></a>
							
							<div style="width:100%;float:right;height:auto;margin-bottom:5px;" id="comment${rep.repid}">
								<a href="javascript:comment(${rep.repid},'y')" style="float:right;font-size:13px;" id="openCom${rep.repid}">답글<b style="color:#910019">(${rep.comCount})</b></a>
								<a href="javascript:comment(${rep.repid},'n')" style="float:right;font-size:13px;display:none;" id="closeCom${rep.repid}">답글<b>(${rep.comCount})</b></a>
							</div>
							<div class="comment" id="comment_div${rep.repid}">
								<div id="repList${rep.repid}" class="comment_list">
								</div>
								<div id="repReply${rep.repid}" class="comment_div">
									<div style="float:left; width:50px; vertical-align: middle; padding-top:5px;">
										<label><input type="checkbox"  id = "com_anonymous${rep.repid}" style="vertical-align:middle; display:inline-block; width:15px; height:15px;" checked="checked" />익명</label>
									</div>
									<input type="text" style="width:450px;" id="comTxt${rep.repid}">
									<button id="addCom${rep.repid}" onclick="javascript:addComment(${rep.repid})" class="btn btn-default" style="width:35px;padding:0px;margin-left:5px;font-size:12px;">등록</button>
									<button onclick="javascript:cancelComment(${rep.repid})" class="btn btn-default" style="width:35px;padding:0px;font-size:12px;">접기</button>
								</div>
							</div>
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
