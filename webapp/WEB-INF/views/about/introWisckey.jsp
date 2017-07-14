<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>

<script type="text/javascript">
function viewNotice(nid){
	var url = "/About/viewNotice?nid=" + nid;
	$(location).attr("href", url);
}
</script>

<style type="text/css">
	#title_list_about li>a:active {
	font-size: 105%;
	font-weight: bold;
	text-decoration: none;
}

#title_list_about li>a:hover {
	text-decoration: none;
	font-size: 105%;
	font-weight: bold;
	opacity: 1;
	color: black;
}

#title_list_about li>a:visited {
	font-size: 105%;
	font-weight: bold;
	text-decoration: none;
}

#title_list_about li>a {
	opacity: 0.7;
	text-decoration: none;
	
}

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

#title_list_about>li{
	list-style-type: disc; 
	list-style-position: inside;	
}

#title_list_notice>li{
	list-style-type: decimal;
	
}

#center{
	border: 2px solid #808080;
	border-radius: 25px;
	padding-left: 10px;
	box-shadow: 2px 2px #778899;
	margin-left: 30px;
}


</style>

<!-- s:container -->
<div class="container">
	<jsp:include page="/WEB-INF/views/common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width:100%;"></div>
	<div class="row">
		<div class="main_body" style="overflow:hidden">
			<div id="left_menu" style="float: left; width: 150px;"> <!-- -20px -->
				<div id="left_menu" style="float: left; width: 150px;"> <!-- -20px -->
					<div id="l_first_title" style="font-weight: bold; padding: 15px;">
						<span style="font-weight: bold; padding-left:5px; font-size: 110%;">ABOUT <br/></span>
						<ul id="title_list_about" style="list-style: none; padding-left: 10px; text-decoration: none; padding-top: 5px;">
							<li><a href="/About/introWisckey">위스키 소개</a></li>
							<li><a href="/About/introUniv">학교소개</a></li>
							<li><a href="/About/notice">공지사항</a></li>
							<li><a href="/About/otherSites">주요사이트</a></li>
						</ul>
					</div>
					<div style="clear: both;"></div>
					<div id="l_second_title" style="font-size: 115%; margin-top: 20px; padding: 15px;">
						<span style="font-weight: bold;">공지사항 <br/></span>
						<ol id="title_list_notice" style=" padding-left: 15px; text-decoration: none; padding-top:5px;">
							<c:forEach items="${aboutList}" var="notice" begin="0" end="3" varStatus="status" >
								<c:choose>
									<c:when test="${status.index < 3}">
										<li onClick="javascript:viewNotice(${notice.nid});" style="cursor: pointer; font-weight: bold; font-size:80%;">${notice.title }</li>
									</c:when>
									<c:otherwise>
										<li onClick="javascript:viewNotice(${notice.nid});" style=" cursor: pointer; font-size: 80%; ">${notice.title}</li>
									</c:otherwise>
								</c:choose>							
							</c:forEach>
						</ol>
					</div>
				</div>
			</div>
			
			<div class="center_menu" id="center" style="width: 800px; float:left;">
				<div id="center_s_menu1" style="text-align: center; width: 100%;" >
					<img style="width: 80%; "src="../images/LOGO1.png">
				</div>
				<div style="clear: both;"></div>
				<div id="center_s_menu2" style="overflow: hidden; margin-left:50px;">
					<div id="center_s_menu2_1" style="width: 490px;float:left;">
						<h3>안녕하세요! <b>위스키</b>입니다!</h3><br/>
						<p style="margin-bottom: 80px;">
							여기에는 설명이 들어가는데요! <br/> <br/> 
							다들 여기서 글도 쓰고 자주 이용해주세요<br/><br/> 
							이용을 많이 해야 우리가 기분이 좋겠죠?<br/><br/> 
							다들 잘 지내시고<br/><br/> 
							공지사항 잘 확인해주세요.<br/><br/> 
							자... 위스키 소개가 얼마나 길어질지는 모르겠지만...<br/><br/><br/>
							
							일단 초기 디자인은 이런식으로 하려고해요.<br/><br/> 
							열심히 하고있으니까 꼭 잘 완성될거에요. 개발팀 화이팅!<br/><br/> 
							동물들이 써도 편리한 사이트로 만들어주세요!<br/><br/> 
							보람찬 하루 보내세요!<br/><br/> 
						</p>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>

<!-- e:container -->