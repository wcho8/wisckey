<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
var bEdit = false;	
$(document).ready(function(){
	$(".current").removeClass("current");
	$("#manOrg").addClass("current");
	var objGrid = $("#grid_table");
	var url = "/Org/findOrgList";
	objGrid.jqGrid({
		url: url,
		width:875,
		height:"auto",
		postData:{},
		datatype:"json",
		mtype:"post",
		jsonReader:{repeatitems:false},
		colNames:[
		          "이름",
		          "한줄 소개",
		          "등록일",
		          "회장",
		          "부회장",
		          "동아리 타입"
		          ],
		colModel:[
		          {name:"orgname", width:120, sortable:false},
		          {name:"comment", width:475, sortable:false},
		          {name:"regdate", width:80, sortable:false},
		          {name:"prname", width:100, sortable:false},
		          {name:"vprname", width:100, sortable:false},
		          {name:"orgtype", width:100, sortable:false}
		          ],
		caption:"동아리 관리",
		resizable:false,
		hidegrid:false,
		viewrecords:true,
		shrinkToFit:true,
		grouping:true,
		groupingView:{
			groupField : ['orgtype']
			, groupColumnShow:[false]
			, groupText : ['<b>{0} ( {1}개 )</b>']
			, groupCollapse:false
		}
	});
	
	objGrid.jqGrid("setGridParam", {
		onSelectRow:function(row, status, event){
			var rowData = objGrid.jqGrid("getRowData", row);
			bEdit = true;
			editOrg(rowData);
		},
		onRightClickRow:function(){
			objGrid.jqGrid('resetSelection');
			return false;
		}
	})
	
	$("#addOrg").click(function(){
		bEdit = false;
		editOrg(bEdit);
	});
});

function editOrg(data){
	var title = '';
	var objDialog = "";
	if(bEdit){
		title = "동아리 정보";
		objDialog = $("#org_edit_dialog");
	}else{
		title = "동아리 추가";
		objDialog = $("#org_edit_dialog");
	}
	objDialog.dialog({
		title:title,
		modal:true,
		width:600,
		height:400,
		resizable:false,
		draggable:false,
		open:function(){
			if(bEdit){
				var params = data;
				$("#orgtype").val(data.orgtype);
				$("#orgname").val(data.orgname);
				$("#comment").text(data.comment);
				$("#prname").val(data.prname);
				$("#vprname").val(data.vprname);
			}
		},
		close:function(){
			$("#orgtype").empty();
			$("#orgname").val("");
			$("#comment").val("");
			$("#prname").val("");
			$("#vprname").val("");
		}
	});
}
</script>
<style>
.ui-jqgrid tr.jqgrow > td, .ui-jqgrid tr.jqgroup > td, .ui-jqgrid tr.jqfoot > td, .ui-jqgrid tr.ui-subgrid > td, .ui-jqgrid tr.ui-subtblcell > td{
	white-space:nowrap;
}
</style>
<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width:100%;"></div>
	<div class="row">
		<div class="main_body">
			<jsp:include page="./leftmenu.jsp"></jsp:include>
			<div id="right_menu" style="float:left; width:870px; margin-left:30px;">
				<div style="width:100%; float:left; padding:0px;">
					<table style="float:left; width:100%;" id="grid_table"></table>
				</div>
				<div style="float:right; margin-top:10px;">
					<button id="addOrg">추가</button>
				</div>
			</div>
			<div id="org_edit_dialog" style="display:none;">
				<jsp:include page="./orgEdit.jsp" flush="false"></jsp:include>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
<!-- e:container -->