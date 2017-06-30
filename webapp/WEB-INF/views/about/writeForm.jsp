<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
var chkTitle = false;
var chkContent = false;
var params;

function chkValid(){
	var params = $("#notice_info").serialization();
	
	
	alert("fix: "+ params.fix);
	
	//타이틀 체크
	if(params.title == null || params.title==""){
		alert("제목을 입력하여 주십시오.");
		$("#title").val('');
		$("#title").focus();
		return false;
	}//타이틀 통과
	
	//내용 체크
	if(params.content==null||params.content==""){
		alert("내용을 입력하여 주십시오.");
		$("#content").focus();
		return false;
	}//내용 통과
	
	return true;
	
}

function addNotice(){
		var params = $("#notice_info").serialization();
		
		params.fix = $("input[name=fix]:checked").val();
		
		var url="/About/addNewNotice";
		if(chkValid()){
			
				$.post(url, params, function(data){
					if(data>0){
						alert("작성되었습니다.");
					}else{
						alert("작성 실패하였습니다. 다시 시도해 주시기 바랍니다."
								+ "Data: " +data);
					}
					location.href="/About/notice";
				}).fail(function(){
					alert("작성 실패하였습니다. 다시 시도해 주시기 바랍니다.");
				});
		}else{
			return;
		}
}
</script>

<style type="text/css">
#title_list li>a:active {
	font-size: 110%;
	font-weight: bold;
	text-decoration: none;
}

#title_list li>a:hover {
	text-decoration: none;
	font-size: 110%;
	font-weight: bold;
	opacity: 1;
	color: black;
}

#title_list li>a:visited {
	font-size: 110%;
	font-weight: bold;
	text-decoration: none;
}

#title_list li>a {
	opacity: 0.4;
	text-decoration: none;
}

</style>


<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width: 100%"></div>
	<div class="row">
		<div class="main_body" style="overflow: hidden;">
			<div id="left_menu" style="float: left; width: 130px; border-right: 1px solid #ccc;">
				<div id="l_title" style="font-weight: bold; font-size: 130%">ABOUT
				</div>
				<ul id="title_list"
					style="list-style: none; padding-left: 0px; text-decoration: none;">
					<li><a href="/About/introWisckey">-위스키 소개</a></li>
					<li><a href="/About/introUniv">-학교소개</a></li>
					<li><a href="/About/notice">-공지사항</a></li>
					<li><a href="/About/otherSites">-주요사이트 소개</a></li>
				</ul>
			</div>

			<div class="center_menu" style="float: left; margin-left: 10px; width: 900px; height: 100%;">
				<div id="write_form" style="width: 935px; height: 20%; border: 2px solid #00ffff">
					<table id="notice_info" style="width: 900px; ">
							<tr style="border: 1px solid #ccc">
								<td style="text-align: center; width: 150px;">제목</td>
								<td>
									<input type="text" id="title" style="width:400px"></input>
									<span><input type="radio" name="fix" value="F">고정 공지사항
									<input type="radio" name="fix" value="N">임시 공지사항</span>
								</td>
							
							</tr>
							<tr>
								<td style="text-align:center; width: 200px;">작성자</td>
								<td><input type="text" id="writer"></td>
							</tr>
							<tr style="border: 1px solid #ccc">
								<td style="text-align: center; width: 150px;">내용</td>
								<td><textarea rows="15" cols="130" id="content" style="width: 750px; text-align: left;"></textarea></td>
							</tr>
					</table>
				</div> 
				<div style="float:right;">
					<button type="button" class="btn confirm" onClick="javascript:addNotice()">확인</button>
				</div>
			</div>
		</div>
	</div>
</div>
    
    
    
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
    