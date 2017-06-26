<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	var defaultParams = {brdid: "${paramVO.brdid}"};
	var url = "/Board/findBoardContent";
});
</script>
<style>
.left_ul>li{
border-bottom:1px solid black;
}
.right_menu>div{
border:1px dashed red; 
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
				<div>
					<button class="btn btn-primary fRight">목록</button>
				</div>
				<div>
					<table style="border:1px solid #cacaca; width:100%;">
						<colgroup>
							<col width="20%">
							<col width="30%">
							<col width="20%">
							<col width="">
						</colgroup>
						<tbody>
							<tr>
								<td rowspan="3"><img src="../images/sample.png" style="width:110px;"></td>
								<td colspan="3" style="font-size:25px;">${vo.title}</td>
							</tr>
							<tr>
								<td colspan="2">작성자: <b>${vo.writer}</b></td>
								<td>작성일: ${vo.regdate}</td>
							</tr>
							<tr>
								<td colspan="2">조회수: ${vo.count}</td>
								<td>라이크: 0</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="boardText" style="min-height:100px; width:100%; border:1px solid #cacaca;margin-top:5px;">
					${vo.content }
				</div>
				<div id="reply_box" style="border:1px solid #cacaca;margin-top:5px;">
					답글
				</div>
				<div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>

<!-- e:container -->