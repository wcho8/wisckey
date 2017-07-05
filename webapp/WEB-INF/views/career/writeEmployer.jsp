<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	
	var editor=CKEDITOR.replace('content',{});
	

	$("#deadline").datepicker({
		dateFormat: "yy-mm-dd",
		changeMonth: true, 
		changeYear: true, 
		yearRange: "2017"
	});
	
	$("#dealine").change(function(){
		var duedate = new Date($("#deadline").val());
		if(duedate < new Date()){
			alert("유효한 날짜가 아닙니다.");
			$("#deadline").val("");
		}
	});
	$("input.timepicker").timepicker();
	
	$("#addEmployer").click(function(){ 
		var url = "/Career/addEmployerData";
		var content = CKEDITOR.instances.content.getData();
		
		var datepicker = $("#deadline").val();
		var timepicker = $("input.timepicker").val();
		
		var deadline = datepicker + " " + timepicker;
		
		var params = $.extend({}, $("#emplyContent").serialization(), {empid:1, content:content, deadline:deadline});
		
		if(params.title == null || params.title == ""){
			alert("제목을 입력하여 주십시오.");
			$("#title").focus();
			return;
		}else if(params.content == null || params.content == ""){
			alert("내용을 입력하여 주십시오.");
			$("#content").focus();
			return;
		}else{
			$.post(url, params, function(data){
				console.log(data);
				$(location).attr("href", "/Career/viewEmployer?brdid="+data);
			});
		}
	});
	
		
	
});

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
	<jsp:include page="/WEB-INF/views/common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width:100%;"></div>
	<div class="row">
		<div class="main_body" style="overflow:hidden">
			<div class="left_menu" style="float:left; width:130px; border-right: 1px solid #cccccc;">
				<div id="l_title" style="font-weight: bold; font-size:130%">취업</div>
				<ul id="title_list" style="list-style:none; padding-left:0px; text-decoration: none;">
					<li><a href="/Career/employer">-취업공고</a></li>
					<li><a href="/Career/employBoard">-취업게시판</a></li>
				</ul>
			</div>
			<div id="right_menu" style="float:left; width:870px; margin-left:30px;">
				
				
				<table style="width:100%;" id="emplyContent">
					<colgroup>
						<col width="15%" >
						<col width="*">
					</colgroup>
					<tbody>
						<tr style="border: 1px solid #ccc;">
							<th  style="text-align: center;"> 제목</th>
							<td><input type="text" id="title" style="width:400px;;"></td>
						</tr>
						<tr style="border: 1px solid #ccc">
							<th style="text-align: center">접수기한</th>
							<td>
								<input type="text" id="deadline">
								<input type="text" class="timepicker" id="deadline_time">
							</td>
						</tr>
						<tr style="border: 1px solid #ccc;">
							<th  style="text-align: center;">내용</th>
							<td style="padding-top: 8px; padding-bottom: 8px;">
								<textarea id="content" style="width:100%; height:400px; display:none;" valid="내용"></textarea>
							</td>
							
						</tr>
					</tbody>
				</table>
				
				
			<div class="buttons">
				<button class="btn newEmployer" id="addEmployer" style="float: right;">글쓰기</button>
			</div>
			</div>
		</div>
	</div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>