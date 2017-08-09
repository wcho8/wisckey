<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	$("#searchPr").click(function(){
		searchById('pr');
	});
	$("#searchVpr").click(function(){
		searchById('vpr');
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
		bCheckPr = false;
	});
	
	/* $("#vprid").change(function(){
		bCheckVpr = false;
	}); */
	
	function searchById(prtype){
		var url = "/Member/searchById";
		var params = {};
		var id = "";
		switch(prtype){
		case 'pr':
			params.userid = $("#prid").val();
			break;
		case 'vpr':
			params.userid = $("#vprid").val();
			break;
		}
		$.post(url, params, function(data){
			if(data == null || data == ''){
				alert("찾을 수 없습니다.");
				return;
			}
			switch(prtype){
			case 'pr':
				if(confirm(data.korname  + " 이(가) 맞습니까?")){
					$("#prno").val(data.userno);
					$("#prname").text(data.korname);
					$("#prname").show();
					bCheckPr = true;
					break;
				}else{
					$("#prno").val("");
					return;
				}
			case 'vpr':
				if(confirm(data.korname  + " 이(가) 맞습니까?")){
					$("#vprno").val(data.userno);
					break;
				}else{
					$("#vprno").val("");
					return;
				}
			}
		}).error(function(){
			
		});
	}

	function key_false(){
		event.returnValue = false;
	}

	function addOrg(){
		var params = $("#dialog_contents").serialization();
		var url = "/Org/addOrgData";
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
		if(!bCheckPr){
			alert("회장이 필요합니다.");
			$("#prid").focus();
			return;
		}
		
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
				params = $.extend(params, {orgid:orgid});
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
			}	
		});
	}
});


</script>
<style type="text/css">
</style>
<div class="dialog">
	<table id="dialog_contents" style="padding:5px; width:100%;">
		<colgroup>
			<col width="20%" />
			<col width="*" />
		</colgroup>
		<tr>
			<th>타입</th>
			<td>
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
			<td>
				<input type="text" id="orgname" style="width:100%;">
			</td>
		</tr>
		<tr>
			<th>소개</th>
			<td>
				<textarea maxlength="100" id="comment" style="width:100%; height:100px;"></textarea>
			</td>
		</tr>
		<tr>
			<th>회장</th>
			<td>
				<input type="text" id="prid"><button id="searchPr" style="margin-left:15px;">찾기</button><br/>
				<div id="prname" style="display:none;"></div>
				<input type="text" id="prno" style="display:none;">
			</td>
		</tr>
		<tr>
			<th>부회장</th>
			<td>
				<input type="text" id="vprid"><button id="searchVpr" style="margin-left:15px;">찾기</button>
				<input type="text" id="vprno" style="display:none;">
			</td>
		</tr>
		<tr>
			<th>사진</th>
			<td>
				<form method="post" id="form_upload" name="form_upload" enctype="multipart/form-data">
					<div class="mt5">
						<label class="fileContainer">
							<div id="inputFile">
				    		 	<input type="text" id="filename" style="text-align:left; padding-left:5px !important;" />
           						<div style="cursor:pointer; border-color:#eee !important"><img alt="Search" width="16" height="16" src="/images/icon/attachment.png" /></div>
          						</div>
						    <input type="file" id="filedata" name="attach_file" class="upload" onkeypress="key_false()"/>
						</label>
			    	</div>
		    	</form>
			</td>
		</tr>
	</table>
	<div style="float:right;">
		<button id="add">추가</button>
		<button id="edit" style="display:none;">수정</button>
		<button id="cancel">취소</button>
	</div>
</div>
