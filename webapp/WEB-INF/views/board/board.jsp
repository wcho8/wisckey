<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
var curPage = "/Board/?";
var defaultParams = {};
$(document).ready(function(){
	defaultParams = {
		userno: "${session.userno}",
		username: "${session.username}",
		nickname: "${session.nickname}",
		mypage: "${paramVO.mypage}"
	}
	var srchType = "${paramVO.srchType}";
	if(srchType != null && srchType != ''){
		$("#searchType").val("${paramVO.srchType}");
		$("#keyword").val("${paramVO.keyword}");
		if(srchType == 1){
			$("#keyword").attr("placeholder", "제목");
		}else if(srchType == 2){
			$("#keyword").attr("placeholder", "닉네임");
		}
	}
	$("#addBoard").click(function(){
		var url = "/Board/BoardEdit";
		if(defaultParams.userno == "" || defaultParams.userno == null){
			alert("로그인 하셔야 이용하실 수 있습니다.");
			return;
		}else{
			$(location).attr("href", url);
		}
	});
	$("#searchType").change(function(){
		$("#keyword").val("");
		if($(this).val() == 1){
			$("#keyword").attr("placeholder", "제목");
		}else if($(this).val() == 2){
			$("#keyword").attr("placeholder", "닉네임");
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
});

function search(){
	var keyword = $("#keyword").val();
	var searchType = $("#searchType").val();
	var params = $.extend({}, defaultParams, {keyword:keyword, srchType:searchType});
	var url="/Board/?" + $.param(params);
	$(location).attr("href", url)
}

function viewBoard(brdid){
	var url = "/Board/BoardView?brdid=" + brdid + "&mypage=" + defaultParams.mypage;
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
				<!-- <div id="board_name">
					<div style="margin-top:15px;margin-left:15px;">
						<span style="text-decoration:underline;font-size:23px;">자유 게시판</span><br/><br/>
						
						Wiskey의 자유게시판 입니다.<br/>
						마음 편하게 작성하시기 바랍니다.
					</div>
				</div> -->
				<div class="hr_dash"></div>
				<div id="board_main" style="width:100%;margin-top:10px;">
					<table id="board_table" class="table-hover" style="width:875px;background-color:white;" >
						<colgroup>
							<col style="width:50px;">
							<col style="width:485px;">
							<col style="width:120px;">
							<col style="width:120px;">
							<col style="width:50px;">
							<col style="width:50px;">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>닉네임</th>
								<th>등록일</th>
								<th>조회</th>
								<th>추천수</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${boardList}" var="list">
							<tr onClick="javascript:viewBoard(${list.brdid});" style="cursor:pointer;">
								<td style="text-align:center;">&nbsp;${list.brdid}</td>
								<td>&nbsp;${list.title} (${list.repcount})</td>
								<td style="text-align:center;">&nbsp;${list.writer}</td>
								<td style="text-align:center;">&nbsp;${list.regdate}</td>
								<td style="text-align:center;">&nbsp;${list.count}</td>
								<td style="text-align:center;">&nbsp;${list.likes}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<div id="pager"></div>
					<div id="search_box" style="text-align:center;height:45px; padding-top:10px;">
						<select id="searchType" style="width:150px; float:left;">
							<option value="1">제목</option>
							<option value="2">닉네임</option>
							<option value="3">게시물 타입</option>
						</select>
						<div id="searchValue" style="float:right;">
							<input type="text" id="keyword" placeHolder="제목">
							<%-- <select id="searchBrdType" style="width:150px;float:right;display:none;">
								<option value="${vo.frid}">${vo.frname}</option>
							</select> --%>
							<button class="btn btn-default" id="search" style="margin-left:5px;">검색</button>
						</div>
					</div>
				</div>
				<div class="col-10 mt15">
		           <%--  <div class="fLeft text-left col-1">
		                <b>⊙Total : ${totalCnt}</b>
		            </div> --%>
		            <div class="fLeft text-center col-8">
		                <jsp:include page="../common/paging.jsp" flush="false"></jsp:include>
		                 <%-- <c:if test="${paramVO.iTotalRowCount == 0}">
					        &nbsp;
					     </c:if>		 --%>
		            </div>
		            <div class="fRight text-right col-1">	
	                    <button class="btn btn-black" id="addBoard">글쓰기</button>
		            </div>
		        </div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
	</div>
</div>


<!-- e:container -->