<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<script type="text/javascript">
$(document).ready(function(){
	$(".current").removeClass('current');
	$("#left_intro").addClass('current');
	changeIntro(1);
});

function changeIntro(oid){
	$("#intro").empty();
	switch(oid){
	case 1:
		$(".act_div").removeClass("act_div");
		$("#academic").addClass('act_div');
		break;
	case 2:
		$(".act_div").removeClass("act_div");
		$("#sports").addClass('act_div');
		break;
	case 3:
		$(".act_div").removeClass("act_div");
		$("#hobby").addClass('act_div');
		break;
	case 4:
		$(".act_div").removeClass("act_div");
		$("#religion").addClass('act_div');
		break;
	}
	var url = "/Org/findOrgListData";
	$.post(url, {orgtypeid: oid}, function(data){
		$.each(data, function(index, item){
			var vprname = "";
			if(item.vprname1 == '' || item.vprname1 == null){
				vprname1 = "없음";
			}else{
				vprname1 = item.vprname1;
			}
			if(item.vprname2 == '' || item.vprname2 == null){
				vprname2 = "없음";
			}else{
				vprname2 = item.vprname2;
			}
			var div = "<div id='" + item.orgid + "' style='height:140px;margin:0px 10px;margin-top:10px;border-bottom:1px dashed #cacaca'>";
				div += "	<div style='float:left; width:20%;'>                                                           ";
				if(item.filecontent != null && item.filecontent != ''){
					div += "		<img src='data:image/jpg;base64,"+ item.filecontent +"' style='width:100%;padding:10px;'/>         "; 
				}else{
					div += "		<img src='/images/noimage.png' style='width:100%;padding:10px;'/>         ";
				}
				div += "	</div>                                                                                         ";
				div += "	<div style='float:left; width:80%;margin-top:10px;padding:10px 0px;font-size:12px;'>           ";
				div += "		<div id='info' style='float:left; width:30%; padding-left:10px;'>                          ";
				div += "			<b>정보</b>                                                                              ";
				div += "			<ul class='no_li' style='padding:0px;font-size:14px;'>                                                              ";
				div += "				<li style='font-size:20px;'> <b>" + item.orgname + "</b> </li>                                         ";
				div += "				<li> <b>회장: " + item.prname + "</b> </li>                                          ";
				div += "				<li> <b>부회장: " + vprname1 + ", " + vprname2 + "</b> </li>                                        ";
				div += "			</ul>                                                                                  ";
				div += "		</div>                                                                                     ";
				div += "		<div style='min-height:80px; padding-right:20px'><b>한줄 소개</b><br/>" + item.comment + "<br/></div>";
				div += "		<div style='float:right;padding-right:20px;'><a href='javascript:viewOrg(" + item.orgid + ")'>자세히 보기</a></div>";
				div += "	</div>                                                                                         ";
				div += "</div>                                                                                            ";
			$("#intro").append(div);
		});
	});
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
			$.post("/Org/getOrgData", {orgid:orgid}, function(data){
				if(data == null || data == ''){
					alert("데이터가 없습니다.");
					objDialog.dialog('close');
					return;
				}
				else{
					if(data.vprname1 == '' || data.vprname1 == null){
						vprname1 = "없음";
					}else{
						vprname1 = data.vprname1;
					}
					if(data.vprname2 == '' || data.vprname2 == null){
						vprname2 = "없음";
					}else{
						vprname2 = data.vprname2;
					}
					$("#org_img").attr('src', 'data:image/jpg;base64,'+ data.filecontent);
					$("#orgname").text(data.orgname);
					$("#prname").text(data.prname);
					$("#vprname1").text(vprname1);
					$("#vprname2").text(vprname2);
					$("#comment").text(data.comment);
					$("#org_details").html(data.details);
				}
			});
		},
		close:function(){
			$("#org_img").attr('src', '');
			$("#orgname").text('');
			$("#prname").text('');
			$("#vprname1").text('');
			$("#vprname2").text('');
			$("#comment").text('');
			$("#org_details").text('');
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
				<div class="categories" style="width:100%;">
					<div class="tab" align="center">
						<button class="tablink act_div" id="academic" onclick="javascript:changeIntro(1)" style="width:24%;"> 학술 </button>
						<button class="tablink" id="sports" onclick="javascript:changeIntro(2)" style="width:24%; margin-left:1.3%;"> 취미 </button>
						<button class="tablink" id="hobby" onclick="javascript:changeIntro(3)" style="width:24%; margin-left:1.3%;">스포츠</button>
						<button class="tablink" id="religion" onclick="javascript:changeIntro(4)" style="width:24%; margin-left:1.4%;">종교</button>
					</div>
				</div>
				<div style="width:100%;">
					<div id="intro" style="width:100%;margin-bottom:20px;border:1px solid #cacaca;background-color:white;">
					</div>
				</div>
			</div>
			<div id="org_detail_dialog" style="display:none;">
				<jsp:include page="./orgDetail.jsp" flush="false"></jsp:include>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>

<!-- e:container -->