<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
%>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">

$(document).ready(function(){
	$("#passwd").keydown(function(key){
		if(key.keyCode == 13){
			login();
		}
	});
	$("#login").show();
	$("#login_button").show();
	$("#login_function").show();
	$("#userinfo").hide();
	
	<c:if test="${session.userno != null && session.userno != ''}">
		$("#login").hide();
		$("#login_button").hide();
		$("#login_function").hide();
		$("#userinfo").show();
	</c:if>
});

</script>
<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width:100%;"></div>
	<div class="row">
		<div class="main_body">
			<div class="body_top">
				<div class="fLeft" id="carousel_div">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>

						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img src="../images/sample_carousel_1.jpg" />
							</div>
							<div class="item">
								<img src="../images/sample_carousel_2.jpg" />
							</div>
							<div class="item">
								<img src="../images/sample_carousel_3.jpg" />
							</div>
						</div>
						<a class="left carousel-control" href="#myCarousel" role="button"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							role="button" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
				<div class="fLeft" id="top_right">
					<img src="../images/common/wisckey_1.png" style="height:150px;width:290px;margin-left:-20px;">		
					<table id="login" style=" width:190px;float:left;">
						<tr>
							<td><input type="text" placeholder="아이디" style="margin-bottom: 5px; width:95%;" id="userid"></td>
						</tr>
						<tr>
							<td><input type="password" placeholder="패스워드" style="width:95%;" id="passwd"></td>
						</tr>
					</table>
					<div style="float:left; margin-top:13px;" id="login_button">
						<button type="button" class="btn btn-warning" style="height:50px;" onClick="javascript:login()">로그인</button>
					</div>
					<div style="margin-top:10px; float:left;" id="login_function">
						<a href="#">아이디/비밀번호 찾기</a> | <a href="/Member/">회원가입</a>
					</div>
					<div id="userinfo">
						안녕하세요  ${session.nickname} 님
						<a href="/LogInOut/Logout"><button type="button" class="btn btn-warning" style="height:50px;">로그아웃</button></a>
					</div>
				</div>
			</div>
			<div class="body_mid">
				
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>

<!-- e:container -->