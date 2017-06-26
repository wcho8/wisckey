<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	$("#addBoard").click(function(){
		var url = "/Board/BoardEdit";
		$(location).attr("href", url);
	});
});

function viewBoard(brdid){
	var url = "/Board/BoardView?brdid=" + brdid;
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
border:1px solid black;
text-align:center;
}
#board_table>tbody>tr>td{
height:25px;
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
				<div id="search_box" style="text-align:center;height:45px; padding-top:10px;background-color:grey;color:white;">
					서치박스
				</div>
				<div class="hr_dash"></div>
				<div id="board_name" style="margin-top:15px;text-align:center;background-color:green;font-size:20px;height:40px;color:white;">
					자유 게시판
				</div>
				<div id="board_main">
					<table id="board_table">
						<colgroup>
							<col style="width:50px;">
							<col style="width:450px;">
							<col style="width:150px;">
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
								<td>${list.brdid}</td>
								<td>${list.title}</td>
								<td>
									${list.writer}
								</td>
								<td>${list.regdate}</td>
								<td>0</td>
								<td>0</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div>
					<button class="btn btn-warning fRight" id="addBoard">글쓰기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>

<!-- e:container -->