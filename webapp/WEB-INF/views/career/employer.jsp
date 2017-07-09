<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.SimpleDateFormat" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<!-- 취업공고 올리는 곳 -->
<script type="text/javascript">

var curPage = "/Career/?";
$(document).ready(function(){
	var defaultParams={
			userno:"${session.userno}",
			username: "${session.username}",
			nickname: "${session.nickname}",
			mypage: "${paramVO.mypage}",
			
	};
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
		if($(this).val()==1){
			$("#searchTitle").show();
			$("#searchNickname").hide();
		}else if($(this).val()==2){
			$("#searchTitle").hide();
			$("#searchNickname").show();
		}
	});
	
	var curDate = new Date();
	var day = curDate.getDate();
	var month = curDate.getMonth()+1;
	var year = curDate.getFullYear();
	
	curDate = year+"-"+month+"-"+day;
	console.log(curDate);
});

function viewEmployer(brdid){
	var url = "/Career/viewEmployer?brdid="+brdid;
	$(location).attr("href", url);
}
<% %>
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
	<jsp:include page="/WEB-INF/views/common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width:100%;"></div>
	<div class="row">
		<div class="main_body" style="overflow:hidden">
			<div class="left_menu" style="float:left; width:130px; border-right: 1px solid #cccccc;">
				<div id="l_title" style="font-weight: bold; font-size:130%">취업</div>
				<ul id="title_list" style="list-style:none; padding-left:0px; text-decoration: none;">
					<li><a href="/Career/employer">-취업공고</a></li>
					<li><a href="/Career/employBoard">-취업게시판</a></li>
				</ul>
			</div>
			<div class="center_menu" style="width: 870px; float:left; margin-left:30px;">
				<table id="primary_table" style="background-color: #fffafa; width:870px; border-top: 2px solid #FF0000; border-bottom: 2px solid #FF0000;">
					<colgroup>
						<col style="width: 50px;">
						<col style="width:390px;">
						<col style="width:120px;">
						<col style="width:150px;">
						<col style="width: 80px;">
						<col style="width: 50px;">
					</colgroup>
					<thead>
						<tr id="top_row" style="width: 870px; height:30px; text-align:center; border-bottom: 1px solid #ccc; border-top: 1px solid #ccc; padding: 10px;">
							<td>번호</td>
							<td>제목</td>
							<td>닉네임</td>
							<td>접수기한</td>
							<td>작성일</td>
							<td>조회수</td>
						</tr>
					</thead>
					<tbody style="text-align: center; padding: 10px;">
					<c:forEach items="${careerList}" var="list">
						<tr style="height:40px;">
							<td style="text-align: center;">&nbsp;${list.brdid}</td>
							<td onClick="javascript:viewEmployer(${list.brdid});" style="text-align: left; 
								padding-left: 20px; cursor:pointer; padding-left:10px;">
								&nbsp;${list.title} (${list.repcount}) &nbsp;&nbsp;D-(${list.dDate})
							</td>
							<td style="text-align: center;">&nbsp;${list.writer}</td>
							<td id="deadline" style="text-align: center;">&nbsp;${list.deadline }</td>
							<td style="text-align: center;">&nbsp;${list.regdate}</td>
							<td style="text-align: center;">&nbsp;${list.count}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div id="search_box" style="text-align:left; margin-left: 100px;height: 45px; padding-top:40px;">
					<div id="searchValue">
						<select id="searchType" style="width:150px;">
					 		<option value="1">제목</option>
							<option value="2">닉네임</option>
							<option value="3">게시물 타입</option>
						</select>
						<input type="text" id="searchTitle" placeHolder = "제목" style="width: 200px;">
						<input type="text" id="searchNickname" style="display:none; width:200px;">
						<button class="btn default" id="search" style="margin-left:5px;">검색</button>
					</div>
				</div>
				<div>
					<button class="btn newEmployer" id="addEmployer" style="float:right;">글쓰기</button>
				</div>
				<div class="col-10 mt15">
					<div class="fLeft text-center col-8" style="padding-top:20px;">
				    	<jsp:include page="../common/paging.jsp" flush="false"></jsp:include>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>