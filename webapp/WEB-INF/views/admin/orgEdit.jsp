<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	$("#search").click(function(){
		searchId();
	});
	
	$("#srchId").keydown(function(key){
		if(key.keyCode == 13){
			searchId();
		}
	});
	$("#delete").click(function(){
		var url="/Org/deleteOrg";
		var orgid = $("#orgid").text();
		if(confirm("정말로 삭제하시겠습니까?")){
			$.post(url, {orgid:orgid}, function(data){
			}).success(function(){
				alert("삭제되었습니다.");
				$(location).reload(true);
			}).error(function(){
				alert("삭제에 실패하였습니다. 조금 후에 다시 시도해주세요.");
				$(location).reload(true);
			});
		}
	});
	
	$("#add").click(function(){
		addOrg();
	});
	$("#cancel").click(function(){
		$("#org_edit_dialog").dialog("close");
	});
	
	var bCheckPr = false;
	var bCheckVpr = false;
	
	$("#prid").change(function(){
		$("#prname").hide();
		$("#prname").text("");
		$("#bCheckPr").val('');
	});
	
	function key_false(){
		event.returnValue = false;
	}

	function addOrg(){
		var params = $("#dialog_contents").serialization();
		var url = "/Org/addOrgData";
		if($("#orgid").text() != null && $("#orgid").text() != ''){
			url = "/Org/modMyOrgData";
		}
		params = $.extend({}, params, {
			orgid: $("#orgid").text(),
			prno: $("#prno").text(),
			vprno1:$("#vprno1").text(),
			vprno2:$("#vprno2").text(),
			oldprno:$("#oldprno").text(),
			authid:$("#authid").text()
		});
		if(params.orgname == null || params.orgname == ""){
			alert("이름이 필요합니다.");
			$("#orgname").focus();
			return;
		}
		if(params.comment == null || params.comment == ""){
			alert("간단한 소개를 작성해 주십시오.");
			$("#comment").focus();
			return;
		}
		/* if(bCheckPr == null || bCheckPr == ''){
			alert("회장이 필요합니다.");
			$("#prid").focus();
			return;
		} */
		var bUploadFile = false;
		$('input[name="attach_file"]').each(function() {
			if ($(this).val() != "") {
				bUploadFile = true;
			}
		});
		
		$.post(url, params, function(data){
			orgid = data;
		}).done(function(){
			if (bUploadFile) {
				bUploadFile = false;
				/*
				* 비동기식 파일 업로드
				* jquery.form.js 파일을 추가 한 후 사용가능
				*/
				var objForm = $("form#form_upload");
				var url = "/Admin/addOrgFileData?";
				if(params.orgid != null && params.orgid != ''){
				}else{
					params = $.extend(params, {orgid:orgid});
				}
				url += $.param(params);
				objForm.attr("action",url);
				objForm.ajaxSubmit({
					dataType:"text",
					success:function(responseText) {
						if(responseText=="Success") {
							alert("추가되었습니다.");
							$(location).attr("href","/Admin/ManageOrg");
						} else if(responseText == "Fail") {
							alert("동아리 추가에 실패하였습니다.");
							$.post("/Admin/delOrg", params, function(data) {});
						} else if(responseText == "FileSizeFail") {
							alert("파일 사이즈가 10메가 이상일 수 없습니다.");
							$.post("/Admin/delOrg", params, function(data) {});
						}
					}
				});
			}else{
				$(location).attr("href","/Admin/ManageOrg");
			}
		});
	}
});


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
					$("#bCheckPr").text("1");
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


</script>
<style type="text/css">
</style>
<div class="dialog">
	<div id="bCheckPr" style="display:none;"></div>
	<table id="dialog_contents" style="width:100%;padding:10px;">
		<colgroup>
			<col width="20%">
			<col width="12%">
			<col width="23%">
			<col width="10%">
			<col width="15%">
			<col width="20%">
		</colgroup>
		<tbody>
			<tr style="display:none;">
				<td id="prno"></td>
				<td id="vprno1"></td>
				<td id="vprno2"></td>
				<td id="orgid"></td>
				<td id="oldprno"></td>
			</tr>
			<tr>
				<td rowspan="5" style="padding:0px 10px;padding-left:0px;"><img id="org_img" src="" style="width:100%"></td>
				<th>타입</th>
				<td colspan="4">
					<select id="orgtypeid">
						<option value="1">학술</option>
						<option value="2">취미</option>
						<option value="3">스포츠</option>
						<option value="4">종교</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td colspan="5"><input type="text" style="width:100%" id="orgname"></td>
			</tr>
			<tr>
				<th>회장</th>
				<td><span id="prname"></span>&nbsp;<button style="float:right;" onClick="javascript:searchById(1)">찾기</button></td>
				<th id="authid" style="display:none;"></th>
				<td></td>
				<td></td>
			</tr>	
			<tr>
				<th>부회장</th>
				<td>
					<span id="vprname1"></span>&nbsp;<button style="float:right;" onClick="javascript:searchById(2)">찾기</button>
				</td>
				<td></td>
				<th>부회장</th>
				<td>
					<span id="vprname2"></span>&nbsp;<button style="float:right;" onClick="javascript:searchById(3)">찾기</button>
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<form method="post" id="form_upload" name="form_upload" enctype="multipart/form-data">
						<div class="mt5">
						    <input type="file" id="filedata" name="attach_file" class="upload" onkeypress="key_false()"/>
				    	</div>
		    		</form>
				</td>
			</tr>
			<tr>
				<td colspan="6">
				<div class="hr_dash" style="margin:20px 0px;"></div>
				</td>
			</tr>
			<tr style="padding-top:15px;margin-top:15px;">
				<td colspan="6">
					<b>한줄 소개</b><br/>
					<textarea id="comment" maxlength="200" style="border:1px solid black;width:100%;margin-top:10px; height:80px;">${info.comment}</textarea>
				</td>
			</tr>
		</tbody>
	</table>
	<div style="float:right; margin-top:90px;">
		<button id="add">추가</button>
		<button id="delete">삭제</button>
		<button id="cancel">취소</button>
	</div>
	<div id="searchDialog" style="display:none; width:100%;">
		<div style="padding:10px; width:100%;">
			아이디: <input type="text" id="srchId">
			<button id="search" style="float:right">찾기</button>
		</div>
		<div id="prOrVpr" style="display:none;"></div>
	</div>
</div>
