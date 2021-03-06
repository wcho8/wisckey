<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>

<script type="text/javascript">
$(document).ready(function(){
	if(window.location.hash == "#1"){
		$("#tab_serviceTerms").trigger('click');
	}else if(window.location.hash == "#2"){
		$("#tab_privacyPolicy").trigger('click');
	}else if(window.location.hash == "#3"){
		$("#tab_introManager").trigger('click');
	}else{
		$("#defaultButton").css("background","#b3001e");
		document.getElementById("defaultButton").style.color = "white";
		document.getElementById("defaultButton").style.fontWeight = "bold";
	}
	
});

function openTab(linkName){
	$.each($(".tabcontent"), function(index, item){
		$(item).hide();
	});
	
	$.each($(".tablink"), function(index, item){
		$(item).removeClass("active");
	});
	
	$("#"+linkName).css('display', 'block');
	
	if(linkName == 'introWisckey'){
		$("#defaultButton").addClass("active")
		$("#defaultButton").css('background', '#b3001e');
		$("#defaultButton").css('color', 'white');
		$("#defaultButton").css('fontWeight', 'bold');
		return;
	}else{
		$("#tab_"+linkName).addClass("active");
		$("#defaultButton").css('background', '#ccc');
		$("#defaultButton").css('color', 'black');
		$("#defaultButton").css('fontWeight', 'normal');
	}
}

function viewNotice(nid){
	var url = "/About/viewNotice?nid=" + nid;
	$(location).attr("href", url);
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

#title_list_about>li{
	list-style-type: disc; 
	list-style-position: inside;	
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
	margin-right: 8px;
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
</style>

<!-- s:container -->
<div class="container">
	<jsp:include page="/WEB-INF/views/common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width: 84.3%; margin-left: 100px; "></div>
	<div class="row">
		<div class="main_body" style="overflow:hidden">
			<div id="left_menu" style="float: left; width: 130px;  padding-top: 7px; margin-left: 40px;"> <!-- -20px -->
				<div id="l_first_title" style="font-weight: bold; border-right: 2px solid #910019; ">
					<div style="font-weight: bold; padding-left:5px; font-size: 110%; ">ABOUT <br/></div>
					<div style="clear:both;"></div>
					<ul id="title_list_about" style="list-style: none; padding-left: 10px; text-decoration: none; padding-top: 5px;">
						<li><a id="current" href="/About/introWisckey">위스키 소개</a></li>
						<li><a href="/About/introUniv">학교소개</a></li>
						<li><a href="/About/">공지사항</a></li>
						<li><a href="/About/otherSites">주요사이트</a></li>
					</ul>
				</div>
			</div>
			
			<div class="center_menu" id="center" style="width: 700px; float:left;">
				<div id="center_s_menu1" style="text-align: center; width: 100%;" >
				</div>
				<div style="clear: both;"></div>
				<div id="center_s_menu2" style="overflow: hidden; margin-left:50px;">
					<div class="tab" align="center">
						<button class="tablink"  id="defaultButton" onclick="openTab('introWisckey')" style="width:23%; background-color:#b3001e;">위스키 소개 </button>
						<button class="tablink" id="tab_introManager" onclick="openTab('introManager')" style="width:23%; margin-left:6px;"> 운영진 소개 </button>
						<button class="tablink" id="tab_serviceTerms" onclick="openTab('serviceTerms')" style="width:23%; margin-left:6px;">이용약관</button>
						<button class="tablink" id="tab_privacyPolicy" onclick="openTab('privacyPolicy')" style="width:23%; margin-left:8px;">개인정보 보호정책</button>
					</div>
					<div style="clear:both;"></div>
					<div id = "introWisckey" class="tabcontent" >
						<img src="/images/intro_wisckey.jpg" style="border: none; width:100%; height: 100%;"> 	
					</div>
					<div id = "introManager" class="tabcontent" style="display:none;" >
						<img src="/images/intro_manager.png" style="border: none; width:100%; height: 100%;"> 					
					</div>
					<div id = "serviceTerms" class="tabcontent" style="display:none;">
						<iframe class="doc" src="/images/service_terms.jpg" 
							style=" border: none; width:100%; height: 500px;"> 
						</iframe>
					</div>
					<div id = "privacyPolicy" class="tabcontent" style="display:none;">
						<iframe class="doc" src="/images/privacy_policy.jpg" 
							style=" border: none; width:100%; height: 500px;"> 
						</iframe>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>

<!-- e:container -->
