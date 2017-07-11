<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
var upImgIds = [];
$(document).ready(function(){
	var defaultParams = {
			brdid: "${paramVO.brdid}",
			userno: "${session.userno}",
			mypage:"${paramVO.mypage}"
	};
	$('#content').summernote({
		lang: 'ko-KR',
		height: 400,
		callbacks:{
			onImageUpload: function(files){
				for(var i = files.length - 1; i >= 0; i--){
					sendFile(files[i], this);
				}
			}
		}
	});
	
	var brdid = defaultParams.brdid;
	var bEdit = false;
	if(brdid != 0 && brdid != '' && brdid != null){
		var url = "/Board/findBoardContent";
		bEdit = true;
		$.post(url, defaultParams, function(data){
			$("#title").val(data.title);
			$("#content").summernote('code', data.content);
		});
	}
	
	$("#addData").click(function(){
		var url = "/Board/addBoardData";
		var content = $("#content").summernote('code');
		var params = $.extend({}, $("#brdContent").serialization(), {frid:1,content:content}); //TODO: frid -> 보드 타입 (추가 개발 필요)
		if(params.title == null || params.title == ""){
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
			url = "/Board/modBoardData";
			params.brdid = brdid;
			$.post(url, params, function(data){
				$(location).attr("href", "/Board/BoardView?brdid="+data);
			});
		}else{
			$.post(url, params, function(data){
				$(location).attr("href", "/Board/BoardView?brdid="+data);
			});
		}
	});
});
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
			$(el).summernote('insertImage', url, function($image){
				$image.attr('id', fid);
			});
			upImgIds.push(fid);
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
</style>
<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width:100%;"></div>
	<div class="row">
		<div class="main_body">
			<div id="leftMenu_x" style="float:left; width:170px;">
				<div class="left_title" style="background-color:#475055; text-align:center; color:white;">왼쪽 타이틀 </div>
				<ul class="left_ul" style="list-style:none; padding-left:0px;">
					<li><a href="#">메뉴1</a></li>
					<li><a href="#">메뉴2</a></li>
				</ul>
			</div>
			<div id="right_menu" style="float:left; width:870px; margin-left:30px;">
				<div>
					<table style="width:100%;" id="brdContent">
						<colgroup>
							<col width="15%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>제목</th>
								<td><input type="text" id="title" style="width:100%;"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td style="min-height:400px;">
									<div id="content"></div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="buttons">
					<button class="fRight btn btn-primary" id="addData">등록</button>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>

<!-- e:container -->