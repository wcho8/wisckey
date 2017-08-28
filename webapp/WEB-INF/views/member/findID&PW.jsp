<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<jsp:include page="../common/header.jsp"></jsp:include>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#hideID").click(function(){
		$("#searchID").show();
		$("#result").hide();
		$("#korname").val("");
		$("#emailID").val("");
	});
	$("#searchID").click(function(){
		var name = $("#korname").val();
		var emailID = $("#emailID").val();
		
		var length = 0;
	
		var params= $.extend({}, $("#tableID").serialization(),{korname: name, email:emailID});
		var url = "/Member/findID";
			
		if(idCheck(name, emailID)){
			$.post(url, params, function(data){
				var id = data.userid;
				
				if(id!=null){
					$("#searchID").hide();
					$("#result").show();
				
					length = id.length;
				   	id = id.substring(0, (length/2));
					
				   	for(var i=0; i<(length-(length/2)); i++){
						id+="*";
					}
				   	
					$("#foundID").text(id);
					
				}else{
					alert("존재하는 아이디가 없습니다.");
				}
			}).fail(function(){
				$("#searchID").show();
				$("#result").hide();
			});
		}
	});
	
	$("#seachPW").click(function(){
		var pw = $("#id").val();
		var emailPW = $("#emailPW").val();
		
		var params = $.extend({},$("#tablePW").serialization(), {});
		var url = "";
	});
});

//
function idCheck(name, emailID){
	
	console.log("name: " + name);
	console.log("emailID: " + emailID);
	
	if(name == null|| name==""){
		alert("이름을 작성하십시오.");
		$("#name").focus();
		return false;
	}
	if(emailID==null||emailID==""){
		alert("이메일을 작성하십시오.");
		$("#email").focus();
		return false;
	}
	
	return true;
	
}

function pwCheck(id, email){

	var id = $("#id").text();
	var emailPW = $("#emailPW").text();
	
	if(name == null|| name==""){
		alert("아이디를 작성하십시오.");
		$("#name").focus();
		return false;
	}
	if(emailPW==null||emailPW==""){
		alert("이메일을 작성하십시오.");
		$("#email").focus();
		return false;
	}
	
	return true;
	
} 
</script>
<style type="text/css">
#title_list li>a:hover {
	text-decoration: none;
	font-size: 105%;
	font-weight: bold;
	opacity: 1;
	color: black;
}
#current{
	font-size: 110%;
	font-weight: bold;
	opacity:1;
	color: black;
}
#title_list li>a {
	opacity: 0.7;
	text-decoration: none;
	
}

#title_list>li{
	list-style-type: disc; 
	list-style-position: inside;	
}

#tableID>tbody>tr>td{
	margin-left: 10px;
}
</style>
<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width: 84.3%; margin-left: 100px; "></div>
	<div class="row">
		<div class="main_body" style="width:100%;">
			<div id="left_menu" style="float: left; width: 130px;  padding-top: 7px; margin-left: 40px;"> <!-- -20px -->
				<div id="l_first_title" style="font-weight: bold; border-right: 2px solid #910019; ">
					<div style="font-weight: bold; padding-left:5px; font-size: 110%; ">뭐라고 하지2 <br/></div>
					<div style="clear:both;"></div>
					<ul id="title_list" style="list-style: none; padding-left: 10px; text-decoration: none; padding-top: 5px;">
						<li><a href="/NeedLogin">로그인</a></li>
						<li><a href="/Member/">회원가입</a></li>
						<li><a id="current" href="/Member/findID&PW">아이디/ <br/> <span style="margin-left:20px;">비밀번호 찾기</span></a></li>
					</ul>
				</div>
			</div>
   			<div class="center_menu" style="width: 700px; float:left; margin-left: 30px;">
 				<div id="top_row" style="width: 100%; padding-left: 10px; padding-top: 5px; font-weight: bold;">
					<span style="border-bottom: 1px solid black; font-size: 120%;">아이디/비밀번호 찾기</span>
   				</div>
   				<div class="findID" style="width:100%;height: 200px;">
   					<table id="tableID" style="width: 100%;padding-left: 20px; margin-left: 10px; margin-top:20px;">
   						<colgroup>
   							<col style="width: 10%; text-align: left; ">
   							<col style="width: 60%; text-align: left; ">
   						</colgroup>
   						<tbody>
   							<tr>
   								<td>
   									<span>이름</span>
   								</td>
   								<td>
   									<input type="text" id="korname">
   								</td>
   							</tr>
   							<tr>
   								<td>
   									<span>이메일 주소</span>
   								</td>
   								<td>
   									<input type="text" id="emailID" style="width: 250px;">
   								</td>
   							</tr>
   							<tr>
   								
   							</tr>
   						</tbody>
   					</table>
   					<div class="hr_dash" style="width:690px; margin-left: 10px; background: grey;"></div>
   					<div style="line-height:50px; vertical-align: middle;">
   						<div id="result" style="float: left; width: 200px; margin-left: 10px;  display:none;">
   							<span>이름:</span>
   							<span id="foundID"></span>
   							<button id="hideID" style="margin-left: 20px;line-height: 25px; vertical-align: middle; padding: 0px;"> 확인</button>
   						</div>
   						<div style="float: right; width: 100px; border:0; margin:0;" >
   							<button id="searchID" style="line-height: 25px; vertical-align: middle; padding: 0px;">아이디 찾기</button>
   						</div>
   					</div>
   					<div style="clear:both;"></div>
   					<div class="hr_dash" style="width:690px; margin-left: 10px; background: grey;"></div>
   					
   				</div>
   				<div style="clear:both;"></div>
   				
   				<div class="findPW" style="width:100%;height: 200px;">
					<div>
						<table id="tablePW" style="width: 100%;padding-left: 20px; margin-left: 10px;">
   							<colgroup>
   								<col style="width: 10%; text-align: left;">
   								<col style="width: 60%; text-align: left;">
   							</colgroup>
   							<tbody>
   								<tr>
   									<td>
   										<span>아이디</span>
   									</td>
   									<td>
   										<input type="text" id="id">
   									</td>
   								</tr>
   								<tr>
   									<td>
   										<span>이메일 주소</span>
   									</td>
   									<td>
   										<input type="text" id="emailPW" style="width: 250px;">
   									</td>
   								</tr>
   								<tr>
   								</tr>
   							</tbody>
   						</table>
   						<div class="hr_dash" style="width:690px; margin-left: 10px; background: grey;"></div>
   						<div style="float: right; border:0; margin:0;">
   							<button id="searchPW">비밀번호 찾기</button>
   						</div>
   						<div style="clear:both;"></div>
   						<div class="hr_dash" style="width:690px; margin-left: 10px; background: grey;"></div>
					</div>   				
   				</div>
			</div>
		</div>
		<div style="clear:both;"></div>
		<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
	</div>
</div>
<!-- e:container -->