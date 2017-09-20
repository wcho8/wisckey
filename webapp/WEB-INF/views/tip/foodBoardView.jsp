<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<script type="text/javascript">

$(document).ready(function(){
	var defaultParams={
			mypage: "${paramVO.mypage}",
			ptypeid: "${paramVO.ptypeid}"
	}
	$("#foodBoardList").click(function(){
		var params = $.param(defaultParams);
		$(location).attr("href", "/Tip/food?"+params);
	});
	
	$("#addReply").click(function(){
		var url = "/Tip/addFoodReply";
		var replyContent = $("#reply").val();
		var params = $.extend({}, defaultParams, {repContent:replyContent, userno:"${session.userno}", brdid:"${paramVO.brdid}"});
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
	
	$("#foodBoardDelete").click(function(){
		var url = "/Tip/delFoodBoardData";
		var params = $.extend({}, defaultParams, {brdid:"${paramVO.brdid}"});
		$.post(url, params, function(data){
			alert("게시글이 삭제되었습니다.");
			$(location).attr("href","/Tip/food?"+$.param(defaultParams));
		});
	});
	
	var writerno = "${vo.userno}";
	var userno = "${session.userno}";
	
	if(userno == writerno){
		$("#foodBoardUpdate").show();
		$("#foodBoardDelete").show();
	}
	$("#foodBoardUpdate").click(function(){
		var url = "/Tip/foodBoardWrite?";
		var params = $.param($.extend({}, defaultParams, {brdid:"${paramVO.brdid}"}));
		$(location).attr("href", url+params);
	});
	
	$("#likes").click(function(){
		var params = $.param($.extend({},defaultParams, {brdid:"${paramVO.brdid}"}));
		$.post("/Tip/modFoodLikes", params, function(data){
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
		$.post("/Tip/modFoodDislikes", params, function(data){
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
	var title = new String($("#title").text());
	var length = ~-encodeURI(title).split(/%..|./).length;
	//76바이트가 넘으면 alt
	if(length>90){
		$('span#title').attr('title',title);
		var title = cutInUTF8(title, 90);
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
		url = "/Tip/modRepLikes";
	}else if(like == 'N'){
		url = "/Tip/modRepDislikes";
	}
	var params = $.extend({}, defaultParams, {repid:repid, userno:"${session.userno}"});
	
	$.post(url, params, function(data){
		var msg = "";
		if(like == 'Y'){
			if(data == "Fail"){
				url = "/Tip/undoFoodBoardRepLikes";
				//TODO 컨트롤러에 만들기
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
				url = "/Tip/undoFoodBoardRepDislikes";
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

//TODO

//댓글 지우기
function delReply(repid){
	var url = "/Tip/delFoodBoardReply";
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
	
	var url = "/Tip/findFoodBoardReplyData";
	var params = $.extend({}, defaultParams, {repid:repid});
	$.post(url, params, function(data){
		$("#repText"+repid).val(data.repContent);
	});
}

//댓글 수정
function confirmUpdate(repid){
	var content = $("#repText"+repid).val();
	var url ="/Tip/modFoodBoardReply";
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
}

//답글 리스트 불러오기
function comment(repid, bOpen){
	if(bOpen == 'y'){
		$("#comment_div"+repid).show();
		$("#openCom"+repid).css('display','none');
		$("#closeCom"+repid).css('display','');
		var url = "/Tip/findFoodCommentList";
		var params = $.extend({}, defaultParams, {prepid:repid});
		$.post(url, params, function(data){
			$("#repList"+repid).append("<div style='height:1px;background-color:lightgrey;width:100%;margin-top:15px;'></div>")
			$.each(data, function(index, item){
				var y = 'Y';
				var n = 'N';
				var div = "";
					div +="	<div id='com" + item.repid + "' style='border-bottom:1px solid lightgrey;padding-bottom:15px;margin-top:15px;'>"
					div +="		<b>" + item.replier + "</b><span style='font-size:12px;'> (" + item.repRegdate+ ")</span>"
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
					div +="	</div>"
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
	
	var url = "/Tip/findFoodBoardReplyData";
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
	var content = $("#comTxt"+prepid).val();
	var url ="/Tip/modFoodBoardReply";
	var params = $.extend({}, defaultParams, {repid: repid, repContent:content});
	$.post(url, params, function(data){	
		var urlParams = $.param({brdid:"${paramVO.brdid}", mypage:"${paramVO.mypage}"});
		$(location).attr("href", "/Tip/FoodBoardView?"+urlParams +"#"+prepid);
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
	var url = "/Tip/addFoodReply";
	var params = $.extend({}, defaultParams, 
				{prepid:repid, 
				 brdid:"${paramVO.brdid}",
				 userno:"${session.userno}",
				 repContent:$("#comTxt"+repid).val()});
	$.post(url, params, function(data){
		var urlParams = $.param({brdid:"${paramVO.brdid}", mypage:"${paramVO.mypage}"});
		$(location).attr("href", "/Tip/FoodBoardView?"+urlParams +"#"+repid);
		location.reload(true);
	}).error(function(){
		alert();
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

#foodBoardDelete, #foodBoardUpdate,#foodBoardList{
	margin-left:5px; 
	line-height: 20px; 
	width:45px; 
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
	<div class="hr_dash" style="width: 84.3%;  margin-left: 100px;"></div>
	<div class="row">
		<div class="main_body" style="overflow: hidden;">
			<!--  <span id="userno_food" value="${vo.userno}" style="display:none;">${vo.userno}</span> -->
			<div class="left_menu" style="float:left; width:130px; padding-top: 7px; margin-left: 40px;">
				<div id="l_first_title" style="font-weight: bold; border-right: 2px solid #910019; ">
					<div style="font-weight: bold; padding-left:5px; font-size: 110%; ">깨알팁 <br/></div>
					<div style="clear:both;"></div>
					<ul id="title_list" style="list-style: none; padding-top:5px; padding-left: 10px; text-decoration: none;">
						<li><a id="current" href="/Tip/food">맛집</a></li>
						<li><a href="/Tip/market">벼룩시장</a></li>
					</ul>
				</div>
			</div>
			<div class="center_menu" style="float: left; margin-left: 35px; width: 700px;">
				
				<div id="foodBoard_main" style="width: 100%; border: 1px solid #cacaca; margin-top: 5px; padding: 10px; background-color: white;">
					<div id="foodBoard_title" style="width: 100%; background-color: lightgrey; font-size: 20px; padding:5px; border-top: 2px solid grey; ">
						<div style="display:inline-block;font-weight:bold; max-width: 70%; word-wrap:break-word;"><span id="title">[${vo.typename}]${vo.title }</span> </div>
						<span style="float: right; font-size:14px;"> ${vo.regdate }</span><br/>
					</div>
					<div id="foodBoard_extra" style="width:100%; background-color: white; padding:5px; font-size:12px;">
						<span style="float: left;">
							작성자: <b>${vo.writer }</b>
						</span>
						<span style="float: right;">
							조회수: ${vo.count} 
						</span>
					</div>
					
					<div style="clear:both;"></div>
					
					<div class="hr_dash" style="opacity: 0.3; background: grey;"></div>
					
					<div id="foodBoard_content" style="width:100%; min-height: 300px; margin-top:10px;">
						${vo.content }
					</div>
					<div style="margin-top:25px; text-align:center; margin-bottom:20px;">
						<button id="likes" class="btn"><img src="/images/icon/thumbs-up.png" style="width:14px;"> 추천 ${vo.likes}</button>
						<button id="dislike" class="btn"><img src="/images/icon/thumb-down.png" style="width:14px;"> 비추 ${vo.dislikes}</button>
					</div>
					<div class="hr_dash" style="background: grey;"></div>
					<div style="clear:both;"></div>

					<div style="float: left; width:100%;">
						<button class="btn delete" id="foodBoardDelete" style="float: right; display:none;"><span style="font-size:80%;">삭제</span></button>
						<button class="btn confirm" id="foodBoardList" style="float: right;"><span style="font-size:80%;">목록</span></button>			
						<button class="btn update" id="foodBoardUpdate" style="float:right; display:none;"><span style="font-size:80%;">수정</span></button>	
					</div>
					<div style="clear:both;"></div>
					<div id="foodBoard_reply" style="margin-top:20px; border-radius:2em; border: 1px solid #cacaca; padding: 10px; font-size: 12px;">
						댓글쓰기<br/>
						<textarea id="reply" style="width:600px; height: 60px; text-align: left; overflow:auto; border-radius: 1em; margin-top:5px; padding-top:5px;"></textarea>
						<button id="addReply" style="float: right;height:50px; width: 50px;">등록</button>
					</div>
					<div style="height: 1px; background-color: lightgrey; width:100%; margin-top:15px;"></div>
					
					<c:forEach items="${reps }" var="rep">
						<div style="border-bottom: 1px solid lightgrey;padding-bottom: 15px; margin-top:15px;" id="${rep.repid}">
							<b>${rep.replier} </b> <span style="font-size:12px;">(${rep.repRegdate})</span>
							
							<!-- 대댓글 시작 -->
							<c:set var="replierno" value="${rep.replierno }" />
							<c:set var="userno" value="${session.userno }" />
							<c:if test="${replierno == userno }">
							&nbsp;<a href="javascript:modReply(${rep.repid})" style="font-size:10px;" id="modRep${rep.repid}">
								<img src='/images/icon/edit.png' style="width:10px;" /></a>
							<a href="javascript:delReply(${rep.repid})" style="font-size:10px;" id="delRep${rep.repid}">
								<img src="/images/icon/cancel.png" style="width:10px;" /></a>
							</c:if>
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
									<input type="text" style="width:550px;" id="comTxt${rep.repid}">
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





<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
