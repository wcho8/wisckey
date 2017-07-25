<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
<div class="dialog">
	<table id="dialog_contents" style="padding:5px; width:100%;">
		<colgroup>
			<col width="20%" />
			<col width="*" />
		</colgroup>
		<tr>
			<th>타입</th>
			<td>
				<select id="orgtype">
					<option value="1">학술</option>
					<option value="2">스포츠</option>
					<option value="3">취미</option>
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
			</td>
	</table>
</div>
