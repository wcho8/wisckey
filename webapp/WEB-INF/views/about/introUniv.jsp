<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<script type="text/javascript">

</script>

<style>
	#title_list li>a:active{
		font-size: 110%;
		font-weight: bold;
		text-decoration: none;
	} 
	
	#title_list li>a:hover{
		text-decoration: none;
		font-size: 110%;
		font-weight: bold;
		opacity: 1;
		color: black;
	} 
	
	#title_list li>a:visited{
		font-size: 110%;
		font-weight: bold;
		text-decoration: none;
	}
	
	#title_list li>a{
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
			<div class="left_menu" style="float:left; width: 130px; border-right: 1px solid #ccc">
				<div id="l_title" style="font-weight: bold; font-size:130%">ABOUT </div>
				<ul id="title_list" style="list-style:none; padding-left: 0px; text-decoration: none;">
					<li><a href="/About/introWisckey">-위스키 소개</a></li>
					<li><a href="/About/introUniv">-학교소개</a></li>
					<li><a href="/About/notice">-공지사항</a></li>
					<li><a href="/About/otherSites">-주요사이트</a></li>
				</ul>				
			</div>
			
			<div class="center_menu" style="margin-left: 10px; width: 800px; height:100%; float:left; border:1px solid #ccc">
				<div id="center_s_menu" style="text-align:center; border: 1px solid #00ff00;">
					<img src="../images/uwMadison.jpg" style="width:400px; height:200px;">
				</div>
			</div>
	
			<div class="right_menu">
				<div id="r_title">
					
				</div>
			</div>
		</div>
	</div>

	

</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>