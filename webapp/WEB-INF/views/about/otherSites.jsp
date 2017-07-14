<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
</style>
<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width: 100%"></div>
	<div class="row">
		<div class="main_body" style="overflow: hidden;">
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

			<div class="center_menu" style="float: left; margin-left: 35px; width: 870px;">
				<div style="width: 100%; margin-top:10px; float:left;">
					<b style="font-size: 30px;">주요사이트</b>
				</div>
				<div>
					
				</div>
			</div>
		</div>
	</div>
</div>



<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
