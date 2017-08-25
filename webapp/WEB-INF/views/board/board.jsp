<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
var curPage = "/Board/?";
$(document).ready(function(){
	var defaultParams = {
			mypage:"${paramVO.mypage}",
			ptypeid:"${paramVO.ptypeid}"
	}
	var srchType = "${paramVO.srchType}";
	if(srchType != null && srchType != ''){
		$("#searchType").val("${paramVO.srchType}");
		$("#keyword").val("${paramVO.keyword}");
		if(srchType == 1){
			$("#frid").hide();
			$("#keyword").show();
			$("#keyword").attr("placeholder", "제목");
		}else if(srchType == 2){
			$("#frid").hide();
			$("#keyword").show();
			$("#keyword").attr("placeholder", "닉네임");
		}else if(srchType == 3){
			$("#frid").val("${paramVO.frid}").prop("selected", true);
			$("#frid").show();
			$("#keyword").hide();
		}
	}
	
	$("#addBoard").click(function(){
		var url = "/Board/BoardEdit?";
		var params = $.param(defaultParams);
		var userno = "${session.userno}";
		if(userno == "" || userno == null){
			alert("로그인 하셔야 이용하실 수 있습니다.");
			return;
		}else{
			$(location).attr("href", url+params);
		}
	});
	
	$("#searchType").change(function(){
		$("#keyword").val("");
		if($(this).val() == 1){
			$("#keyword").show();
			$("#frid").hide();
			$("#keyword").attr("placeholder", "제목");
		}else if($(this).val() == 2){
			$("#keyword").show();
			$("#frid").hide();
			$("#keyword").attr("placeholder", "닉네임");
		}else if($(this).val() == 3){
			$("#keyword").hide();
			$("#frid").show();
		}
	});
	
	$("#search").click(function(){
		search();
	});
	$("#keyword").keydown(function(key){
		if(key.keyCode ==13){
			search();
		}
	});
	function search(){
		var keyword = $("#keyword").val();
		var frid = $("#frid").val(); 
		var searchType = $("#searchType").val();
		var params = $.extend({}, defaultParams, {keyword:keyword, srchType:searchType, frid:frid});
		var url="/Board/?" + $.param(params);
		$(location).attr("href", url)
	}
});

function viewBoard(brdid){
	var mypage = "${paramVO.mypage}";
	var url = "/Board/BoardView?brdid=" + brdid + "&mypage=" + mypage;
	$(location).attr("href", url);
}



</script>
<style>
.left_ul>li{
border-bottom:1px solid black;
}
.right_menu>div{
border:1px dashed red; 
}
#board_table>thead>tr>th{
text-align:center;
font-size:15px;
font-color:white;
height:40px;
background-color:#cacaca;
}
#board_table>tbody>tr>td{
height:25px;
}
table{
border:1px solid #cacaca;
border-collapse:collapse;
}
td{
border-top:1px solid #cacaca;
font-size:13px;
}
#title_list_about>li{
	list-style-type: disc; 
	list-style-position: inside;	
}
#row>td{
	font-size: 11.5px;
}
#top_row>td{
	font-size: 80%;
}
input::placeholder{
	font-size:65%;
}
select{
width:100px;
height:25px;
font-size:75%;
}
</style>
<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width:100%;"></div>
	<div class="row">
		<div class="main_body">
			<jsp:include page="./leftmenu.jsp"></jsp:include>
			<div class="center_menu"
				style="float: left; width: 700px;  margin-left:30px;">
					<div id="notice" style="width: 700px; ">
						<table id="top_table" style="width:670px; background-color:#f7f7f7;border-top: 2px solid #910019;">
							<colgroup>
								<col style="width:5%;">
								<col style="width:65%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:5%;">
								<col style="width:5%;">
							</colgroup>
							<thead>	
								<tr id="top_row" style="background-color:#d3d3d3; height:30px; text-align: center; border-bottom: 1px solid #ccc; padding: 10px;">
									<td>번호</td>
									<td><span>제</span><span style="padding-left: 40px;">목</span></td>
									<td>닉네임</td>
									<td>날짜</td>
									<td>조회</td>
									<td>추천</td>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${boardList}" var = "list">
								<tr id="row" style="height:25px; border-bottom: 1px solid #d3d3d3;">
									<td style="text-align: center; font-size: 80%;">&nbsp;${list.brdid}</td>
									<td onClick="javascript:viewBoard(${list.brdid});" style="cursor:pointer; padding-left:30px;">
									<c:set var="title" value="${list.title }"/>
									<c:if test="${fn:length(title) > 30 }">
										[${list.typename}]&nbsp;${fn:substring(title, 0, 30)}...<span style="color: #910019; margin-left: 2px; font-size: 80%;">(${list.repcount})</span>
									</c:if>
									<c:if test="${fn:length(title) <= 30 }">
										[${list.typename}]&nbsp;${list.title}<span style="color: #910019; margin-left: 2px; font-size: 80%;">(${list.repcount})</span>
									</c:if>
									</td>
									<td style="text-align: center; font-size: 80%;">
										
										
										
										<c:choose>
										  <c:when test="${list.chk_anonymous == '1'    }">
										   익명
										  
										  </c:when>
										  <c:when test="${list.chk_anonymous == '0'  }">
										  &nbsp;${list.writer}
										   
										  </c:when>
										  <c:otherwise>
										    do this when nothing else is true
										  </c:otherwise>
										</c:choose>
													
									</td>
									<td style="text-align: center; font-size: 80%;">&nbsp;${list.regdate}</td>
									<td style="text-align: center; font-size: 80%;">&nbsp;${list.count}</td>
									<td style="text-align: center; font-size: 80%;">&nbsp;${list.likes}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<div id="writeBtn" style=" float: right; padding-top: 5px; padding-right: 30px; ">
								<button class="btn" id="addBoard" style="width: 50px; line-height: 15px; vertical-align: middle; padding: 0px;">
									<span style="font-size: 80%;">글쓰기</span>
								</button>
						</div>
					</div>
					<div id="search_box" style="padding-left: 210px; height: 20px; padding-top:20px;">
						<div id="searchValue" >
							<select id="searchType">
						 		<option value="1">제목</option>
								<option value="2">닉네임</option>
								<option value="3">게시물 타입</option>
							</select>
							<input type="text" id="keyword" placeHolder = "제목" style="width: 120px; height:20px;">
							<select id="frid" style="display:none;">
								<option value="0">전체</option>
								<c:forEach items="${frtypes}" var="frtype">
									<option value="${frtype.frid}">${frtype.typename}</option>
								</c:forEach>
							</select>
							<button class="btn default" id="search" style="margin-left:5px; line-height: 17px; width:45px; vertical-align:middle; padding:0px;">
								<span style="font-size:80%">검색</span>
							</button>
						</div>
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
	</div>
</div>


<!-- e:container -->