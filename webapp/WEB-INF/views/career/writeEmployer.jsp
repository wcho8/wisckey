<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<script type="text/javascript">
var upImgIds = [];
$(document).ready(function(){
	var defaultParams={
		brdid: "${paramVO.brdid}",
		userno: "${session.userno}",
		mypage: "${paramVO.mypage}"
	};
	
	//summernote 에디터
	$('#content').summernote({
		lang:'ko-KR',
		height: 400,
		callbacks:{
			onImageUpload: function(files){
				for(var i = files.length-1; i>=0; i--){
					sendFile(files[i], this);
				}
			}		
		}
	});
	
	//수정
	var brdid = defaultParams.brdid;
	var bEdit = false;
	if(brdid !=0 && brdid!='' && brdid != null){
		var url="/Career/findEmployerContent";
		bEdit = true;
		$.post(url, defaultParams, function(data){
			$('#title').val(data.title);
			$('#content').summernote('code', data.content);
		});
	}
	
	//데드라인
	$("#deadline").datepicker({
		dateFormat: "yy-mm-dd",
		changeMonth: true, 
		changeYear: true, 
		yearRange: "+0:+2"
	});
	
	$("#deadline").change(function(){
		var duedate = new Date($("#deadline").val());
		if(duedate < new Date()){
			alert("유효한 날짜가 아닙니다.");
			$("#deadline").val("");
			$("#deadline").focus();
		}
	});
	
	$("#addEmployer").click(function(){ 
		var url = "/Career/addEmployerData";
		var content = $("#content").summernote('code');
		
		var deadline = $("#deadline").val();
		
		var params = $.extend({}, $("#emplyContent").serialization(), {empid:1, content:content, deadline:deadline});
		
		if(params.title == null || params.title == ""){
			alert("제목을 입력하여 주십시오.");
			$("#title").focus();
			return;
		}
		if($("#content").summernote('isEmpty')){
			alert("내용을 입력하여 주십시오.");
			$("#content").summernote('focus');
			return;
		}
		if(bEdit){
			url = "/Career/modEmployerData";
			params.brdid = brdid;
			$.post(url, params, function(data){
				$(location).attr("href", "/Career/viewEmployer?brdid="+data);
			});
		}else{
			if(byteCheck(params.title)<=82){
				$.post(url, params, function(data){
					$(location).attr("href", "/Career/viewEmployer?brdid="+data);
				});
			}else{
				alert("제목 길이가 제한을 초과하였습니다.");
				$("#title").focus();
			}
		}
	});
	
	
});

function sendFile(file, el){
	var data = new FormData();
	data.append('file', file);
	$.ajax({
		data: data,
		type: "POST",
		url: "/Image/uploadImageFile",
		cache: false,
		contentType: false,
		enctype: 'multipart/form-data',
		processData: false,
		success: function(fid){
			var url = "/Image/loadImage/" + fid;
			$(el).summernote('insertImage', url, function($image){
				$image.attr('id', fid);
			});
			upImgIds.push(fid);
		}
	});
}

//제목 글자제한
function byteCheck(str){
	var byteLen = 0;
	for(var i = 0; i<str.length; i++){
		var eachChar = escape(str.charAt(i));
		if(eachChar.length == 1){
			byteLen++;
		}else if(eachChar.indexOf("%u") != -1){
			byteLen+=3;
		}else if(eachChar.indexOf("%") != -1){
			byteLen ++;
		}
	}
	
	return byteLen;
}
function titleByte(){
	var title = $("#title").val();
	var length = byteCheck(title);
	console.log(length+" bytes");
	if(length>82){
		var tmp = cutInUTF8(title,76);
		alert("제목 길이가 제한을 초과하였습니다.");
		$("#title").text(tmp);
		$("#title").focus();
		
	}
}
function cutInUTF8(str, n) {
    var len = Math.min(n, str.length);
    var i, cs, c = 0, bytes = 0;
    for (i = 0; i < len; i++) {
        c = str.charCodeAt(i);
        cs = 1;
        if (c >= 128) cs++;
        if (c >= 2048) cs++;
        if (n < (bytes += cs)) break;
    }
    return str.substr(0, i);
}

</script>


<style type="text/css">
#title_list_about li>a:hover {
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
#title_list_about li>a {
	opacity: 0.7;
	text-decoration: none;
	
}

#l_title{
/*
	border: 2px solid #808080;
	border-radius: 25px;
	padding-left: 10px;
	box-shadow: 2px 2px #778899;
*/
	border-right:2px solid #a80e34;
}
#title_list>li{
	list-style-type: disc;
	list-style-position: none ;
}

</style>
<!-- s:container -->
<div class="container">
	<jsp:include page="/WEB-INF/views/common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width:100%;"></div>
	<div class="row">
		<div class="main_body" style="overflow:hidden">
			<div class="left_menu" style="float:left; width:150px; padding-top: 7px; margin-left: 40px;">
				<div id="l_title" style="font-weight: bold;">
					<span style="font-weight: bold; margin-top: 10px; margin-left: 20px; font-size: 110%;">취업</span>
					<ul id="title_list" style="list-style:none; text-decoration: none;">
						<li><a id="current" href="/Career/">취업공고</a></li>
						<li><a href="/Career/employBoard">취업게시판</a></li>
					</ul>
				</div>
			</div>
			<div id="right_menu" style="float:left; width:700px; margin-left:30px;">
				
				
				<table style="width:100%;" id="emplyContent">
					<colgroup>
						<col width="15%" >
						<col width="*">
					</colgroup>
					<tbody>
						<tr style="border: 1px solid #ccc;">
							<th  style="text-align: center;"> 제목</th>
							<td>
								<input type="text" id="title" style="width:400px;" onKeyDown="javascript:titleByte()">
							</td>
						</tr>
						<tr style="border: 1px solid #ccc">
							<th style="text-align: center">접수기한</th>
							<td>
								<input type="text" id="deadline">
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
