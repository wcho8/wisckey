<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<jsp:include page="../common/header.jsp"></jsp:include>

<style type="text/css">
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

</style>
<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width:100%;"></div>
	<div class="row">
		<div class="main_body" style="width:100%;">
			<div id="left_menu" style="float: left; width: 130px;  padding-top: 7px; margin-left: 40px;"> <!-- -20px -->
				<div id="l_first_title" style="font-weight: bold; border-right: 2px solid #910019; ">
					<div style="font-weight: bold; padding-left:5px; font-size: 110%; ">뭐라고 하지 <br/></div>
					<div style="clear:both;"></div>
					<ul id="title_list" style="list-style: none; padding-left: 10px; text-decoration: none; padding-top: 5px;">
						<li><a id="current" href="/FAQ">FAQ</a></li>
						<li><a href="/Q&A">Q&A</a></li>
					</ul>
				</div>
			</div>
   			<div class="center_menu" style="width: 700px; float:left;">
   				<img src="/images/FAQ.jpg" style="width:100%; margin-left:5%;">
			</div>
		</div>
		<div style="clear:both;"></div>
		<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
	</div>
</div>
<!-- e:container -->