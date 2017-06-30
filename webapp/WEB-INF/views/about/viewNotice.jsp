<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="../common/header.jsp"></jsp:include>

<style type="text/css">
#title_list li>a:active {
	font-size: 110%;
	font-weight: bold;
	text-decoration: none;
}

#title_list li>a:hover {
	text-decoration: none;
	font-size: 110%;
	font-weight: bold;
	opacity: 1;
	color: black;
}

#title_list li>a:visited {
	font-size: 110%;
	font-weight: bold;
	text-decoration: none;
}

#title_list li>a {
	opacity: 0.4;
	text-decoration: none;
}

</style>


<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width: 100%"></div>
	<div class="row">
		<div class="main_body" style="overflow: hidden;">
			<div id="left_menu" style="float: left; width: 130px; border-right: 1px solid #ccc;">
				<div id="l_title" style="font-weight: bold; font-size: 130%">ABOUT
				</div>
				<ul id="title_list"
					style="list-style: none; padding-left: 0px; text-decoration: none;">
					<li><a href="/About/introWisckey">-위스키 소개</a></li>
					<li><a href="/About/introUniv">-학교소개</a></li>
					<li><a href="/About/notice">-공지사항</a></li>
					<li><a href="/About/otherSites">-주요사이트 소개</a></li>
				</ul>
			</div>

			<div class="center_menu" style="float: left; margin-left: 10px; width: 900px; height: 100%;">
				<div id="write_form" style="width: 935px; height: 20%; border: 2px solid #00ffff">
					<table id="notice_info" style="width: 900px; ">
							<tr style="border: 1px solid #ccc">
								<td style="text-align: center; width: 150px;">제목</td>
								<td>
									<input type="text" id="title" style="width:400px"></input>
									<span><input type="radio" name="fix" value="F">고정 공지사항
									<input type="radio" name="fix" value="N">임시 공지사항</span>
								</td>
							
							</tr>
							<tr>
								<td style="text-align:center; width: 200px;">작성자</td>
								<td><input type="text" id="writer"></td>
							</tr>
							<tr style="border: 1px solid #ccc">
								<td style="text-align: center; width: 150px;">내용</td>
								<td><textarea rows="15" cols="130" id="content" style="width: 750px; text-align: left;"></textarea></td>
							</tr>
					</table>
				</div> 
				<div style="float:right;">
					<button type="button" class="btn confirm" onClick="javascript:addNotice()">확인</button>
				</div>
			</div>
		</div>
	</div>
</div>
    
    
    
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"></jsp:include>
    