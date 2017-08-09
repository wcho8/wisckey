<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	$(".current").removeClass("current");
	$("#menu").addClass("current");
	var bEdit = false;
	
	var btype = $("#board_type").val();
	var objGrid = $("#grid_list");
	var caption = $("#board_type option:selected").text();
	var url = "/Admin/findBoardTypes"
	
	objGrid.jqGrid({
		url: url,
		width:875,
		height:"auto",
		postData:{ptypeid:btype},
		datatype:"json",
		mtype:"post",
		jsonReader:{repeatitems:false},
		colNames:[
		          "번호",
		          "글머리 이름",
		          "코멘트",
		          "등록일",
		          "사용여부",
		          ],
		colModel:[
		          {name:"id", width:50},
		          {name:"name", width:125},
		          {name:"comment", width:470},
		          {name:"regdate", width:120},
		          {name:"useyn", width:50}
		          ],
		caption:caption,
		hidegrid:false,
		viewrecords:true,
		shrinkToFit:true
	});
	
	objGrid.jqGrid("setGridParam", {
		onSelectRow:function(row, status, event){
			var rowData = objGrid.jqGrid("getRowData", row);
			bEdit = true;
			editMenu(rowData);
		},
		onRightClickRow:function(){
			objGrid.jqGrid('resetSelection');
			return false;
		}
	});
	
	$("#board_type").change(function(){
		reloadGrid($(this).val());
	});
	
	$("#add").click(function(){
		bEdit = false;
		editMenu();
	})
	
	
	function reloadGrid(btype){
		var url = "/Admin/findBoardTypes";
		var btype = $("#board_type").val();
		var caption = $("#board_type option:selected").text();
		objGrid.jqGrid("setCaption", caption);
		objGrid.jqGrid("setGridParam", {
			url:url,
			postData:{ptypeid:btype},
			page:1
		}).trigger("reloadGrid");
	}
	function editMenu(data){
		var title = '';
		var objDialog = $("#menu_edit_dialog");
		if(bEdit){
			title = "말머리 정보";
		}else{
			title = "말머리 추가";
		}
		objDialog.dialog({
			title:title,
			modal:true,
			width:600,
			height:400,
			resizable:false,
			draggable:false,
			open:function(){
			},
			close:function(){
				
			}
		});
	}
});

</script>
<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width:100%;"></div>
	<div class="row">
		<div class="main_body">
			<jsp:include page="./leftmenu.jsp"></jsp:include>
			<div id="right_menu" style="float:left; width:870px; margin-left:30px;">
				<div style="width:100%; height:40px; margin:5px; padding-top:5px;">
					게시판:&nbsp;&nbsp;
					<select id="board_type">
						<c:forEach items="${boardtypes}" var="btype">
							<option value="${btype.typeid}">${btype.typename}</option>
						</c:forEach>
					</select>
				</div>
				<table id="grid_list"></table>
				<div style="float:right;">
					<button id="add">추가</button>
				</div>				
			</div>
			<div id="menu_edit_dialog" style="display:none;">
				<jsp:include page="./menuEdit.jsp" flush="false"></jsp:include>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
<!-- e:container -->