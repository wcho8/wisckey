<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	var objGrid = $("#grid_list");
	var url = "/Board/findBoardList";
	objGrid.jqGrid({
		url: url,
		width:875,
		height:"auto",
		postData:{skiprow:0, pagerow:20},
		datatype:"json",
		mtype:"post",
		jsonReader:{repeatitems:false},
		colNames:[
		          "번호",
		          "제목",
		          "닉네임",
		          "등록일",
		          "조회",
		          "추천수"
		          ],
		colModel:[
		          {name:"brdid", width:50},
		          {name:"title", width:485},
		          {name:"writer", width:120},
		          {name:"regdate", width:120},
		          {name:"count", width:50},
		          {name:"likes", width:50}
		          ],
		caption:"그리드 테스트",
		hidegrid:false,
		viewrecords:true,
		shrinkToFit:true
	});
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
				<table id="grid_list"></table>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
<!-- e:container -->