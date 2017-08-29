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
	
	$("#searchPW").click(function(){
		var userid = $("#id").val();
		var emailPW = $("#emailPW").val();
		var korname = $("#kornamePW").val();
		
		var params = {userid: userid, email:emailPW, korname: korname}
		var url = "/Member/forgotPassword";
		
		$.post("/Member/forgotPassword", params, function(data){
			alert(data);
		});
		
	});
});

//
function idCheck(name, emailID){
	
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

	var id = $("#id").val();
	var emailPW = $("#emailPW").val();
	var korname = $("#kornamePW").val();
	
	if(name == null|| name==""){
		alert("아이디를 작성하십시오.");
		$("#name").focus();
		return false;
	}
	if(emailPW==null||emailPW==""){
		alert("이메일을 작성하십시오.");
		$("#emailPW").focus();
		return false;
	}
	if(kornamePW == null || kornamePW == ""){
		alert("이름을 입력하세요.");
		$("#kornamePW").focus();
		return false;
	}
	
	return true;
	
} 
</script>
<style type="text/css">
input[type=text], select {
    border: none;
    border-bottom: 2px solid red;
}

.left-box {
	float:left;
}

.right-box {
	float:right;
}

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
#block{
	margin:0 auto; 
}
</style>
<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width:100%;"></div>
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
   			
			
			
			
			
				
				<br>
				<div style= "margin-left: 6cm;" >
					<table >
					  <tr style="vertical-align:center; padding-left:10px ">
					  	<td style="width:48%; border-right: 2px solid #959595; padding-right:12px; text-align:justify">
						    <div id="top_row" style="width: 100%; padding-left: 10px; padding-top: 5px; font-weight: bold;">
								<span style="border-bottom: 1px solid black; font-size: 120%;">ID 찾기</span>
			   				</div>
			   				
			   				<div id = "block" class="left-box" style="width:100%;height: 200px;" align="center">
		   					<table id="tableID" style="width: 100%;padding-left: 20px; margin-left: 10px; margin-top:20px;">
		   						
		   						<tbody>
		   							<tr>
		   								<td>
		   									<span>이름</span>
		   								</td>
		   								<td>
		   									<input type="text" id="korname" style=" border: none; border-bottom: 2px solid red; width: 230px;">
		   								</td>
		   							</tr>
		   							<tr>
		   								<td>
		   									<span>이메일 주소  </span>
		   								</td>
		   								<td>
		   									<input type="text" id="emailID" style="width : 230px; border: none;
    border-bottom: 2px solid red;">
		   								</td>
		   							</tr>
		   							<tr>
		   								
		   							</tr>
		   						</tbody>
		   					</table>
		   					<div style="line-height:50px; vertical-align: middle;">
		   						
		   						
		   					
		   						
		   						
		   						<div  style=" margin-top:7px; margin-left:40px" id="login_button">
									<button type="button"  style="color: white; height:45px; width:230px;
										 background-color:#910019; margin-top:40px; margin-left: 5px;  border: #910019;"  onClick="">
										<span style=" letter-spacing: 5px;">아이디 찾기</span>
									</button>
								</div>
		   						
		   						
		   						
		   						
		   						
		   					</div>
		   					<div style="clear:both;"></div>
		   					
		   				</div>
		   				
		   			  
					    </td>
					    
					    
					    
					    <!-- 오른쪽 시작 -->
					    
					    <td style="width:50%; padding-left:10px">
					    
					    <div style= "margin-left:2cm ;">
					    	<div id="top_row" style="width: 100%; padding-top: 5px; font-weight: bold;">
								<span style="border-bottom: 1px solid black; font-size: 120%;">Password 찾기</span>
			   				</div>
			   				
			   				
			   						
				   				<div id = "block" class="right-box" align="center" style="width:100%;height: 200px;">
									<div>
										<table id="tablePW" style="width: 100%;padding-left: 20px; margin-left: 10px margin-top:20px;">
				   							
				   							<tbody>
				   								<tr>
				   									<td>
				   										<br>
				   										
				   										<span>아이디</span>
				   									</td>
				   									<td>
				   										<br>
				   										<input type="text" id="id" style="margin-left: 14px; width: 230px;">
				   									</td>
				   								</tr>
				   								
				   								<tr>
				   									<td>
				   										<span>이메일 주소  </span>
				   									</td>
				   									<td>
				   										<input type="text" id="emailPW" style="margin-left: 14px; width: 230px;">
				   									</td>
				   								</tr>
				   								<tr>
				   								</tr>
				   						</tbody>
			   						</table>
			   						
			   						
			   						
			   						
			   						
			   						<div align = "center"  style=" margin-top:7px; margin-left:70px" id="login_button">
									<button type="button"  style="color: white; height:45px; width:230px;
										 background-color:#910019; margin-top:40px; margin-left: 5px;  border: #910019;"  onClick="">
										<span style="letter-spacing: 5px;">비밀번호 찾기</span>
									</button>
								</div>
		   						
			   						<div style="clear:both;"></div>
								</div>   				
			   				</div>
			   				
			   				</div>
					    
					    </td>
					  </tr>
					</table>
							
				</div>
			
			
			
			
			
			
			
			
			
			</div>
			
		</div>
		<div style="clear:both;"></div>
		
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		
		<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
	</div>
</div>
<!-- e:container -->