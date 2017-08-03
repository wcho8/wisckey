<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	$("#edit").click(function(){
		editOrg();
	});
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
				<div id="orgtype"></div>
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<div id="orgname"></div>
			</td>
		</tr>
		<tr>
			<th>소개</th>
			<td>
				<div id="comment"></div>
			</td>
		</tr>
		<tr>
			<th>회장</th>
			<td>
				<div id="prname"></div>
			</td>
		</tr>
		<tr>
			<th>부회장</th>
			<td>
				<div id="vprname"></div>
			</td>
		</tr>
	</table>
	<div style="float:right;">
		<button id="edit">수정</button>
	</div>
</div>
