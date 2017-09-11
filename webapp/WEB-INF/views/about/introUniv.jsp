<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="../common/header.jsp"></jsp:include>

<script type="text/javascript">
$(document).ready(function(){

});

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
	text-decoration:none;
	font-size: 110%;
	font-weight: bold;
	opacity:1;
	color: black;
}
#title_list_about li>a {
	opacity: 0.7;
	text-decoration: none;
	
}
/*
#l_first_title{
	border: 2px solid #808080;
	border-radius: 25px;
	padding-left: 10px;
	box-shadow: 2px 2px #778899;
}

#l_second_title{
	border: 2px solid #808080;
	border-radius: 25px;
	padding-left: 5px;
	box-shadow: 2px 2px #778899;
}

#title_list_notice>li{
	list-style-type:none;
}
*/
#title_list_about>li{
	list-style-type: disc; 
	list-style-position: inside;	
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
						<li><a href="/About/introWisckey">위스키 소개</a></li>
						<li><a id="current" href="/About/introUniv">학교소개</a></li>
						<li><a href="/About/">공지사항</a></li>
						<li><a href="/About/otherSites">주요사이트</a></li>
					</ul>
				</div>
			</div>
			<div class="center_menu" id="center" style=" width: 700px; float:left; margin-left: 20px;">
				<img src="/images/intro_univ.png" style="width:100%; height: 100%;">				
	
			</div>
		</div>
	</div>

	

</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>