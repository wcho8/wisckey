<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<script type="text/javascript">
var curPage="/Tip/tips?";
$(document).ready(function(){
	var defaultParams={
			mypage: "${paramVO.mypage}",
			ptypeid: "${paramVO.ptypeid}"
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
	$("#addTipBoard").click(function(){	
		var url = "/Tip/tipsBoardWrite?";	//mapping url
		var userno = "${session.userno}";
		if(userno==""||userno==null){
			alert("로그인 후에 이용하실 수 있습니다");
			return;
		}else{
			$(location).attr("href", url + $.param(defaultParams));
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
	var params = $.extend({}, {keyword:keyword, srchType:searchType,ptypeid:"${paramVO.ptypeid}",mypage:"${paramVO.mypage}"});
	var url ="/Tip/tips?" +$.param(params);
	$(location).attr("href",url);
}

function viewTipsBoard(brdid){	//글제목 클릭했을때 id
	var params = $.param($.extend({}, {brdid:brdid, ptypeid:"${paramVO.ptypeid}", mypage:"${paramVO.mypage}"}));
	var url="/Tip/tipsBoardView?" + params;
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
border-right:2px solid #a80e34;
}
#title_list>li{
	list-style-type: disc;
	list-style-position: inside ;
}
#row>td{
	font-size: 11.5px;
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
							<c:forEach items="${tipsList}" var = "list">
								<tr id="row" style="height:25px; border-bottom: 1px solid #d3d3d3;">
									<td style="text-align: center; font-size: 80%;">&nbsp;${list.brdid}</td>
									<td onClick="javascript:viewTipsBoard(${list.brdid});" style="cursor:pointer; padding-top: 7px;padding-left:30px;">
										<c:set var="title" value="${list.title }"/> 
										<c:if test="${fn:length(title) > 38 }">
											<p id="list_title" style="font-weight: 100%;">[$list.typename }]&nbsp;${list.title}</p><span style="color: #910019; margin-left: 2px; font-size: 80%;">(${list.repcount})</span>
										</c:if>
								 		<c:if test="${fn:length(title) <=38 }">
								 			<p id="list_title" style="font-weight: 100%;">[${list.typename }]&nbsp;${list.title} <span style="color: #910019; margin-left: 2px; font-size: 80%;" >(${list.repcount})</span></p>
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
								<button class="btn" id="addTipBoard" style="width: 50px; line-height: 15px; vertical-align: middle; padding: 0px;">
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
