<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
$(document).ready(function(){
	var defaultParams={
		mypage: "${paramVO.mypage}",
	};
	
	//editor
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
	
	$("#cancel").click(function(){
		var url = "/tips?";
		var params = $.param(defaultParams);
		$(location).attr("href", url+params);
	});
	
	//modify
	var brdid = "${paramVO.brdid}";
	var bEdit = false;
	
	if(brdid!=0 && brdid!="" && brdid!=null){
		var url="/Tip/findTipsContent";	//TODO mapper
		bEdit = true;
		var params = $.extend({}, defaultParams, {brdid:brdid});
		$.post(url, params, function(data){
			$("#title").val(data.title);
			$("#content").summernote('code', data.content);
		});
	}
	
	// upload to DB
	$("#addTipsBoard").click(function(){ 
		var url = "/Tip/addTipsData";
		var content = $("#content").summernote('code');
		var tipid = $("#tipid").val();
		
		var params = $.extend({}, $("#tipsBoardContent").serialization(), { tipid:tipid, content:content});	//공통코드테이블 아이
		
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
		if(bEdit){	//edit
			url = "/Tip/modTipsData";
			params.brdid = brdid;
			$.post(url, params, function(data){
				var urlParams = $.param({brdid:data, ptypeid:"${paramVO.ptypeid}"});
				$(location).attr("href", "/Tip/tipsBoardView?" + urlParams);
			});
		}else{
			$.post(url, params, function(data){
				var urlParams = $.param({brdid:data, ptypeid:"${paramVO.ptypeid}"});
				$(location).attr("href", "/Tip/tipsBoardView?" + urlParams);
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
			if(fid == 0){
				alert("이미지가 너무 큽니다. 5MB 이하만 첨부하실 수 있습니다.");
				return;
			}
			$(el).summernote('insertImage', url, function($image){
				$image.attr('id', fid);
				$image.css('width', "80%");
			});
			upImgIds.push(fid);
		},
		error: function(error){
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

</style>
<!-- s:container -->
<div class="container">
	<jsp:include page="/WEB-INF/views/common/top.jsp"></jsp:include>
	<div class="hr_dash"style="width: 84.3%;  margin-left: 100px;"></div>
	<div class="row">
		<div class="main_body" style="overflow:hidden">
			<jsp:include page="./leftmenu.jsp"></jsp:include>
			<div id="right_menu" style="float:left; width:700px; margin-left:35px;">
				<table style="width:100%;" id="tipsBoardContent">
					<colgroup>
						<col width="15%" >
						<col width="*">
					</colgroup>
					<tbody>
						<!-- 말머리 -->
						<tr style="border: 1px solid #ccc;">
							<th style="text-align: center;">말머리</th>
							<td>
								<select id="tipid">
									<c:forEach items="${tiptypes}" var="tiptype">
										<option value="${tiptype.tipid}">${tiptype.typename}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr style="border: 1px solid #ccc;">
							<th  style="text-align: center;"> 제목</th>
							<td><input type="text" id="title" style="width:400px;;"></td>
						</tr>
						<tr style="border: 1px solid #ccc;">
							<th  style="text-align: center;">내용</th>
							<td style="padding-top: 8px; padding-bottom: 8px;">
								<textarea id="content" style="width:100%; height:400px; display:none;" valid="내용"></textarea>
							</td>
							
						</tr>
					</tbody>
				</table>
			<div class="buttons">
				<button class="fRight btn btn-default" id="cancel" style="padding:3px 9px; font-size:13px;">취소</button>
				<button class="fRight btn btn-default" id="addTipsBoard" style="padding:3px 9px; font-size:13px;">등록</button>
			</div>
			
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>