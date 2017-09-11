<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
var upImgIds = [];
$(document).ready(function() {
	var defaultParams ={
			mypage: "${paramVO.mypage}"
	}
	$('#content').summernote({
		lang:'ko-KR',
		height: 400,
		disableResizeEditor:true,
		callbacks:{
			onImageUpload: function(files){
				for(var i = files.length-1; i>=0; i--){
					sendFile(files[i], this);
 			    }
			}
		}
	});
		
	var nid = "${paramVO.nid}";
	var userno = "${session.userno}";
	var bEdit = false;
	if(nid!=0 && nid!="" && nid!=null){
		var url="/About/findAboutContent";
		bEdit = true;
		var params = $.extend({}, defaultParams, {nid: nid});
		$.post(url, params, function(data){
			if(userno != data.userno || userno  == null){
				alert("수정할 수 있는 권한이 없습니다.");
				$(location).attr("href", "/About/?" + $.param(defaultParams));
			}else{
				$("#title").val(data.title);
				$("#content").summernote('code', data.content);
			}
		});
	}
	
	$("#cancel").click(function(){
		var url = "/About/?";
		var params = $.param(defaultParams);
		$(location).attr("href", url+params);
	});
	
	$("#addData").click(function() {
		var url = "/About/addNewNotice";
		var content = $("#content").summernote('code');
		var params = $.extend({}, $("#notice_info").serialization(), {nid:nid,content:content, userno: "${session.userno}"});
			
		if(params.title == null||params.title==""){
			alert("제목을 입력하여 주십시오.");
			$("#title").focus();
			return;
		}
		if($("#content").summernote('isEmpty')){
			alert("내용을 입력하여 주십시오.");
			$("#content").summernote('focus');
			return;
		}
		if(bEdit){
			url = "/About/modAboutData";
			$.post(url, params, function(data) {
				$(location).attr("href", "/About/viewNotice?nid="+nid);
			});
		}else{
			$.post(url, params, function(data){
				$(location).attr("href", "/About/viewNotice?nid="+nid);
			});
		}
	});
	
});
function viewNotice(nid){
	var url = "/About/viewNotice?nid=" + nid;
	$(location).attr("href", url);
}
function toNoticeList(){
	var url="/About/";
	$(location).attr("href", url);
}
function sendFile(file, el){
	var data = new FormData();
	data.append('file', file);
	$.ajax({
		data: data,
		type: "POST",
		url: "/Image/uploadImageFile",
		cache: false,
		contentType: false,
		enctype: 'multipart/form-data',
		processData: false,
		success: function(fid){
			var url = "/Image/loadImage/" + fid;
			if(fid == 0){
				alert("이미지가 너무 큽니다. 5MB 이하만 첨부하실 수 있습니다.");
				return;
			}
			$(el).summernote('insertImage', url, function($image){
				$image.attr('id', fid);
				$image.css('width', '80%');
			});
			upImgIds.push(fid);
		},
		error:function(error){
			alert(error);
		}
	});
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
#title_list_about>li{
	list-style-type: disc; 
	list-style-position: inside;	
}
#center{
	border: 2px solid #808080;
	border-radius: 25px;
	padding-left: 10px;
	box-shadow: 2px 2px #778899;
	margin-left: 30px;
}
</style>


<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width: 84.3%; margin-left: 100px; "></div>
	<div class="row">
		<div class="main_body" style="overflow: hidden;">
			<div id="left_menu" style="float: left; width: 130px; padding-top: 7px; margin-left: 40px;"> <!-- -20px -->
				<div id="l_first_title" style="font-weight: bold; border-right: 2px solid #910019;">
					<div style="font-weight: bold; padding-left:5px; font-size: 110%; ">ABOUT <br/></div>
					<div style="clear:both;"></div>
					<ul id="title_list_about" style="list-style: none; padding-top: 5px;padding-left: 10px; text-decoration: none;">
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

			<div class="center_menu" style="float: left; margin-left: 30px; width: 700px;">	
				
				<table id="notice_info" style="width: 700px;">
					<colgroup>
						<col width="15%">
						<col width="*">
					</colgroup>
					<tr style="border: 1px solid #ccc">
						<td style="text-align: center; width: 150px;">제목</td>
						<td><input type="text" id="title" style="width: 300px"></input>
					</tr>
					<tr style="border: 1px solid #ccc">
						<td style="text-align: center; width: 150px;">내용</td>
						<td><textarea id="content" style="width: 100%; height: 200px; text-align: left;"></textarea></td>
					</tr>
				</table>	
				<div style="float: right;">
					<button class="btn confirm" id="NoticeList" style="width: 50px; margin-top: 5px; line-height: 20px; vertical-align:middle; padding:0px;"
						 onClick="javascript:toNoticeList()">
						<span style="font-size:80%;">목록</span>	
					</button>			
					<button type="button" class="btn confirm" id="addData" style="width: 50px; margin-top: 5px; line-height: 20px; 
						vertical-align:middle; padding:0px;">
						<span style="font-size:80%;">등록</span> 	
					</button>
				</div>
			
			</div>
		</div>
	</div>
</div>



<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
