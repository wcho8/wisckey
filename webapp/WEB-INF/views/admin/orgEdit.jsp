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
	})
});

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
		switch(prtype){
		case 'pr':
			if(confirm(data.korname  + " 이(가) 맞습니까?")){
				$("#prno").val(data.userno);
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
	});
}

function addOrg(){
	var params = $("#dialog_contents").serialization();
	var url = "/Org/addOrgData";
	if(params.orgname == null || params.orgname == ""){
		alert("이름이 필요합니다.");
		$("#orgname").focus();
		return;
	}
	$.post(url, params, function(data){
		alert("추가되었습니다.");
		$(location).attr("href","/Admin/ManageOrg");
	});
}
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
				<input type="text" id="prid"><button id="searchPr" style="margin-left:15px;">찾기</button>
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
				<input type="file" id="attach_file">
			</td>
		</tr>
	</table>
	<div style="float:right;">
		<button id="add">추가</button>
		<button id="edit" style="display:none;">수정</button>
		<button id="cancel">취소</button>
	</div>
</div>
