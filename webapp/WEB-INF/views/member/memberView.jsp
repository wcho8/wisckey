<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
<jsp:include page="../common/header.jsp"></jsp:include>

<script type="text/javascript">
$(document).ready(function(){
	var defaultParams={
			userid: "${session.userid}",
			userno: "${session.userno}",
			userpw: "${session.passwd}"
	};
	$(function(){
		$("#dialog").dialog({
			autoOpen: false,
			buttons:
				[
				 	{
				 		text:"확인",
						click: function(e){
							var pw = $("#pw").val();
							var pwCheck = $("#pwCheck").val();
						
							var memberPW = defaultParams.userpw;
								
							if(pw ==='' || pwCheck ===''){
								alert("비밀번호를 입력해 주시기 바랍니다.");
								e.preventDefault();
							}else if(pw!==pwCheck){
								alert("비밀번호가 일치하지 않습니다.");
								e.preventDefault();
							}else if(pw===pwCheck){
								if(pw===memberPW){
									$("#dialog").dialog('close');
									var url = "/Member/memberEdit?";
									var params= $.extend({}, $("#info").serialization(),{});
									location = url+params;
								}else{
									alert("비밀번호가 일치하지 않습니다.");
									e.preventDefault();
								}
							}
						}
					}	
				 ]
		});
		
	});
	$("#memberUpdate").on("click", function(){
		$("#dialog").dialog("open");
	});
	$("#memberPWUpdate").click(function(){
		var url = "/Member/memberPWEdit?";
		$(location).attr("href",url);
		
	});
});
</script>

<style type="text/css">
#info tbody>tr{
	height: 30px;
}
#memberPWUpdate, #memberUpdate{
	line-height: 25px;
	width: 100px;
	vertical-align:middle;
	padding: 0px;
}
</style>

<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width:100%;"></div>
	
	<div class="row">
		<div class="main_body">
			<div id="leftMenu_x" style="float:left; width:170px;">
				<div id="l_title"></div>
				<ul>
					<li></li>
					<li></li>
				</ul>
			</div>
			<div class="memberDetail" style="float:left; width:700px; margin-left: 30px;">
				<div class="head"  style="font-size: 30px; font-weight:bold; color:grey;">
					회원정보
				</div>
				<div class="hr_dash"></div>
				
				<div class="detailInfo">
					<table id="info" style="width:700px;">
						<colgroup>
							<col style="width: 100px; text-align:center;">
							<col style="width: 400px; border: 1px solid #FF0000;">
						</colgroup>
						<tbody>
							<tr>
								<th>이름<span class="important">*</span></th>
								<td>${memberInfo.korname}</td>
							</tr>
							<tr>
								<th>아이디<span class="important">*</span></th>
								<td>${memberInfo.userid}</td>
							</tr>
							<tr style="display:none;">
								<th>비밀번호</th>
								<td id="memberPW" value="${memberInfo.passwd}">${memberInfo.passwd}</td>
							</tr>
							<tr>
								<th>닉네임<span class="important">*</span></th>
								<td>${memberInfo.nickname}</td>
							</tr>
							<tr>
								<th>이메일 주소<span class="important">*</span></th>
								<td>${memberInfo.email}</td>
							</tr>
							<tr>
								<th>생일</th>
								<td>${memberInfo.birthdate }</td>
							</tr>
							<tr>
								<th>휴대폰</th>
								<td>${memberInfo.telnum }</td>
							</tr>
							<tr>
								<th>Major</th>
								<td>${memberInfo.major }</td>
							</tr>
							<tr>
								<th>Minor</th>
								<td>${memberInfo.minor }</td>
							</tr>
						</tbody>
					</table>
					<div style="width:600px; margin-top: 30px;">
						<button class="btn btn-modify" id="memberUpdate" style="float:right;">개인정보 변경</button>
					</div>
					<div id="dialog" title="" style="display:none;">
						<form action="" method="post">
							<span>비밀번호: </span>
							<input id="pw" name="pw" type="password"><br/>
							<span>비밀번호 확인:</span>
							<input id="pwCheck" name="pwCheck" type="password"><br/>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>

