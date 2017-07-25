<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	var btype = $("#board_type").val();
	var objGrid = $("#grid_list");
	var caption = $("#board_type option:selected").text();
	var url = "/Admin/FindBoardType/" + btype;
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
		          "글머리 이름",
		          "코멘트",
		          "등록일",
		          "사용여부",
		          ],
		colModel:[
		          {name:"bid", width:50},
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
	
	$("#board_type").change(function(){
		reloadGrid($(this).val());
	});
	
	function reloadGrid(btype){
		var url = "/Admin/FindBoardType/" + btype;
		var caption = $("#board_type option:selected").text();
		objGrid.jqGrid("setCaption", caption);
		objGrid.jqGrid("setGridParam", {
			url:url,
			postData:{},
			page:1
		}).trigger("reloadGrid");
	}
});
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
				<div style="width:100%; height:40px; margin:5px; padding-top:5px;">
					게시판:&nbsp;&nbsp;
					<select id="board_type">
						<option value="1">취업게시판</option>
						<option value="2">자유게시판</option>
						<option value="3">학업게시판</option>
						<option value="4">맛집</option>
						<option value="5">벼룩시장</option>
					</select>
				</div>
				<table id="grid_list"></table>
				<div style="float:right;">
					<button id="add">추가</button>
				</div>				
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
<!-- e:container -->