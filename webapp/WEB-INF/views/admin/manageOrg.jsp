<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	var objGrid = $("#grid_table");
	var url = "/Admin/findOrgList";
	objGrid.jqGrid({
		url: url,
		width:875,
		height:"auto",
		postData:{},
		datatype:"json",
		mtype:"post",
		jsonReader:{repeatitems:false},
		colNames:[
		          "번호",
		          "이름",
		          "설명",
		          "등록일",
		          "회장",
		          "부회장",
		          "동아리 타입"
		          ],
		colModel:[
		          {name:"orgid", width:50},
		          {name:"name", width:150},
		          {name:"comment", width:150},
		          {name:"regdate", width:150},
		          {name:"prname", width:50},
		          {name:"vprname", width:50},
		          {name:"orgtype", width:50}
		          ],
		caption:"동아리 관리",
		hidegrid:false,
		viewrecords:true,
		shrinkToFit:true,
		grouping:true,
		groupingView:{
			groupField : ['orgtype']
			, groupColumnShow:[false]
			, groupText : ['<b>동아리 타입: {0} ( {1}개 )</b>']
			, groupCollapse:false
		}
	});
	
	$("#addOrg").click(function(){
		editOrg();
	});
});

function editOrg(){
	$("#dialog_container").dialog({
		title:'동아리 추가',
		modal:true,
		width:600,
		height:400,
		resize:false
	});
}
</script>
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
				<div style="width:100%; float:left; padding:0px;">
					<table style="float:left; width:100%;" id="grid_table"></table>
				</div>
				<div style="float:right; margin-top:10px;">
					<button id="addOrg">추가</button>
				</div>
			</div>
			<div id="dialog_container" style="display:none;">
				<jsp:include page="./orgEdit.jsp" flush="false"></jsp:include>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
<!-- e:container -->