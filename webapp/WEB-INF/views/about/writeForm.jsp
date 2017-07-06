<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">

	$(document).ready(function() {
		var editor = CKEDITOR.replace('content',{});

		$("#addData").click(function() {
			var url = "/About/addNewNotice";
			var content = CKEDITOR.instances.content.getData();
			var params = $.extend({}, $("#notice_info").serialization(), {content:content});
				
			if(params.title == null||params.title==""){
				alert("제목을 입력하여 주십시오.");
				$("#title").focus();
				return;
			}else if(params.content == null || params.content == ""){
				alert("내용을 입력하여 주십시오.");
				$("#content").focus();
				return;
			}else{
				$.post(url, params, function(data) {
					console.log(data);
					$(location).attr("href", "/About/viewNotice?nid="+data);
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
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width: 100%"></div>
	<div class="row">
		<div class="main_body" style="overflow: hidden;">
			<div id="left_menu"
				style="float: left; width: 130px; border-right: 1px solid #ccc;">
				<div id="l_title" style="font-weight: bold; font-size: 130%">ABOUT
				</div>
				<ul id="title_list"
					style="list-style: none; padding-left: 0px; text-decoration: none;">
					<li><a href="/About/introWisckey">-위스키 소개</a></li>
					<li><a href="/About/introUniv">-학교소개</a></li>
					<li><a href="/About/notice">-공지사항</a></li>
					<li><a href="/About/otherSites">-주요사이트</a></li>
				</ul>
			</div>

			<div class="center_menu"
				style="float: left; margin-left: 10px; width: 900px; height: 100%;">
				
				<div id="write_form"
					style="width: 935px; height: 20%; border: 2px solid #00ffff">
					
					
					<table id="notice_info" style="width: 900px;">
						<tr style="border: 1px solid #ccc">
							<td style="text-align: center; width: 150px;">제목</td>
							<td><input type="text" id="title" style="width: 400px"></input>
						</tr>
						<tr style="border: 1px solid #ccc">
							<td style="text-align: center; width: 150px;">내용</td>
							<td><textarea id="content" style="width: 680px; height: 400px; text-align: left;"></textarea></td>
						</tr>
					</table>
					
					
				</div>
				
				<div style="float: right;">
					<button type="button" class="btn confirm" id="addData">등록</button>
				</div>
			
			</div>
		</div>
	</div>
</div>



<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
