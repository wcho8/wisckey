<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<script type="text/javascript">
$(document).ready(function(){
	$(".current").removeClass('current');
	$("#manMyOrg").addClass('current');
	$("#intro").empty();
	var url = "/Org/findMyOrgList";
	var userno = "${session.userno}";
	reloadOrgs();
});

function reloadOrgs(){
	$("#intro").empty();
	var url = "/Org/findMyOrgList";
	var userno = "${session.userno}";
	$.post(url, {userno:userno}, function(data){
		$.each(data, function(index, item){
			var vprname = "";
			if(item.vprname1 == '' || item.vprname1 == null){
				if(item.vprname2 == '' || item.vprname2 == null){
					vprname = "없음";
				}
				else{
					vprname = item.vprname2;
				}
			}else{
				if(item.vprname2 == '' || item.vprname2 == null){
					vprname = item.vprname1;
				}
				else{
					vprname = item.vprname1 + ", " + item.vprname2;
				}
			}
			var div = "<div id='" + item.orgid + "' style='height:140px;margin:0px 10px;margin-top:10px;border-bottom:1px dashed #cacaca'>";
				div += "	<div style='float:left; width:20%;'>                                                           ";
				div += "		<img src='data:image/jpg;base64," + item.filecontent + "' style='width:100%;padding:10px;'/>         "; //TODO: Image 테이블에서 이미지 가져오기
				div += "	</div>                                                                                         ";
				div += "	<div style='float:left; width:70%;margin-top:10px;padding:10px 0px;font-size:12px;'>           ";
				div += "		<div id='info' style='float:left; width:30%; padding-left:10px;'>                          ";
				div += "			<b>정보</b>                                                                              ";
				div += "			<ul class='no_li' style='padding:0px;'>                                                              ";
				div += "				<li> <b>이름: " + item.orgname + "</b> </li>                                         ";
				div += "				<li> <b>회장: " + item.prname + "</b> </li>                                          ";
				div += "				<li> <b>부회장: " + vprname + "</b> </li>                                        ";
				div += "			</ul>                                                                                  ";
				div += "		</div>                                                                                     ";
				div += "		<div style='min-height:80px; width:70%;float:left;padding-right:20px'><b>한줄 소개</b><br/>" + item.comment + "<br/></div></div>";
				div += "	<div style='float:left;width:10%;margin-top:10px;padding:10px 0px; font-size:12px;''>                   ";
				div += "		<a href='javascript:editMyOrg(" + item.orgid + ")'><img src='/images/icon/edit.png' style='width:15px;'/></a>                                          ";
				div += "	</div>                                                                                                 ";
				div += "</div>                                                                                                    ";
			$("#intro").append(div);
		});
	});
}

function editMyOrg(orgid){
	var url = "/Org/EditMyOrg?orgid=";
	$(location).attr('href', url + orgid);
}

function viewOrg(orgid){
	var title = '동아리 정보';
	var objDialog = $("#org_detail_dialog")
	objDialog.dialog({
		title:title,
		modal:true,
		width:700,
		height:700,
		resizable:false,
		draggable:false,
		open:function(){
		},
		close:function(){
			
		}
	});
}
</script>
<style>
.cat_content{
height:100%;
float:left;
width:25%;
}
.cat_content>div{
height:100%;
width:100%;
border-radius:1em;
border:1px solid black;
}
li{
list-style:
}

div.tab{
	text-align:center;
	overflow:hidden;
}
div.tab button{
	background-color: #ccc;
	float: left;
	outline:none;
	cursor:pointer;
	padding: 7px 8px;
	border:0.5px solid #ccc;
	border-bottom: none;
	border-top-left-radius:6px;
	border-top-right-radius:6px;
}
div.tab button:hover{
	font-weight: bold;
}
div.tab button.active{
	background-color: #b3001e;
	color: white;
	font-weight: bold;
	font-size: 100%;
	border-bottom-color: none;
}

div.tabcontent{
	width: 642px;
	padding: 6px 12px;
	border: 1px solid #ccc;
}
.act_div{
	background-color:#b3001e !important;
	color:white;
}
</style>
<!-- s:container -->
<div class="container">
	<jsp:include page="/WEB-INF/views/common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width: 84.3%; margin-left: 100px; "></div>
	<div class="row">
		<div class="main_body" style="overflow:hidden">
			<jsp:include page="./leftmenu.jsp"></jsp:include>			
			<div class="center_menu" id="center" style="width: 700px; float:left; margin-left:30px;">
				<div id="intro" style="width:100%;margin-bottom:20px;border:1px solid #cacaca;background-color:white;">
					
				</div>
			</div>
			<div id="org_detail_dialog" style="display:none;">
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>

<!-- e:container -->