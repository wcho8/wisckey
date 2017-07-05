<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>

<script type="text/javascript">
var curPage = "/About/?";
$(document).ready(function(){
	var defaultParams ={
			userno: "${session.userno}",
			username:"${session.username}",
			nickname: "${session.nickname}",
			mypage:"${paramVO.mypage}"
	};
	console.log(defaultParams);
	$("#addNotice").click(function(){
		var url = "/About/writeForm";
		if(defaultParams.userno==""||defaultParams.userno == null){
			alert("로그인 후에 이용하실 수 있습니다.");
			return;
		}else{
			$(location).attr("href",url);
		}
	});
	
	$("#searchType").change(function(){
		if($(this).val()==1){
			$("#searchTitle").show();
			$("#searchNickname").hide();
		}else if($(this).val()==2){
			$("#searchTitle").hide();
			$("#searchNickname").show();
		}
	});
	
});

function viewNotice(nid){
	var url = "/About/viewNotice?nid=" + nid;
	$(location).attr("href", url);
}
</script>

<style type="text/css">
#title_list li>a:active {
	font-size: 110%;
	font-weight: bold;
	text-decoration: none;
}

#title_list li>a:hover {
	text-decoration: none;
	font-size: 110%;
	font-weight: bold;
	opacity: 1;
	color: black;
}

#title_list li>a:visited {
	font-size: 110%;
	font-weight: bold;
	text-decoration: none;
}

#title_list li>a {
	opacity: 0.4;
	text-decoration: none;
}



</style>
<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width: 100%"></div>
	<div class="row">
		<div class="main_body" style="overflow: hidden;">
			<div id="left_menu" style="float: left; width: 170px; border-right: 1px solid #ccc;">
				<div id="l_title" style="font-weight: bold; font-size: 130%">ABOUT</div>
				<ul id="title_list"
					style="list-style: none; padding-left: 0px; text-decoration: none;">
					<li><a href="/About/introWisckey">-위스키 소개</a></li>
					<li><a href="/About/introUniv">-학교소개</a></li>
					<li><a href="/About/notice">-공지사항</a></li>
					<li><a href="/About/otherSites">-주요사이트</a></li>
				</ul>
			</div>

			<div class="center_menu"
				style="float: left; width: 870px;  margin-left:30px;">
					<div id="notice_fixed" style="width: 100%; border-top: 1.5px solid #ff0000;  border-bottom: 1.5px solid #ff0000;">
						<table id="top_table" style="background-color:#fffafa;">
							<colgroup>
								<col style="width:50px;">
								<col style="width:450px; padding-left: 70px;">
								<col style="width:130px;">
								<col style="width:130px;">
								<col style="width:60px;">
								<col style="width:56px">
							</colgroup>
							<thead>	
								<tr id="top_row" style=" width: 900px; height:40px; text-align: center; border-bottom: 1px solid #ccc; padding: 10px;">
									<td>번호</td>
									<td>제목</td>
									<td>닉네임</td>
									<td>등록일</td>
									<td>조회</td>
									<td>추천수</td>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${aboutList}" var = "list">
								<tr style="height:40px;">
									<td style="text-align: center;">&nbsp;${list.nid}</td>
									<td onClick="javascript:viewNotice(${list.nid});" style="cursor:pointer; padding-left:10px;">&nbsp;${list.title}</td>
									<td style="text-align: center;">&nbsp;${list.writer}</td>
									<td style="text-align: center;">&nbsp;${list.regdate}</td>
									<td style="text-align: center;">&nbsp;${list.count}</td>
									<td style="text-align: center;">&nbsp;${list.likes}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<div id="writeBtn" style="float: right; padding-top: 20px;">
								<button class="btn" id="addNotice">글쓰기</button>
						</div>
					</div>
					<div id="search_box" style="text-align:left; margin-left: 100px;height: 45px; padding-top:40px;">
						<div id="searchValue" >
							<select id="searchType" style="width:150px;;">
						 		<option value="1">제목</option>
								<option value="2">닉네임</option>
								<option value="3">게시물 타입</option>
							</select>
							<input type="text" id="searchTitle" placeHolder = "제목" style="width: 200px;">
							<input type="text" id="searchNickname" style="display:none; width:200px;">
							<button class="btn default" id="search" style="margin-left:5px;">검색</button>
						</div>
					</div>
					<div class="col-10">
						<div class="fLeft text-center col-8" style="padding-top:20px;">
							   <jsp:include page="../common/paging.jsp" flush="false"></jsp:include>
						</div>
					</div>
					
				</div>
			</div>
			
			
		</div>
	</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
