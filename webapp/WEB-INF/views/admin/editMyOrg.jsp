<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
var upImgIds = [];
$(document).ready(function(){
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
	
	$("#content").summernote('code', '${details.details}');
	
	$("#cancel").click(function(){
		var url = "/Admin/MyOrg";
		$(location).attr("href", url);
	});

	$("#editOrg").click(function(){
		editOrgData();
	});
	
	$("#search").click(function(){
		searchId();
	});
	
	$("#srchId").keydown(function(key){
		if(key.keyCode == 13){
			searchId();
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
		title:"찾기",
		resizable:false,
		draggable:false,
		close:function(){
			$("#srchId").val('');
			$("#prOrVpr").text('');
		},
		open:function(){
			$("#prOrVpr").text(id);
		}
	});
}

function searchId(){
	var url = "/Member/searchById";
	var objDialog = $("#searchDialog");
	$.post(url, {userid:$("#srchId").val()}, function(data){
		if(data != null && data != '' ){
			var korname = data.korname;
			if(confirm(korname + "이(가) 맞습니까?")){
				switch($("#prOrVpr").text()){
				case "1":
					$("#prname").text(korname);
					$("#prno").text(data.userno);
					break;
				case "2":
					$("#vprname1").text(korname);
					$("#vprno1").text(data.userno);
					break;
				case "3":
					$("#vprname2").text(korname);
					$("#vprno2").text(data.userno);
					break;
				}
				objDialog.dialog('close');
			};
		}
	});
}

function editOrgData(){
	var url = "/Org/modMyOrgData";
	var details = $("#content").summernote('code');
	var params = $.extend({}, defaultParams, {
		prno:$("#prno").text(),
		vprno1:$("#vprno1").text(),
		vprno2:$("#vprno2").text(),
		details:$("#content").summernote('code'),
		comment:$("#comment").val(),
		orgname:$("#orgname").val(),
		orgid:"${paramVO.orgid}"
	});
	
	
	if(params.orgname == null || params.orgname == ""){
		alert("이름을 입력하여 주십시오.");
		$("#orgname").focus();
		return;
	}
	/* if($("#content").summernote('isEmpty')){
		alert("자세한 소개를 입력하여 주십시오.");
		$("#content").summernote('focus');
		return;
	} */
	if(params.prno == null || params.prno == ''){
		alert("회장이 필요합니다.");
		return;
	}
	if(params.comment == null || params.comment == ''){
		alert("간단한 소개가 필요합니다.");
		$("#comment").focus();
		return;
	}
	
	$.post(url, params, function(data){
	}).error(function(){
		alert("수정에 실패하였습니다. 다시 시도해 주십시오.");
	}).success(function(){
		$.post("/Org/addMyOrgDetail", params, function(data){
			alert("수정하였습니다.");
			$(location).attr("href", "/Admin/MyOrg");
		}).error(function(){
			alert("수정에 실패하였습니다. 다시 시도해 주십시오.");
		});
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
th{
padding-left:20px;
}
.btn{
padding:0px 6px;
font-size:12px;
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
						<tr style="display:none;">
							<td id="prno">${info.prno}</td>
							<td id="vprno1">${info.vprno1}</td>
							<td id="vprno2">${info.vprno2}</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td rowspan="4" style="padding:0px 10px;padding-left:0px;"><img id="org_img" src="" alt="없음" style="width:100%"></td>
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
							<td colspan="5">
								<input type="file">
							</td>
						</tr>
						<tr>
							<td colspan="6">
							<div class="hr_dash"></div>
							</td>
						</tr>
						<tr style="padding-top:15px;margin-top:15px;">
							<td colspan="6"><b>한줄 소개</b><br/><textarea id="comment" maxlength="100" style="border:1px solid black;width:100%;margin-top:10px;">${info.comment}</textarea></td>
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
				<div id="prOrVpr" style="display:none;"></div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>

<!-- e:container -->