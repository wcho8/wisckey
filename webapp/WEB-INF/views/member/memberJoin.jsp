<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
var chkId = false;
var chkNickname = false;
var params;
$(document).ready(function(){
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
	
	$("#userid").change(function(){
		if(chkId){
			chkId = false;
		}
	});
	$("#nickname").change(function(){
		if(chkNickname){
			chkNickname = false;
		}
	});
});

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

function chkValid(){
	var params = $("#infos").serialization();
	
	//비밀번호 체크
	if(params.passwd == null || params.passwd == ""){
		alert("비밀번호를 입력하여 주십시오.");
		$("#passwd").val('');
		$("#passwd_confirm").val('');
		$("#passwd").focus();
		return false;
	}else if(params.passwd != null && params.passwd != ""){
		if(params.passwd.length < 6 || params.passwd.length > 20){
			alert("비밀번호는 6~20자 이내여야 합니다.");
			$("#passwd").val('');
			$("#passwd_confirm").val('');
			$("#passwd").focus();
			return false;
		}else{
			if(params.passwd != params.passwd_confirm){
				alert("비밀번호가 맞지 않습니다. 다시 확인하여 주십시오.");
				$("#passwd").val('');
				$("#passwd_confirm").val('');
				$("#passwd").focus();
				return false;
			}
		}
	} //비밀번호 통과
	
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

function addMember(){
	var params = $("#infos").serialization();
                                             	
	//TODO: 권한 관리                                                      
	params.authid = 5;                       
	params.gender = $("input[name=gender]:checked").val();
	if(!chkId){
		alert("아이디 중복확인 하여 주십시오.");
		return;
	}
	if(!chkNickname){
		alert("닉네임 중복확인 하여 주십시오.");
		return;
	}
	
	if($("#birthdate").val() != null && $("#birthdate").val() != ""){
		var today = new Date();
			
	}
	
	var url = "/Member/addMember";
	if(chkValid()){
		$.post(url, params, function(data){
			if(data > 0){
				alert("가입 되었습니다.");
			}else{
				alert("가입에 실패하였습니다. 다시 시도해 주시기 바랍니다.");
			}
			location.href = "/";
		}).fail(function(){
			alert("가입에 실패하였습니다. 다시 시도해 주시기 바랍니다.");
		});
	}else{
		return;
	}
	
}
</script>
<style type="text/css">
#l_title{
text-align:center; 
border:1px solid black; 
background-color:red; 
color:white; 
font-size:30px;
padding:20px;
height:80px;
}
.memberTab>li{
border-bottom:1px solid black;
font-weight:bold;
}
#infos>tbody>tr>td{
padding-top:5px;
padding-bottom:5px;
}
#infos>tbody>tr>td>input[type="text"],
#infos>tbody>tr>td>input[type="password"]{
width:250px;
margin-top:3px;
margin-bottom:3px;
}
.bot_line{
border-bottom:1px solid #e5e5e5;
}
</style>
<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width:100%;"></div>
	<div class="row">
		<div class="main_body">
			<div id="leftMenu_x" style="float:left; width:170px;">
				<div id="l_title">회원관리 </div>
				<ul class="memberTab" style="list-style:none; padding-left:0px;">
					<li><a href="/Member/">회원가입</a></li>
					<li><a href="">아이디/비밀번호 찾기</a></li>
				</ul>
			</div>
			<div class="addMember" style="float:left; width:870px; margin-left:30px;">
				<div class="head" style="font-size:30px; font-weight:bold; color:grey;">
					회원가입
				</div>
				<div class="hr_dash"></div>
				<div class="userinfo">
					<table id="infos" style="width:870px;">
						<colgroup>
							<col style="width:150px; text-align:center;">
							<col style="width:285px;">
							<col style="width:150px; text-align:center;">
							<col style="width:285px;">
						</colgroup>
						<tbody>
							<tr>
								<th rowspan="2">아이디 <span class="important">*</span></th>
								<td><input type="text" id="userid"></td>
								<td colspan="2"><button type="button" class="btn btn-secondary" onClick="javascript:chkExist('id')">중복 확인</button></td>
							</tr>
							<tr class="bot_line">
								<td colspan="3">사용자 ID는 5~20자의 영문 소문자, 숫자만 사용 가능합니다.</td>
							</tr>
							<tr>
								<th>비밀번호 <span class="important">*</span></th>
								<td><input type="password" id="passwd" ></td>
								<th>비밀번호 확인 <span class="important">*</span></th>
								<td><input type="password" id="passwd_confirm"></td>
							</tr>
							<tr class="bot_line">
								<th></th>
								<td colspan="3">비밀번호는 6~20자 이내여야 합니다.</td>
							</tr>
							<tr>
								<th>이름 <span class="important">*</span></th>
								<td colspan="3"><input type="text" id="korname"></td>
							</tr>
							<tr class="bot_line">
								<th></th>
								<td colspan="3">이름은 2~20자 이내여야 합니다.</td>
							</tr>
							<tr>
								<th>닉네임 <span class="important">*</span></th>
								<td><input type="text" id="nickname"></td>
								<td colspan="2"><button type="button" class="btn btn-secondary" onClick="javascript:chkExist('nickname')">중복 확인</button></td>
							</tr>
							<tr class="bot_line">
								<th></th>
								<td colspan="3">닉네임은 2~20자 이내여야 합니다.</td>
							</tr>
							<tr>
								<th rowspan="2">이메일 주소<span class="important">*</span></th>
								<td colspan="3"><input type="text" id="email"></td>
							</tr>
							<tr class="bot_line">
								<td colspan="3">이메일 주소는 메일인증 후 비밀번호 변경이나 찾기 등에 사용됩니다.</td>
							</tr>
							<tr class="bot_line">
								<th>성별</th>
								<td>
									<label><input type="radio" name="gender" value="M">&nbsp;남자</label> &nbsp;&nbsp;
									<label><input type="radio" name="gender" value="F">&nbsp;여자</label>
								</td>
								<th>휴대폰</th>
								<td>
									<input type="text" name="telnum">
								</td>
							</tr>
							<tr class="bot_line">
								<th>생일 </th>
								<td colspan="3">
									<input type="text" id="birthdate">
								</td>
							</tr>
							<tr class="bot_line">
								<th>Major </th>
								<td><input type="text" id="major"></td>
								<th>Minor </th>
								<td><input type="text" id="minor"></td>
							</tr>
							<tr class="bot_line">
								<th>주 활동 동아리</th>
								<td>
									<select id="main_org">
										<option value="">없음</option>
									</select>
								</td>
								<th>부 활동 동아리</th>
								<td>
									<select id="minor_org">
										<option value="">없음</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div style="float:right;">
					<button type="button" class="btn btn-primary" onClick="javascript:addMember()">가입</button>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>

<!-- e:container -->