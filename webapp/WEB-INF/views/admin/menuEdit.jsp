<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
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
		<tbody>
			<tr>
				<th>이름</th>
				<td><input type="text" id="typename"></td>
			</tr>
			<tr>
				<th>코멘트</th>
				<td><textarea id="comment" maxlength="255"></textarea></td>
			</tr>
		</tbody>
	</table>
	<div style="float:right;">
		<button id="add">추가</button>
		<button id="edit" style="display:none;">수정</button>
		<button id="cancel">취소</button>
	</div>
</div>
