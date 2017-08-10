<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
var upImgIds = [];
$(document).ready(function(){
	console.log(defaultParams);
	$(".current").removeClass("current");
	$("#manMyOrg").addClass("current");
	
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
	
	$("#cancel").click(function(){
		var url = "/Admin/MyOrg";
		$(location).attr("href", url);
	});

	$("#editOrg").click(function(){
		var url = "/Org/modMyOrgData";
		var content = $("#content").summernote('code');
		if(params.title == null || params.title == ""){
			alert("이름을 입력하여 주십시오.");
			$("#orgname").focus();
			return;
		}
		if($("#content").summernote('isEmpty')){
			alert("자세한 소개를 입력하여 주십시오.");
			$("#content").summernote('focus');
			return;
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

function searchById(id){
	var objDialog = $("#searchDialog");
	objDialog.dialog({
		width:300,
		height:150,
		modal:true,
		title:"아이디 찾기",
		resizable:false,
		draggable:false,
		close:function(){
			$("#srchId").val('');
		}
	});
	switch(id){
	case 1:
		break;
	case 2:
		break;
	case 3:
		break;
	}
}

</script>
<style>
.left_ul>li{
border-bottom:1px solid black;
}
.right_menu>div{
border:1px dashed red; 
}
th{
padding-left:20px;
}
</style>
<!-- s:container -->
<div class="container">
	<jsp:include page="/WEB-INF/views/common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width:100%;"></div>
	<div class="row">
		<div class="main_body" style="overflow:hidden">
			<jsp:include page="./leftmenu.jsp"></jsp:include>
			<div id="right_menu" style="float:left; width:700px; margin-left:30px;">
				<table id="org_infos" style="width:100%;padding:10px;">
					<colgroup>
						<col width="20%">
						<col width="15%">
						<col width="20%">
						<col width="10%">
						<col width="15%">
						<col width="20%">
					</colgroup>
					<tbody>
						<tr>
							<td rowspan="4" style="padding:0px 10px;padding-left:0px;"><img src="/images/orgs/kusa.jpg" style="width:100%"></td>
							<th>이름</th>
							<td colspan="4"><input type="text" style="width:100%" id="orgname" value="${info.orgname}"></td>
						</tr>
						<tr>
							<th>회장</th>
							<td><span id="prname">${info.prname}</span>&nbsp;<button style="float:right;" onClick="javascript:searchById(1)">찾기</button></td>
							<th></th>
							<td></td>
							<td></td>
						</tr>	
						<tr>
							<th>부회장</th>
							<td><span id="vprname1">${info.vprname1}</span>&nbsp;<button style="float:right;" onClick="javascript:searchById(2)">찾기</button></td>
							<td></td>
							<th>부회장</th>
							<td><span id="vprname2">${info.vprname2}</span>&nbsp;<button style="float:right;" onClick="javascript:searchById(3)">찾기</button></td>
						</tr>
						<tr>
							<td colspan="5"><input type="file"></td>
						</tr>
						<tr>
							<td colspan="6">
							<div class="hr_dash"></div>
							</td>
						</tr>
						<tr style="padding-top:15px;margin-top:15px;">
							<td colspan="6"><b>한줄 소개</b><br/><textarea style="border:1px solid black;width:100%;margin-top:10px;">${info.comment}</textarea></td>
						</tr>
						<tr style="padding-top:15px;">
							<td colspan="6"><br/><b>상세 소개</b><br/><div style="margin-top:10px;"><textarea id="content"></textarea></div></td>
						</tr>
					</tbody>
				</table>
				<div class="buttons">
					<button class="btn" id="cancel" style="float: right;">취소</button>
					<button class="btn" id="editOrg" style="float: right;">수정</button>
				</div>
			</div>
			<div id="searchDialog" style="display:none; width:100%;">
				<div style="padding:10px; width:100%;">
					아이디: <input type="text" id="srchId">
					<button id="search" style="float:right">찾기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>

<!-- e:container -->