<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    
<!-- 취업게시판 -->
<script type="text/javascript">
var curPage="/Career/employBoard?";
$(document).ready(function(){
	var defaultParams = {
			mypage:"${paramVO.mypage}",
			ptypeid:"${paramVO.ptypeid}"
	}

	var srchType = "${paramVO.srchType}";
	if(srchType !=null && srchType !=''){
		$("#searchType").val("${paramVO.srchType}");
		$("#keyword").val("${paramVO.keyword}");
		if(srchType ==1){
			$("#empid").hide();
			$("#keyword").show();
			$("#keyword").attr("placeholder", "제목");
		}else if(srchType == 2){
			$("#empid").hide();
			$("#keyword").show();
			$("#keyword").attr("placeholder", "닉네임");
		}else if(srchType == 3){
			$("#empid").val("${paramVO.empid}").prop("selected", true);
			$("#empid").show();
			$("#keyword").hide();
		}
	}	
	$("#addEmploymentBoard").click(function(){
		var params = $.param(defaultParams);
		var userno = "${session.userno}";
		var url = "/Career/employBoardWrite?";
		if(userno==""||userno==null){
			alert("로그인 후에 이용하실 수 있습니다");
			return;
		}else{
			$(location).attr("href", url+params);
		}
	});
	
	$("#searchType").change(function(){
		$("#keyword").val("");
		if($(this).val() == 1){
			$("#keyword").show();
			$("#empid").hide();
			$("#keyword").attr("placeholder", "제목");
		}else if($(this).val() == 2){
			$("#keyword").show();
			$("#empid").hide();
			$("#keyword").attr("placeholder", "닉네임");
		}else if($(this).val() == 3){
			$("#keyword").hide();
			$("#empid").show();
		}
	});
	$("#search").click(function(){
		search();
	});
	$("#keyword").keydown(function(key){
		if(key.keyCode == 13){
			search();
		}
	});
	
	
});

function search(){
	var keyword = $("#keyword").val();
	var empid = $("#empid").val(); 
	var searchType = $("#searchType").val();
	var params = $.extend({}, defaultParams, {keyword:keyword, srchType:searchType, empid:empid});
	var url ="/Career/employBoard?" +$.param(params);
	$(location).attr("href",url);
}

function viewBoard(brdid){
	var mypage = "${paramVO.mypage}";
	var url="/Career/employBoardView?brdid="+brdid + "&mypage=" + mypage;
	$(location).attr("href", url);
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
#l_title{
/*
	border: 2px solid #808080;
	border-radius: 25px;
	padding-left: 10px;
	box-shadow: 2px 2px #778899;
*/
 /*border-right:2px solid #a80e34; */
}
#title_list>li{
	list-style-type: disc;
	list-style-position: inside ;
}

#row>td{
	font-size:11.5px;
}

#top_row>td{
	font-size: 80%;
}
#list_title{
	overflow:hidden;
	text-overflow:ellipsis;
	white-space: nowrap;
	width: 320px;
	display: inline-block;
	float:left;
	padding-left: 5px;
}
input::placeholder{
	font-size: 65%;
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
					<div style="font-weight: bold; padding-left:5px; font-size: 110%; ">취업</div>
					<div style="clear:both;"></div>
					<ul id="title_list" style="list-style: none; padding-top:5px; padding-left: 10px; text-decoration: none;">
						<li><a href="/Career/">취업공고</a></li>
						<li><a id="current"href="/Career/employBoard?ptypeid=3">취업게시판</a></li>
					</ul>
				</div>
			</div>
			<div class="center_menu" style="width: 700px; float:left; margin-left:30px;">
				<table id="top_table" style="background-color: #f7f7f7; width:670px; border-top: 2px solid #910019; ">
					<colgroup>
						<col style="width:5%;">
						<col style="width:60%;">
						<col style="width:10%;">
						<col style="width:10%;">
						<col style="width:5%;">
					</colgroup>
					<thead>
						<tr id="top_row" style="width: 700px; height:30px; text-align:center; background-color:#d3d3d3;  padding: 10px;">
							<td>번호</td>
							<td><span>제</span><span style="padding-left: 40px;">목</span></td>
							<td>닉네임</td>
							<td>작성일</td>
							<td>조회수</td>
						</tr>
					</thead>
					<tbody style="text-align: center; padding: 10px;">
						<c:forEach items="${boardList }" var="list">
							<tr id="list" style="height: 35px; border-bottom: 1px solid #d3d3d3; font-size:80%;">
								<td style="text-align:center;">&nbsp;${list.brdid}</td>
								<td style="text-align: left; padding-left: 10px;cursor: pointer; font-size:100%; padding-top: 5px;" 
									onClick="javascript:viewBoard(${list.brdid});">
									
									<c:set var="title" value="${list.title }"/>
										<c:if test="${fn:length(title)>30 }">
											<span class="list_title" style="font-weight: 100%; padding-left: 5px;">[${list.typename}]&nbsp;${fn:substring(title,0,30)}... </span><span style="color: #910019; margin-left: 2px; font-size: 80%;">(${list.repcount})</span>
										</c:if>
										<c:if test="${fn:length(title)<=30 }">
											<span class="list_title" style="font-weight: 100%; padding-left: 5px;">[${list.typename}]&nbsp;${list.title} </span><span style="color: #910019; margin-left: 2px; font-size: 80%;">(${list.repcount})</span>
										</c:if>
								</td>
								<td style="text-align:center;">&nbsp;${list.writer }</td>
								<td style="text-align:center;">&nbsp;${list.regdate }</td>
								<td style="text-align:center;">&nbsp;${list.count }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div id="writeBtn" style=" float: right; padding-top: 5px; padding-right:30px;">
					<button class="btn" id="addEmploymentBoard" style="width: 50px; line-height: 15px; vertical-align: middle; padding:0px;">
						<span style="font-size: 80%;">글쓰기</span>
					</button>
				</div>
				<div id="search_box" style="padding-left: 210px; height: 20px; padding-top:20px;">
					<div id="searchValue" >
						<select id="searchType" style="width:100px; height:20px; font-size: 60%;">
					 		<option value="1">제목</option>
							<option value="2">닉네임</option>
							<option value="3">게시물 타입</option>
						</select>
						<input type="text" id="keyword" placeHolder = "제목" style="width: 120px; height:20px;">
						<select id="empid" style="display:none;">
							<option value="0">전체</option>
							<c:forEach items="${emptypes}" var="emptype">
								<option value="${emptype.empid}">${emptype.typename}</option>
							</c:forEach>
						</select>
						<button class="btn default" id="search" style="margin-left:5px; line-height: 17px; width:45px; vertical-align:middle; padding:0px;">
							<span style="font-size:80%">검색</span>
						</button>
					</div>
				</div>
				
				<div class="col-10 mt15">
					<div class="fLeft text-center col-8" style="padding-top:20px; margin-left:80px;">
				    	<jsp:include page="../common/paging.jsp" flush="false"></jsp:include>
					</div>
				</div>
			</div>
		</div>
	</div> 
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>