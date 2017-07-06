<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<script type="text/javascript">

</script>

<style>

	.center_menu{
		margin-left: 10px;
	}
	
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
			<div class="left_menu" style="float:left; width:130px; border-right: 1px solid #cccccc;">
				<div id="l_title" style="font-weight: bold; font-size:130%">ABOUT </div>
				<ul id="title_list" style="list-style:none; padding-left:0px; text-decoration: none;">
					<li><a href="/About/introWisckey">-위스키 소개</a></li>
					<li><a href="/About/introUniv">-학교소개</a></li>
					<li><a href="/About/notice">-공지사항</a></li>
					<li><a href="/About/otherSites">-주요사이트</a></li>
				</ul>
			</div>
			
			<div class="center_menu" style="width: 800px; height: 100%; float:left;">
				<div id="center_s_menu1" style="text-align: center;">
					<img src="../images/LOGO1.png">
				</div>
				<div id="center_s_menu2" style="overflow: hidden; margin-left:50px;">
					<div id="center_s_menu2_1" style="width: 490px;float:left;">
						<h3>안녕하세요. <b>위스키</b>입니다!</h3><br/>
						<h5>위스키가 뭐냐구요???</h5><br/>
						
						<p>궁금해요?? 궁금하면 5백원aaaaaaaaaaaaaaaaaaaabdfbdfbdfb</p>
						<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
						<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
						<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
						<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
						<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
						<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
						<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
						<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
						<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
						<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
						<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
						
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>

<!-- e:container -->