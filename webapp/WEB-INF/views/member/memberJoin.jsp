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
	$("#userid").keydown(function(key){
		if(key.keyCode ==13){
			chkExist('id');
		}
	});
	$("#nickname").keydown(function(key){
		if(key.keyCode ==13){
			chkExist('nickname');
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
					alert("아이디에는 특수문자가 들어갈 수 없습니다.");
				}else{
					var url = "/Member/chkId";
					$.post(url, {userid: userid}, function(data){
						if(data < 0 || data == null || data == ''){
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
					if(data < 0 || data == null || data == ''){
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
	params.useyn = 'Y';
	if(!chkId){
		alert("아이디 중복확인 하여 주십시오.");
		return;
	}
	if(!chkNickname){
		alert("닉네임 중복확인 하여 주십시오.");
		return;
	}
	debugger;
	if($("#birthdate").val() != null && $("#birthdate").val() != ""){
		var today = new Date($("#deadline").val());
		if(today < new Date()){
			alert("유효한 날짜가 아닙니다.");
			$("#birthdate").val('');
		}
	}else{
		params.birthdate = null;
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
	width:200px;
	margin-top:3px;
	margin-bottom:3px;
}
#infos>tbody>tr>td>input[type="radio"]{
	vertical-align: middle;
}
#infos>tbody>tr>th{
	padding-left: 5px;
}
.bot_line{
	border-bottom:1px solid #e5e5e5;
}
.bot_line>td{
	font-size: 70%;
	vertical-align: middle;
}
.btn_btn-primary{
	vertical-align: middle;
	padding: 0px;
	width: 70%;
	float:left;
	color:white;
	background:#910019;
	margin-left: 15px;
	border:0;
	font-weight:bold;
}
.btn_btn-secondary{
	inline-height: 100%;
	vertical-align: middle;
	width: 80px;
	padding:0px;	
	font-size: 70%;
	
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
			<!--  
			<div id="leftMenu_x" style="float:left; width:170px;">
				<div id="l_title">회원관리 </div>
				<ul class="memberTab" style="list-style:none; padding-left:0px;">
					<li><a href="/Member/">회원가입</a></li>
					<li><a href="">아이디/비밀번호 찾기</a></li>
				</ul>
			</div>
			-->	
			<div class="head" style="font-size:30px; font-weight:bold; color:grey;">
					회원가입
				</div>
			<div class="hr_dash" style="width: 100%;"></div>
			
			<div class="center_left" style="float:left;width:55%;">
				<div style="float:right; font-weight:bold; letter-spacing: 5px; margin-bottom: 5px;"><span>이용약관</span></div>
				<div style="clear:both;"></div>
				<div id = "serviceTerms" class="tabcontent" style="height: 330px;">
						<iframe class="doc" src="/images/service_terms.jpg" 
						style=" border: none; width:100%; height: 100%;"> 
						</iframe>
				</div>

				<div style="clear:both;"></div>

				<div style="float:right; font-weight:bold; letter-spacing: 5px; padding-top:18px; margin-bottom: 5px;"><span>개인정보 보호정책</span></div>
				<div style="clear:both;"></div>
				<div id = "privacyPolicy" class="tabcontent" style="height: 330px;">
					<iframe class="doc" src="/images/privacy_policy.jpg" 
						style=" border: none; width:100%; height: 100%;"> 
					</iframe>
				</div>
			</div>
			
			<div class="center_right"  >
				<div class="addMember" style="float:left; width:42%; margin-left:3%; background: #f2f2f2; padding-bottom: 10px;">
					<div class="userinfo">
						<table id="infos" style="width:100%; height:660px;">
							<colgroup>
								<col style="width:30%; text-align:center;">
								<col style="width:70%;">
							</colgroup>
							<tbody>
								<tr>
									<th>아이디 <span class="important">*</span></th>
									<td style="margin:0;">
										<input type="text" id="userid"/>
										<button type="button" class="btn_btn-secondary" onClick="javascript:chkExist('id')">중복 확인</button>
									</td>
								</tr>
								<tr class="bot_line">
									<th></th>
									<td>사용자 ID는 5~20자의 영문 소문자, 숫자만 사용 가능합니다.</td>
								</tr>
								<tr>
									<th>비밀번호 <span class="important">*</span></th>
									<td><input type="password" id="passwd" ></td>
								</tr>
								<tr>
									<th>비밀번호 확인 <span class="important">*</span></th>
									<td><input type="password" id="passwd_confirm"></td>
								</tr>	
								<tr class="bot_line">
									<th></th>
									<td>비밀번호는 6~20자 이내여야 합니다.</td>
								</tr>
								<tr>
									<th>이름 <span class="important">*</span></th>
									<td><input type="text" id="korname"></td>
								</tr>
								<tr class="bot_line">
									<th></th>
									<td>이름은 2~20자 이내여야 합니다.</td>
								</tr>
								<tr>
									<th>닉네임 <span class="important">*</span></th>
									<td>
										<input type="text" id="nickname"/>
										<button type="button" class="btn_btn-secondary" onClick="javascript:chkExist('nickname')">중복 확인</button>
									</td>
								</tr>
								<tr class="bot_line">
									<th></th>
									<td>닉네임은 2~20자 이내여야 합니다.</td>
								</tr>
								<tr>
									<th>이메일 주소<span class="important">*</span></th>
									<td><input type="text" id="email"></td>
								</tr>
								<tr class="bot_line">
									<th></th>
									<td>이메일 주소는 메일인증 후 비밀번호 변경/찾기 등에 사용됩니다.</td>
								</tr>
								<tr class="bot_line" style="height: 20px;">
									<th>성별</th>
									<td>
										<input type="radio" name="gender" value="M">&nbsp;<label style="vertical-align: middle; padding-top:3px;">남자</label> &nbsp;&nbsp;
										<input type="radio" name="gender" value="F">&nbsp;<label style="vertical-align: middle; adding-top:3px;">여자</label>
									</td>
								</tr>
								<tr>
									<th>휴대폰</th>
									<td>
										<input type="text" name="telnum">
									</td>
								</tr>
								<tr class="bot_line">
									<th>생일 </th>
									<td>
										<input type="text" id="birthdate">
									</td>
								</tr>
								<tr class="bot_line">
									<th>Major </th>
									<td><input type="text" id="major"></td>
								</tr>
								<tr class="bot_line">
									<th>주 활동 동아리</th>
									<td>
										<select id="main_org">
											<option value="">없음</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>부 활동 동아리</th>
									<td>
										<select id="minor_org">
											<option value="">없음</option>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
						<div style="float:left; width:100%; padding-top: 8px;">
							<button type="button" class="btn_btn-primary" style="height:50px;" onClick="javascript:addMember()">WISCKEY 가입</button>
							<button type="button" class="btn_btn-cancel" style="height:50px;" onClick="history.go(-1)">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>

<!-- e:container -->
