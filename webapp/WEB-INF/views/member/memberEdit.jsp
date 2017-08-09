<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:include page="../common/header.jsp"></jsp:include>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
var chkId = false;
var chkNickname = true;
var params;
$(document).ready(function(){
	var defaultParams={
			userno: "${session.userno}",
			userid: "${session.userid}"
	}
	
	
	$("#birthdate").datepicker({
		dateFormat: "yy-mm-dd",
		changeMonth: true,
		changeYear: true,
		yearRange: "1950"
	});
	
	$("#birthdate").change(function(){
		var birthday = new Date($("#birthdate").val());
		if(birthday > new Date()){
			alert("유효한 생일이 아닙니다.");
			$("#birthdate").val("");
		}
	});
	
	var bEdit = false;
	var userno = defaultParams.userno;
	if(userno != 0 && userno != '' && userno != null){
		var url = "/Member/findMemberData";
		bEdit = true;
		$.post(url, defaultParams, function(data){
			$('#korname').val(data.korname);
			$('#userid').text(data.userid);
			$('#nickname').val(data.nickname);
			$('#passwd').val(data.passwd);
			$('#email').val(data.email);
			
			if(data.birthdate.length>10){
				$('#birthdate').val(data.birthdate.substring(0,10));
			}else{
				$('#birthdate').val(data.birthdate);
			}
			$('#telnum').val(data.telnum);
			$('#major').val(data.major);
			$('#minor').val(data.minor);
		});
	}
	
	$("#confirmUpdate").click(function(){
		if(!chkNickname){
			alert("닉네임 중복확인 하여 주십시오.");
			return;
		}
		
		if($("#birthdate").val() != null && $("#birthdate").val() != ""){
			var today = new Date();
		}
		
		var params = $.extend({}, $("#info").serialization(), {userid:defaultParams.userid});
		var userno = defaultParams.userno;
		var url = "/Member/modMemberData";
		if(chkValid()){
			$.post(url, params, function(){
				$(location).attr("href","/Member/memberView?userno="+userno);
			});
		}else{
			return
		}
		
	});
	$("#nickname").change(function(){
		chkNickname = false;
	});
	
	$(function(){
		$("#pwDialog").dialog({
			autoOpen: false,
			width: 600,
			buttons:
				[
				 	{
				 		text:"확인",
				 		width: 50,
				 		height: 30,
				 		click: function(e){
				 			
				 			submit();
				 		}
				 	},
				 	{
				 		text:"취소",
				 		click:function(e){
				 			$("#pwDialog").dialog('close');
				 		}
				 	}
				 ]
		});
		$(".ui-dialog-titlebar").hide();
	});
	
	
	$("#newPasswdCheck").keydown(function(key){
			if(key.keyCode==13||key.which==13){
				submit();
			}
		});
	$("#updatePW").on("click", function(){
		$("#newPasswd").val('');
		$("#newPasswdCheck").val('');
		$("#newPasswd").focus();
		$("#pwDialog").dialog("open");
	});
});
function submit(){
	var passwd = $("#newPasswd").val();
	var passwdCheck = $("#newPasswdCheck").val();

	var url = "/Member/modPasswdEdit";
	var params = $.extend({}, $("#info").serialization(),{passwd: passwd});
		
	if(chkPasswd()){
		$.post(url,params,function(data){
			alert("비밀번호가 성공적으로 바뀌었습니다.");
			$("#pwDialog").dialog('close');
			$("#passwd").val(passwd);
		});
	}
}
//이메일 정규식 체크
function chkEmail(email){
	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if(regEmail.test(email)){
		return true;
	}else{
		return false;
	}
};

//아이디 정규식 체크
function chkValidId(userid){
	var regId = /[^a-z0-9]/;
	if(regId.test(userid)){
		return false;
	}else{
		return true;
	}
};
//중복확인 (type은 아이디인지 닉네임인지 구분)
function chkExist(type){
	switch (type){
	case "id":
		var userid = $("#userid").val();
		if(userid == null || userid == ""){
			alert("아이디를 입력하여 주십시오.");
			$("#userid").focus();
			chkId = false;
		}else if(userid!= null && userid != ''){
			if(userid.length > 20 || userid.length < 5){
				alert("아이디는 5~20자 이내여야 합니다.");
				$("#userid").focus();
				chkId = false;
			}
			else{
				if(!chkValidId(userid)){
					alert(userid);
				}else{
					var url = "/Member/chkId";
					$.post(url, {userid: userid}, function(data){
						if(data < 0){
							alert("사용 가능한 아이디입니다.");
							chkId = true;
						}else{
							alert("이미 존재하는 아이디입니다.");
							chkId = false;
						}
					});
				}
			}
		}
		break;
	case "nickname":
		var nickname = $("#nickname").val();
		//닉네임 체크
		if(nickname== null || nickname == ""){
			alert("닉네임을 입력하여 주십시오.");
			$("#nickname").focus();
			chkNickname = false;
		}else if(nickname != null && nickname != ''){
			if(nickname.length > 20 || nickname.length < 2){
				alert("닉네임은 2~20자 이내여야 합니다.");
				$("#nickname").focus();
				chkNickname = false;
			}
			else{
				var url = "/Member/chkNickname";
				$.post(url, {nickname: nickname}, function(data){
					if(data < 0){
						alert("사용 가능한 닉네임입니다.");
						chkNickname = true;
					}else{
						alert("이미 존재하는 닉네임입니다.");
						chkNickname = false;
					}
				});
			}
		}
		break;
	}
}
function chkPasswd(){
	var paramsDialog = $("#pwDialog").serialization();
	//비밀번호 체크
	if(paramsDialog.newPasswd == null || paramsDialog.newPasswd == ""){
		alert("비밀번호를 입력하여 주십시오.");
		$("#newPasswd").val('');
		$("#newPasswdCheck").val('');
		$("#newPasswd").focus();
		return false;
	}else if(paramsDialog.newPasswd != null && paramsDialog.newPasswd != ""){
		if(paramsDialog.newPasswd.length < 6 || paramsDialog.newPasswd.length > 20){
			alert("비밀번호는 6~20자 이내여야 합니다.");
			$("#newPasswd").val('');
			$("#newPasswdCheck").val('');
			$("#newPasswd").focus();
			return false;
		}else{
			if(paramsDialog.newPasswd != paramsDialog.newPasswdCheck){
				alert("비밀번호가 맞지 않습니다. 다시 확인하여 주십시오.");
				$("#newPasswd").val('');
				$("#newPasswdCheck").val('');
				$("#newPasswd").focus();
				return false;
			}
		}
	} //비밀번호 통과
	
	return true;
}
function chkValid(){
	var params = $("#info").serialization();
	
	//이름 체크
	if(params.korname == null || params.korname == ""){
		alert("이름을 입력하여 주십시오.");
		$("#korname").focus();
		return false;
	}else if(params.korname != null && params.korname != ''){
		if(params.korname.length > 20 || params.korname.length < 2){
			alert("이름은 2~20자 이내여야 합니다.");
			$("#korname").focus();
			return false;
		}
	} //이름 통과
	
	//이메일 체크
	if(params.email == null || params.email == ""){
		alert("이메일을 입력하여 주십시오.");
		$("#email").focus();
		return false;
	}else{
		if(!chkEmail(params.email)){
			alert("이메일 주소가 유효하지 않습니다. 다시 시도하여 주십시오.");
			return false;
		}
	} //이메일 통과
	
	return true;
}
	

</script>
<style type="text/css">
#pwDialog .ui-button-text{
	font-size: 10px;
}
#info btnChk{
	line-height: 20px;
	vertical-align: middle;
	
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
								<td><input type="text" id="korname"></td>
							</tr>
							<tr>
								<th>아이디<span class="important">*</span></th>
								<td id="userid"></td>
							</tr>
							<tr>
								<th>비밀번호<span class="important">*</span></th>
								<td>
									<input type="password" id="passwd" value="" readonly="readonly">	
									<button class="btnChk" id="updatePW">
										<span style="color:black; font-size: 80%;">비밀번호 변경</span>
									</button>	
								</td>
							</tr>
							<tr>
								<th>닉네임<span class="important">*</span></th>
								<td>
									<input type="text" id="nickname">
									<button class="btnChk" id="nicknameCheck" onClick="javascript:chkExist('nickname')">
										<span style="color:black; font-size: 80%;">중복확인</span>	
									</button>
								</td>
							</tr>
							<tr>
								<th>이메일 주소<span class="important">*</span></th>
								<td><input type="text" id="email"></td>
							</tr>
							<tr>
								<th>생일</th>
								<td><input type="text" id="birthdate"></td>
							</tr>
							<tr>
								<th>휴대폰</th>
								<td><input type="text" id="telnum"></td>
							</tr>
							<tr>
								<th>Major</th>
								<td><input type="text" id="major"></td>
							</tr>
							<tr>
								<th>Minor</th>
								<td><input type="text" id="minor"></td>
							</tr>
						</tbody>
					</table>
					<div style="width:600px; margin-top: 30px;">
						<button class="btn btn-modify" id="cancelUpdate" onClick="javascript:history.back()" style="float:right;">취소</button>
						<button class="btn btn-pwModify" id="confirmUpdate" style="float:right;">등록</button>
					</div>
					
					<!-- 비밀번호 팝업창 -->
					<div id="pwDialog">
						<span>새 비밀번호: </span>
						<input id="newPasswd" name="newPw" type="password" style="font-size:90%;">
						<span style="font-size: 70%; color: red; margin-left: 20px;">*비밀번호는 6~20자 이내여야 합니다.</span>
						<br/>
						<span>새 비밀번호 확인:</span>
						<input id="newPasswdCheck" name="newPwCheck" type="password" style="font-size:90%;"><br/>	
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>