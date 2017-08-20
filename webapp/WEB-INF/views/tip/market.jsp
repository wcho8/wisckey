<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>


<script type="text/javascript">

var curPage="/Tip/market?";
var defaultParams = {};
$(document).ready(function(){
	defaultParams={
			userno:"${session.userno}",
			username: "${session.username}",
			nickname: "${session.nickname}",
			mypage: "${paramVO.mypage}"
	};
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
	//글쓰기 버튼 id
	$("#addMarketBoard").click(function(){	
		var url = "/Tip/marketBoardWrite";	//mapping url
		var params = $.param(defaultParams);
		if(defaultParams.userno==""||defaultParams.userno==null){
			alert("로그인 후에 이용하실 수 있습니다");
			return;
		}else{
			$(location).attr("href", url);
		}
	});
	//
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
	
	
});

function search(){
	var keyword = $("#keyword").val();
	var searchType = $("#searchType").val();
	var params = $.extend({}, defaultParams, {keyword:keyword, srchType:searchType});
	var url ="/Tip/market?" +$.param(params);
	$(location).attr("href",url);
}

function viewMarketBoard(brdid){	//글제목 클릭했을때 id
	var url="/Tip/marketBoardView?brdid="+brdid;
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

#top_row>td{
	font-size:80%;
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
				<div id="l_first_title" style="font-weight: bold; border-right: 2px solid #910019; ">
					<div style="font-weight: bold; padding-left:5px; font-size: 110%; ">깨알팁 <br/></div>
					<div style="clear:both;"></div>
					<ul id="title_list" style="list-style: none; padding-top:5px; padding-left: 10px; text-decoration: none;">
						<li><a  href="/Tip/food">맛집</a></li>
						<li><a id="current" href="/Tip/market">벼룩시장</a></li>
					</ul>
				</div>
			</div>
			
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
							<c:forEach items="${marketList}" var = "list">
								<tr id="row" style="height:25px; border-bottom: 1px solid #d3d3d3;">
									<td style="text-align: center; font-size: 80%;">&nbsp;${list.brdid}</td>
									<td onClick="javascript:viewMarketBoard(${list.brdid});" style="cursor:pointer; padding-top: 7px;padding-left:30px;">
										<c:set var="title" value="${list.title }"/> 
										<c:if test="${fn:length(title) > 38 }">
											<p id="list_title" style="font-weight: 100%;">[${list.typename }]&nbsp; ${list.title}</p><span style="color: #910019; margin-left: 2px; font-size: 80%;">(${list.repcount})</span>
										</c:if>
								 		<c:if test="${fn:length(title) <=38 }">
								 			<p id="list_title" style="font-weight: 100%;">[${list.typename }]&nbsp; &nbsp;${list.title} <span style="color: #910019; margin-left: 2px; font-size: 80%;" >(${list.repcount})</span></p>
								 		</c:if>
									</td>
									<td style="text-align: center; font-size: 80%;">&nbsp;${list.writer}</td>
									<td style="text-align: center; font-size: 80%;">&nbsp;${list.regdate}</td>
									<td style="text-align: center; font-size: 80%;">&nbsp;${list.count}</td>
									<td style="text-align: center; font-size: 80%;">&nbsp;${list.likes}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<div id="writeBtn" style=" float: right; padding-top: 5px; padding-right: 30px; ">
								<button class="btn" id="addMarketBoard" style="width: 50px; line-height: 15px; vertical-align: middle; padding: 0px;">
									<span style="font-size: 80%;">글쓰기</span>
								</button>
						</div>
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
					<div class="col-10">
						<div class="fLeft text-center col-8" style="margin-left: 80px; padding-top:30px;">
							   <jsp:include page="../common/paging.jsp" flush="false"></jsp:include>
						</div>
					</div>
					
				</div>
			</div>
			
			
		</div>
	</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
