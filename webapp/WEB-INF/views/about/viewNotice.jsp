<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="../common/header.jsp"></jsp:include>

<script type="text/javascript">


$(document).ready(function(){
	$("#userno_notice").hide();
	var defaultParams = {
			nid: "${paramVO.nid}",
			userno: "${session.userno}",
			nickname: "${session.nickname}",
			mypage:"${paramVO.mypage}"
	};
	console.log(defaultParams);
	
	if($("#userno_notice").text().localeCompare(defaultParams.userno)==0){
		$("#noticeDelete").show();
	}else{
		$("#noticeDelete").hide();
	}

	$("#noticeDelete").click(function(){
		var url = "/About/deleteNotice";
		var params = $.extend({}, defaultParams, {});
		$.post(url, params, function(data){
			alert("게시글이 삭제되었습니다.");
			$(location).attr("href","/About/");
		});
	});
	$.post("/About/listFourNotice", {}, function(data){
		$.each(data, function(index, item){
		
			var title = item.title;
			
			if(title.length>11){
				title = title.substring(0, 11);
				title += "...";
			}
			var li="";
			if(index<3){
				li ="<li  style='cursor: pointer;font-weight:bold; font-size:80%;' onClick='javascript:viewNotice("+ item.nid +");'>"
						+ ++index +'. '+ title +"</li>";
			}else{
				li ="<li  style='cursor: pointer;font-size:80%;' onClick='javascript:viewNotice("+ item.nid +");'>"
				+ ++index +'. '+ title +"</li>";
			}
			$("#notice_left").append(li);
			
		})
	});
	
	var writerno = "${vo.userno}";
	if(defaultParams.userno == writerno){
		$("#noticeUpdate").show();
	}
	$("#noticeUpdate").click(function(){
		var url = "/About/writeForm?";
		var params = $.param(defaultParams);
		$(location).attr("href", url+params);
	});
	$("#noticeList").click(function(){
		var url = "/About/";
		$(location).attr("href", url);
	});
});

function viewNotice(nid){
	var url = "/About/viewNotice?nid=" + nid;
	$(location).attr("href", url);
}

</script>
<style type="text/css">
#title_list_about li>a:hover {
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
#title_list_about li>a {
	opacity: 0.7;
	text-decoration: none;
	
}
/*
#l_first_title{
	border: 2px solid #808080;
	border-radius: 25px;
	padding-left: 10px;
	box-shadow: 2px 2px #778899;
}

#l_second_title{
	border: 2px solid #808080;
	border-radius: 25px;
	padding-left: 5px;
	box-shadow: 2px 2px #778899;
}
#title_list_notice>li{
	list-style-type:none;
	
}

*/
#title_list_about>li{
	list-style-type: disc; 
	list-style-position: inside;	
}
#noticeDelete, #noticeUpdate,#noticeList{
	margin-left:5px; 
	line-height: 17px; 
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
			<span id="userno_notice" value="${vo.userno}">${vo.userno}</span>
			<div id="left_menu" style="float: left; width: 130px;  padding-top: 7px; margin-left: 40px;"> 
				<div id="l_first_title" style="font-weight: bold; border-right: 2px solid #910019;">
					<div style="font-weight: bold; padding-left:5px; font-size: 110%; ">ABOUT <br/></div>
					<div style="clear:both;"></div>
					<ul id="title_list_about" style="list-style: none; padding-left: 10px; text-decoration: none; padding-top: 5px;">
						<li><a href="/About/introWisckey">위스키 소개</a></li>
						<li><a href="/About/introUniv">학교소개</a></li>
						<li><a id="current" href="/About/">공지사항</a></li>
						<li><a href="/About/otherSites">주요사이트</a></li>
					</ul>
				</div>
				<!-- 
				<div style="clear: both;"></div>
				<div id="l_second_title" style="font-size: 115%; margin-top: 20px; padding: 15px;">
					<span style="font-weight: bold;">공지사항 <br/></span>
					<ul id="title_list_notice" style=" padding-left: 5px; text-decoration: none; padding-top:5px;">
						<li id="notice_left" ></li>
					</ul>
				</div>
				 -->
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
					
					<div class="hr_dash" style="background: grey;"></div>
					
					<div id="notice_content" style="width:100%; min-height: 300px; padding-top: 20px; padding-left: 10px;">
						${vo.content }
					</div>
					
					<div class="hr_dash" style="background: grey;"></div>
					<div style="clear:both;"></div>

					<div style="float: left; width:100%;">
						<button class="btn delete" id="noticeDelete" style="float: right;"><span style="font-size:80%;">삭제</span></button>
						<button class="btn update" id="noticeUpdate" style="float:right; display:none;"><span style="font-size:80%;">수정</span></button>	
						<button class="btn confirm" id="noticeList" style="float: right;"><span style="font-size:80%;">목록</span></button>			
					</div>

					<div style="clear:both;"></div>
					<div class="hr_dash" style="background: grey;"></div>
					<div id="notice_reply" style="margin-top:20px; border-radius:2em; border: 1px solid #cacaca; padding: 10px; font-size: 12px;">
						댓글쓰기<br/>
						<textarea id="reply" style="width:600px; height: 60px; text-align: left; overflow:auto; border-radius: 1em; margin-top:5px; padding-top:5px;"></textarea>
						<button id="addReply" style="float: right;height:50px; width: 50px;">등록</button>
					</div>
					<div style="height: 1px; background-color: lightgrey; width:100%; margin-top:15px;"></div>
				</div>
			</div>
		</div>
	</div>
</div>
    
    
    
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
    