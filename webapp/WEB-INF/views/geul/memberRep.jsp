<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../common/header.jsp"></jsp:include>  
   
<script type="text/javascript">
$(document).ready(function() {
	var defaultParams = {
			mypage:"${paramVO.mypage}",
			ptypeid:"${paramVO.ptypeid}"
	}
	var userno = "${session.userno}";
	
	var gtype = $("#geul_type").val();
	var objGrid = $("#grid_list");
	var caption = $("#geul_type option:selected").text();
	var url = "/Geul/findGeulRepList";
	
	objGrid.jqGrid({
		url:url,
		width:875,
		height:"auto",
		postData:{userno:userno, ptypeid:gtype},
		datatype:"json",
		mtype:"post",
		jsonReader:{repeatitems:false},
		colNames:[
		          	"번호",
		          	"제목",
		          	"날짜",
		          	"내가 쓴 댓글 수",
		          	"총 댓글 수",
		          ],
		colModel:[
		          {name:"brdid", width:50},
		          {name:"title", width:450},
		          {name:"regdate", width:120},
		          {name:"myRepNum", width:100},
		          {name:"repNum", width:95}
		          ],
		caption:caption,
		hidegrid:false,
		viewrecords:true,
		shrinkToFit:true,
	});
	
	$("#geul_type").change(function(){
		reloadGrid($(this).val());
	});

	objGrid.jqGrid("setGridParam",{
		onSelectRow:function(row, status, event){
			var rowData = objGrid.jqGrid("getRowData", row);
			viewGeul(rowData);
		}
	});
	function viewGeul(data){
		var title = data.title;
		var brdid = data.brdid;
		var gtype = $("#geul_type").val();
	
		var url = "";
		
		if(gtype ==1){
			url += "/Board/BoardView?brdid=" + brdid;
		}else if(gtype==3){
			url += "/Career/employBoardView?brdid="+brdid;
		}else if(gtype==5){
			url += "/School/educationView?brdid="+brdid;
		}else if(gtype==6){
			url += "/Tip/foodBoardView?brdid=" + brdid;
		}else if(gtype==7){
			url += "/Tip/marketBoardView?brdid" + brdid;
		}
		
		$(location).attr("href", url);
	}
});

function reloadGrid(gtype){
	var userno = "${session.userno}";
	var url = "/Geul/findGeulRepList";
	var gtype = $("#geul_type").val();
	var objGrid = $("#grid_list");
	var caption = $("#geul_type option:selected").text();
	objGrid.jqGrid("setCaption", caption);
	objGrid.jqGrid("setGridParam", {
		url:url,
		postData:{userno:userno, ptypeid:gtype},
		page:1
	}).trigger("reloadGrid");
}
</script>

<style type="text/css">
#title_list li>a:hover {
	text-decoration: none;
	font-size: 105%;
	font-weight: bold;
	opacity: 1;
	color: black;
}
#current{
	font-size: 110%;
	font-weight: bold;
	opacity:1;
	color: black;
}
#title_list li>a {
	opacity: 0.7;
	text-decoration: none;
	
}
#title_list>li{
	list-style-type: disc;
	list-style-position: inside ;
}

</style>
<!-- s:container -->
<div class="container">
	<jsp:include page="/WEB-INF/views/common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width: 84.3%; margin-left: 100px; "></div>
	<div class="row">
		<div class="main_body" style="overflow:hidden">
			<div class="left_menu" style="float:left; width:130px; padding-top: 7px; margin-left: 40px;">
				<div id="l_first_title" style="font-weight: bold; border-right: 2px solid #910019;">
					<div style="clear:both;"></div>
					<ul id="title_list" style="list-style: none; padding-top:5px; padding-left: 10px; text-decoration: none;">
						<li><a href="/Member/memberView">내 정보</a></li>
						<li><a href="/Member/">내가 쓴 글</a></li>
						<li><a href="/Member/memberRep">내가 쓴 댓글</a></li>
					</ul>
				</div>
			</div>
			<div class="center_menu" style="width: 700px; float:left; margin-left:30px;">
				<div style="width:100%; height:40px; margin:5px; padding-top:5px;">
					게시판:&nbsp;&nbsp;
					<select id="geul_type">
						<c:forEach items="${geulTypes}" var="gtype">
							<option value="${gtype.typeid}">${gtype.typename}</option>
						</c:forEach>
					</select>
				</div>
				<table id="grid_list"></table>
			</div>
			<div class="col-10">
				<div class="fLeft text-center col-8" style="margin-left: 80px; padding-top:30px;">
				   <jsp:include page="../common/paging.jsp" flush="false"></jsp:include>
				</div>
			</div>
		</div>
	</div> 
		
</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
