<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef:oEditors,
		elPlaceHolder:"content",
		sSkinURI:"/include/SmartEditor/SmartEditor2Skin.html",	
		htParams:{
			bUseToolbar:true
		},
		fCreator:"createSEditor2"
	});
	
	$("#addData").click(function(){
		var url = "/Board/addBoardData";
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		var params = $.extend({}, $("#brdContent").serialization(), {frid:1});
		$.post(url, params, function(data){
			$(location).attr("href", "/Board/");
		});
	});
});
</script>
<style>
.left_ul>li{
border-bottom:1px solid black;
}
.right_menu>div{
border:1px dashed red; 
}
</style>
<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width:100%;"></div>
	<div class="row">
		<div class="main_body">
			<div id="leftMenu_x" style="float:left; width:170px;">
				<div class="left_title" style="background-color:#475055; text-align:center; color:white;">왼쪽 타이틀 </div>
				<ul class="left_ul" style="list-style:none; padding-left:0px;">
					<li><a href="#">메뉴1</a></li>
					<li><a href="#">메뉴2</a></li>
				</ul>
			</div>
			<div id="right_menu" style="float:left; width:870px; margin-left:30px;">
				<div>
					<table style="width:100%;" id="brdContent">
						<colgroup>
							<col width="15%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>제목</th>
								<td><input type="text" id="title" style="width:100%;"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea id="content" style="width:100%; height:400px; display:none;" valid="내용"></textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="buttons">
					<button class="fRight btn btn-primary" id="addData">등록</button>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>

<!-- e:container -->