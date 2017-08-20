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
	
	//FIND member info
	var url = "/Member/findMemberData";
	$.post(url, defaultParams, function(data){
		$('#korname').text(data.korname);
		$('#userid').text(data.userid);
		$('#nickname').text(data.nickname);
		$('#email').text(data.email);
		$('#birthdate').text(data.birthdate.substring(0,10));
		$("#telnum").text(data.telnum);
		$("#gender").text(data.gender);
		$('#major').text(data.major); 
		$('#minor').text(data.minor);
	});
	
	var equal = 0;
	$(function(){
		$("#dialog").dialog({
			maxWidth:400,
			maxHeight:230,
			width:400,
			height:230,
			autoOpen: false,
			buttons:
				[
				 	{
				 		text:"확인",
						click: function(e){
							var pw = $("#pw").val();
							var pwCheck = $("#pwCheck").val();
							
							if(pw ==='' || pwCheck ===''){
								alert("비밀번호를 입력해 주시기 바랍니다.");
								e.preventDefault();
							}else if(pw!==pwCheck){
								alert("비밀번호가 일치하지 않습니다.");
								e.preventDefault();
							}
						
							var url ="/Member/findPW";
							var params=$.extend({},$("#dialog").serialization(), {passwd:pw, userno: defaultParams.userno});
							
							$.post(url, params, function(data){
								equal = data;
							
								if(pw===pwCheck){
									submit(equal);
								}
							});
						}
					},	
				 	{
				 		text:"취소",
				 		click:function(e){
				 			$("#dialog").dialog('close');
				 		}
				 	}
				 ]
		});
		$(".ui-dialog-titlebar").hide();
		
	});
	
	$("#memberUpdate").on("click", function(){
		$("#dialog").dialog("open");
	});
	$("#memberPWUpdate").click(function(){
		var url = "/Member/memberPWEdit?";
		$(location).attr("href",url);
	});
	
	$("#pwCheck").keydown(function(key){
		var pw = $("#pw").val();
		var memberPW = defaultParams.userpw;
		if(key.keyCode==13||key.which==13){
			submit(pw, memberPW);
		}
	});
});

function submit(equal){
	if(equal == 1){
		$("#dialog").dialog('close');
		var url = "/Member/memberEdit?";
		var params= $.extend({}, $("#info").serialization(),{});
		location = url+params;
	}else{
		alert("비밀번호가 일치하지 않습니다.");
	}
}
</script>

<style type="text/css">
#info>tbody>tr{
	height: 20px;
}
.btn_btn-modify{
	width: 70%;
	vertical-align:middle;
	padding: 0px;
	background: #910019;
	margin-left:15px;
	font-weight: bold;
	color:white;
	float:left;
	border:0;
}
.btn_btn-cancel{
	margin-left: 10px;
	width:20%;
	color:white;
	background: #ccc;
	border:0;
	font-weight:bold;
}
</style>

<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width:100%;"></div>
	<div class="row">
		<div class="main_body">
			<div class="head"  style="font-size: 30px; font-weight:bold; color:grey;">
				회원정보
			</div>
			<div class="hr_dash"></div>
			<div class="center_left" style="float:left;width:55%;">
				<img src="/images/wicon.jpg">
			</div>
			<div class="memberDetail" style="float:left; width:42%; margin-left: 3%; background:#eaeaea; padding-bottom:10px;">
				<div class="detailInfo">
					<table id="info" style="width:100%; height: 640px;">
						<colgroup>
							<col style="width:30%; text-align: center;">
							<col style="width:70%;">
						</colgroup>
						<tbody>
							<tr>
								<th style="padding-left: 5px;">이름<span class="important">*</span></th>
								<td id="korname"><td>
							</tr>
							<tr>
								<th style="padding-left: 5px;">아이디<span class="important">*</span></th>
								<td id="userid"></td>
							</tr>
							<tr style="display:none;">
								<th style="padding-left: 5px;">비밀번호</th>
								<td id="memberPW" value="${memberInfo.passwd}"></td>
							</tr>
							<tr>
								<th style="padding-left: 5px;">닉네임<span class="important">*</span></th>
								<td id="nickname"></td>
							</tr>
							<tr>
								<th style="padding-left: 5px;">이메일 주소<span class="important">*</span></th>
								<td id="email"></td>
							</tr>
							<tr>
								<th style="padding-left: 5px;">생일</th>
								<td id="birthdate"></td>
							</tr>
							<tr>
								<th style="padding-left: 5px;">성별</th>
								<td id="gender"></td>
							</tr>
							<tr>
								<th style="padding-left: 5px;">휴대폰</th>
								<td id="telnum"></td>
							</tr>
							<tr>
								<th style="padding-left: 5px;">Major</th>
								<td id="major"></td>
							</tr>
							<tr>
								<th style="padding-left: 5px;">주 활동 동아리</th>
								<td id="majorOrg"></td>
							</tr>
							<tr>
								<th style="padding-left: 5px;">부 활동 동아리</th>
								<td id="minorOrg"></td>
							</tr>
						</tbody>
					</table>
					<div style="width:100%; margin-top: 8px; float:left;">
						<button class="btn_btn-modify" id="memberUpdate" style="height: 50px;">개인정보 변경</button>
						<button class="btn_btn-cancel" id="back" style="height: 50px;" onClick="history.go(-1)">뒤로</button>
					</div>
					
					<div id="dialog" title="" style="display:none; line-height:60px; ">
						<form id="inner_form" action="" method="post" style="text-align:center; margin:0; vertical-align: middle;">
							<span>비밀번호: </span>
							<input id="pw" name="pw" type="password" class="chk_pw"><br/>
							<span>비밀번호 확인:</span>
							<input id="pwCheck" name="pwCheck" type="password" class="chk_pw"><br/>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
