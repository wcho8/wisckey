<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.text.SimpleDateFormat" %>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<!-- 취업공고 올리는 곳 -->
<script type="text/javascript">
var curPage = "/Career/?";
$(document).ready(function(){
	defaultParams.mypage="${paramVO.mypage}";
	
	var authid = defaultParams.authid;
	if(authid == 1 ){
		$("#writeBtn").show();
	}
	var srchType = "${paramVO.srchType}";
	if(srchType !=null && srchType !=''){
		$("#searchType").val("${paramVO.srchType}");
		$("#keyword").val("${paramVO.keyword}");
		if(srchType ==1){
			$("#keyword").attr("placeholder","제목");
		}else if(srchType == 2){
			$("keyword").attr("placeholder", "닉네임");
		}
	}	
	$("#addEmployer").click(function(){
		var url = "/Career/writeEmployer";
		if(defaultParams.userno==""||defaultParams.userno==null){
			alert("로그인 후에 이용하실 수 있습니다");
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
		if(key.keyCode == 13){
			search();
		}
	});
	
	
	//이 부분 고쳐야함
	var length = ~-encodeURI($(".list_title").text()).split(/%..|./).length;
	console.log("length: "+length);
	if(length>74){
		var title = $(".list_title").text();
		var title2 = cutInUTF8(title, 74);
		title2 += "...";
		$("#list_title").text(title2);
		console.log(title2 + "   "+length);
	}	
	//이 부분 고쳐야함
});

function cutInUTF8(str, n) {
    var len = Math.min(n, str.length);
    var i, cs, c = 0, bytes = 0;
    for (i = 0; i < len; i++) {
        c = str.charCodeAt(i);
        cs = 1;
        if (c >= 128) cs++;
        if (c >= 2048) cs++;
        if (n < (bytes += cs)) break;
    }
    return str.substr(0, i);
}
function search(){
	var keyword = $("#keyword").val();
	var searchType = $("#searchType").val();
	var params = $.extend({}, defaultParams, {keyword:keyword, srchType:searchType});
	var url ="/Career/?" +$.param(params);
	$(location).attr("href",url);
}
function viewEmployer(brdid){
	var url = "/Career/viewEmployer?brdid=" + brdid + "&mypage=" + defaultParams.mypage;
	$(location).attr("href", url);
}
</script>

<style type="text/css">
#title_list li>a:hover {
	text-decoration: none;
	font-size: 110%;
	font-weight: bold;
	opacity: 1;
	color: black;
}
#current{
	font-size: 105%;
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
border-right:2px solid #a80e34;
}
#title_list>li{
	list-style-type: disc;
	list-style-position: none ;
}

#d-day{
	text-align: center;
	display: inline-block;
	width: 35px;
	float:left;
}
/*
#list_title{
	overflow:hidden;
	text-overflow:ellipsis;
	white-space: nowrap; 
	width: 300px;
	display: inline-block;
	float:left;
	padding-left: 5px;
}*/
#top_row>td{
	font-size: 80%;
}
#list>td{
	font-size: 80%;
}
input::placeholder{
	font-size: 12px;
}
</style>
<!-- s:container -->
<div class="container">
	<jsp:include page="/WEB-INF/views/common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width: 84.3%; margin-left: 100px; "></div>
	<div class="row">
		<div class="main_body" style="overflow:hidden">
			<div class="left_menu" style="float:left; width:150px; padding-top: 7px; margin-left: 40px;">
				<div id="l_title" style="font-weight: bold;">
					<span style="font-weight: bold; margin-top: 10px; margin-left: 20px; font-size: 110%;">취업</span>
					<ul id="title_list" style="list-style:none; text-decoration: none;">
						<li><a id="current" href="/Career/">취업공고</a></li>
						<li><a href="/Career/employBoard">취업게시판</a></li>
					</ul>
				</div>
			</div>
			<div class="center_menu" style="width: 700px; float:left; margin-left:30px;">
				<table id="primary_table" style="background-color: #f7f7f7; width:700px; border-top: 2px solid #910019; ">
					<colgroup>
						<col style="width:5%; ">
						<col style="width:50%;">
						<col style="width:10%;">
						<col style="width:10%;">
						<col style="width:10%;">
						<col style="width:5%; ">
					</colgroup>
					<thead>
						<tr id="top_row" style="width: 700px;height:30px; background-color:#d3d3d3; text-align:center; border-bottom: 1px solid #ccc; border-top: 1px solid #ccc; padding: 10px;">
							<td>번호</td>
							<td><span>제</span><span style="padding-left: 40px;">목</span></td>
							<td>닉네임</td>
							<td>접수기한</td>
							<td>작성일</td>
							<td>조회수</td>
						</tr>
					</thead>
					<tbody style="text-align: center; padding: 10px;">
					<c:forEach items="${careerList}" var="list">
						<tr id="list" style="height:35px;  border-bottom: 1px solid #d3d3d3;">
							<td id="list_id" style="text-align: center;">&nbsp;${list.brdid}</td>
							<td onClick="javascript:viewEmployer(${list.brdid});" style="text-align: left; 
								padding-left: 10px; padding-top: 10px; cursor:pointer; valign: middle;">
								
								<c:if test="${list.dDate > 10}">
									<span id="d-day" style="display:inline-block; background-color:lightgrey; color:black; font-weight:bold;">D-${list.dDate}</span> 
								</c:if>
								<c:if test="${(list.dDate <= 10) && (list.dDate >2)}">
									<span id="d-day" style="display:inline-block; background-color:hotpink; color:ivory; font-weight:bold;">D-${list.dDate}</span>
								</c:if>
								<c:if test="${(list.dDate <= 2) && (list.dDate >=0)}">
									<span id="d-day" style="display:inline-block; background-color:red; color:ivory; font-weight:bold;">D-${list.dDate}</span>
								</c:if>
								<c:if test="${list.dDate < 0}">
									<span id="d-day" style="display:inline-block; text-align:center; background-color:lightgrey; color:black; font-weight:bold;">-</span>
								</c:if>
								
								<span class="list_title" style="font-weight: 100%; padding-left: 5px;display:inline-block;">${list.title} </span>
								<span style="margin-left:4px; color:#910019;">(${list.repcount })</span>
									
									
							</td>
							
							<td style="text-align: center;">&nbsp;${list.writer}</td>
							<td id="deadline" style="text-align: center;">&nbsp;${list.deadline }</td>
							<td style="text-align: center;">&nbsp;${list.regdate}</td>
							<td style="text-align: center;">&nbsp;${list.count}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div id="writeBtn" style=" float: right; padding-top: 5px; display:none;">
					<button class="btn" id="addEmployer" style="width: 50px; line-height: 15px; vertical-align: middle; padding: 0px;">
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
							<button class="btn default" id="search" style="margin-left:5px; line-height: 17px; width:45px; vertical-align:middle; padding:0px;">
								<span style="font-size:80%">검색</span>
							</button>
						</div>
					</div>
			
				<div class="col-10 mt15">
					<div class="fLeft text-center col-8" style="padding-top:20px; margin-left: 80px;">
				    	<jsp:include page="../common/paging.jsp" flush="false"></jsp:include>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>