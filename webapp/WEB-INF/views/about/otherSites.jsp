<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
	padding-left: 10px;
	box-shadow: 2px 2px #778899;
}
*/
#title_list_about>li{
	list-style-type: disc; 
	list-style-position: inside;	
}

#linkInfo {
    margin: 0.75em 0;
    padding: 0 1em;
    list-style: none;
}
.linkName:before { 
    content: "";
    border-color: transparent #111;
    border-style: solid;
    border-width: 0.35em 0 0.35em 0.45em;
    display: block;
    height: 0;
    width: 0;
    left: -1em;
    top: 0.9em;
    position: relative;
}
.name{
	width: 60%;
	display:inline-block;
}
.linkOther{
	margin-left: 25px;
}
</style>
<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width: 84.3%; margin-left: 100px; "></div>
	<div class="row">
		<div class="main_body" style="overflow:hidden">
			<div id="left_menu" style="float: left; width: 130px;  padding-top: 7px; margin-left: 40px;"> <!-- -20px -->
				<div id="l_first_title" style="font-weight: bold; border-right: 2px solid #910019; ">
					<div style="font-weight: bold; padding-left:5px; font-size: 110%; ">ABOUT <br/></div>
					<div style="clear:both;"></div>
					<ul id="title_list_about" style="list-style: none; padding-left: 10px; text-decoration: none; padding-top: 5px;">
						<li><a href="/About/introWisckey">위스키 소개</a></li>
						<li><a href="/About/introUniv">학교소개</a></li>
						<li><a href="/About/">공지사항</a></li>
						<li><a id="current"  href="/About/otherSites">주요사이트</a></li>
					</ul>
				</div>
					<!--  
					<div style="clear: both;"></div>
					<div id="l_second_title" style="font-size: 115%; margin-top: 20px; padding: 15px;">
						<span style="font-weight: bold;">공지사항 <br/></span>
						<ul id="title_list_notice" style=" padding-left: 5px; text-decoration: none; padding-top:5px;">
							<li id="notice_left" ></li>
						</ul>
					</div>
					-->
			</div>

			<div class="center_menu" style="float: left; margin-left: 50px; width: 700px; ">
				<div style="width: 100%; margin-top:10px; float:left; border-bottom: 5px solid #910019;">
					<b style="font-size: 30px; color: #910019; width: 200px;">주요사이트</b>
					<img src="../images/LOGO1.png" style="width:100px; height: 30px; margin-left: 445px;">
				</div>
				<div style="clear:both;"></div>
				<div>
					<ul id="linkInfo" style="width:100%; padding-left: 30px;">
						<li class="linkName">
							<span class="name">UW-Madison</span>
							<span class="linkOther"><a href="http://www.wisc.edu" target="_blank">http://www.wisc.edu</a></span>
						</li>	
						<li class="linkName">
							<span class="name">Campus Map</span>
							<span class="linkOther"><a href="http://map.wisc.edu" target="_blank">http://map.wisc.edu</a></span>
						</li>
						<li class="linkName">
							<span class="name">Office of Registrar(Tuition)</span>
							<span class="linkOther"><a href="http://registrar.wisc.edu" target="_blank">http://registrar.wisc.edu</a></span>
						</li>
						<li class="linkName">
							<span class="name">WISCARD</span>
							<span class="linkOther"><a href="http://wiscard.wisc.edu" target="_blank">http://wiscard.wisc.edu</a></span>
						</li>
						<li class="linkName">
							<span class="name">ISS (International Student Services)</span>
							<span class="linkOther"><a href="http://iss.wisc.edu" target="_blank">http://iss.wisc.edu</a></span>
						</li>
						<li class="linkName">
							<span class="name">GUTS (Greater University Tutoring Service)</span>
							<span class="linkOther"><a href="http://guts.studentorg.wisc.edu" target="_blank">http://guts.studentorg.wisc.edu</a></span>
						</li>
						<li class="linkName">
							<span class="name">The Writing Center</span>
							<span class="linkOther"><a href="http://www.writing.wisc.edu" target="_blank">http://www.writing.wisc.edu</a></span>
						</li>
						<li class="linkName">
							<span class="name">Health Insurances (SHIP)</span>
							<span class="linkOther"><a href="http://www.uhs.wisc.edu" target="_blank">http://www.uhs.wisc.edu</a></span>
						</li>
						<li class="linkName">
							<span class="name">Financial aid/Scholarships</span>
							<span class="linkOther"><a href="http://www.finaid.wisc.edu" target="_blank">http://www.finaid.wisc.edu</a></span>
						</li>
						<li class="linkName">
							<span class="name">Libraries</span>
							<span class="linkOther"><a href="http://www.library.wisc.edu" target="_blank">http://www.library.wisc.edu</a></span>
						</li>
						<li class="linkName">
							<span class="name">Housing</span>
							<span class="linkOther"><a href="http://housing.wisc.edu" target="_blank">http://housing.wisc.edu</a></span>
						</li>
						<li class="linkName">
							<span class="name">Recreational Sports</span>
							<span class="linkOther"><a href="http://www.recsports.wisc.edu" target="_blank">http://www.recsports.wisc.edu</a></span>
						</li>
						<li class="linkName">
							<span class="name">Division of IT (DoIT: Computing, Tech store)</span>
							<span class="linkOther"><a href="http://www.doit.wisc.edu" target="_blank">http://www.doit.wisc.edu</a></span>
						</li>
						<li class="linkName">
							<span class="name">Student Job Center</span>
							<span class="linkOther"><a href="http://jobcenter.wisc.edu" target="_blank">http://jobcenter.wisc.edu</a></span>
						</li>
						<li class="linkName">
							<span class="name">KUSA (Korean Undergraduate Students Association)</span>
							<span class="linkOther"><a href="http://www.facebook.com/uwkusa" target="_blank">http://www.facebook.com/uwkusa</a></span>
						</li>
						<li class="linkName">
							<span class="name">UWKSSA</span>
							<span class="linkOther"><a href="http://www.uwkssa.org/mainnew/" target="_blank">http://www.uwkssa.org/mainnew/</a></span>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>



<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
