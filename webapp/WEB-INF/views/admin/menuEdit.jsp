<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	var objDialog = $("#menu_edit_dialog");
	$("#cancel").click(function(){
		objDialog.dialog('close');
	});
	$("#addMenu").click(function(){
		editMenu();
	});
});

function editMenu(){
	var url = "/Admin/editMenu";
	var params = $.extend({}, defaultParams, 
				{
				name:$("#typename").val(), 
				comment:$("#comment").val(), 
				ptypeid:$("#board_type").val(),
				useyn:$("#useyn").val()
				});
	var msg = "추가하였습니다.";
	if($("#id").text() != null && $("#id").text() != ''){
		params.id = $("#id").text();
		msg = "수정하였습니다.";
	}
	$.post(url, params, function(data){
		alert(msg);
		$("#menu_edit_dialog").dialog('close');
		reloadGrid(params.ptypeid);
	}).error(function(){
		
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
		<tbody>
			<tr style="display:none;">
				<td colspan="2"><span id="id"></span></td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" id="typename" style="width:65%; margin-right:2%;float:left;">
					<select id="useyn" style="width:32%;float:left;font-size:12px;">
						<option value="Y">사용</option>
						<option value="N">미사용</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>코멘트</th>
				<td><textarea id="comment" maxlength="255" style="width:100%;"></textarea></td>
			</tr>
		</tbody>
	</table>
	<div style="float:right; margin-top:15px;">
		<button id="addMenu">추가</button>
		<button id="editMenu" style="display:none;">수정</button>
		<button id="cancel">취소</button>
	</div>
</div>
