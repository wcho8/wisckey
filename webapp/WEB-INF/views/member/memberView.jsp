<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

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
		if(data.birthdate==null||data.birthdate==''){
			$("#birthdate").text('');
		}else{
			$('#birthdate').text(data.birthdate.substring(0,10));
		}
		if(data.telnum == null || data.telnum == ''){
			$("#telnum").text('없음');
		}else{
			$("#telnum").text(data.telnum);
		}
		if(data.gender == null || data.gender == ''){
			$("#gender").text('');
		}else{
			$("#gender").text(data.gender);
		}
		if(data.major == null || data.major == ''){
			$('#major').text('');
		}else{
			$('#major').text(data.major); 
		}
		if(data.minor == null || data.minor == ''){
			$('#minor').text('');
		}else{
			$('#minor').text(data.minor);
		}
	});

	
	var equal = 0;
	$(function(){
		$("#dialog").dialog({
			width:400,
			height:230,
			autoOpen: false,
			resizable:false,
			draggable:false,
			position:'top',
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
				 ],
			close:function(){
				$("#pw").val('');
				$("#pwCheck").val('');
			}
		});
		$(".ui-dialog-titlebar").hide();
	});
	$(function(){
		$("#outDialog").dialog({
			width: 500,
			height: 300,
			autoOpen: false,
			resizable: false,
			draggable: false,
			position:'top',
			buttons:
				[
					{
						text:"확인",
						click: function(e){
							var pw = $("#outPw").val();
							var pwCheck = $("#outPwCheck").val();
							
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
									memberOut(equal);
								}
							});
						}
					},
					{
						text: "취소",
						click: function(e){
							$("#outDialog").dialog('close');
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
	
	$("#memberOut").on("click", function(){
		$("#outDialog").dialog("open");		
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

function memberOut(equal){
	//회원탈퇴
	if(equal == 1){
		var useyn = 'N';
		var nickname = $("#nickname").text();
		nickname += " (탈퇴한 회원)";
		var url = "/Member/memberOut";
		var params = $.extend({}, $("#info").serialization(),{userno:defaultParams.userno,useyn:useyn, nickname:nickname});
		$.post(url, params, function(data){
			alert("탈퇴 처리 되었습니다. 그동안 이용해 주셔서 감사합니다.");
			$(location).attr("href", "/LogInOut/Logout");
		});
	}else{
		alert("비밀번호가 일치하지 않습니다.");
	}
}

</script>

<style type="text/css">
#memberOut{
	 color:#ccc;
}
#memberOut:hover{
	color:black;
	text-decoration: underline;
}
#info>tbody>tr>th{
	font-size:  90%;
	padding-left: 5px;
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
	<div class="hr_dash" style="width: 84.3%; margin-left: 100px; "></div>
	<div class="row">
		<div class="main_body">
			<div class="head"  style="font-size: 30px; font-weight:bold; color:grey;">
				회원정보
			</div>
			<div class="hr_dash"></div>
			<div class="center_left" style="float:left;width:55%; padding-top: 100px;">
				<img src="/images/wikey/wikey_memberView.png" style="width:100%; height: 400px;">
			</div>
			<div class="memberDetail" style="float:left; width:42%; margin-left: 3%; background:#eaeaea; padding-bottom:10px;">
				<div class="detailInfo">
					<table id="info" style="width:100%; height: 500px;">
						<colgroup>
							<col style="width:25%; text-align: center;">
							<col style="width:70%;">
						</colgroup>
						<tbody>
							<tr>
								<th>이름<span class="important">*</span></th>
								<td id="korname"><td>
							</tr>
							<tr>
								<th>아이디<span class="important">*</span></th>
								<td id="userid"></td>
							</tr>
							<tr style="display:none;">
								<th>비밀번호</th>
								<td id="memberPW" value="${memberInfo.passwd}"></td>
							</tr>
							<tr>
								<th>닉네임<span class="important">*</span></th>
								<td id="nickname"></td>
							</tr>
							<tr>
								<th>이메일 주소<span class="important">*</span></th>
								<td id="email"></td>
							</tr>
							<tr>
								<th>생일</th>
								<td id="birthdate"></td>
							</tr>
							<tr>
								<th>성별</th>
								<td id="gender"></td>
							</tr>
							<tr>
								<th>휴대폰</th>
								<td id="telnum"></td>
							</tr>
							<tr>
								<th>Major</th>
								<td id="major"></td>
							</tr>
							<!-- <tr>
								<th style="padding-left: 5px;">주 활동 동아리</th>
								<td id="majorOrg"></td>
							</tr>
							<tr>
								<th style="padding-left: 5px;">부 활동 동아리</th>
								<td id="minorOrg"></td>
							</tr> -->
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
					<div id="outDialog" style="display:none; line-height:50px;">
						<form id="out" style="text-align: center; margin:0; vertical-align:middle;">
							<b style="color: red;">*확인을 누른 후 바로 회원 탈퇴처리 됩니다. </b><br/>
							<span>비밀번호: </span>
							<input id="outPw" name="pw" type="password" class="chk_pw"><br/>
							<span>비밀번호 확인:</span>
							<input id="outPwCheck" name="pwCheck" type="password" class="chk_pw"><br/>
						</form>
					</div>
				</div>
			</div>
			<div style="float:right; border:0;">
				<span id="memberOut" style="font-size:80%;">회원탈퇴</span>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
