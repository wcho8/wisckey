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
	
	$.post("./findTopBoardList", {}, function(data){
		$.each(data, function(index, item){
			var title = item.title
			if(title.length > 17){
				title = title.substring(0, 17);
				title += "...";
			}
			var li = "<li style='margin-top:8px;margin-left:0px;font-size:14px;'><a href='/Board/BoardView?brdid=" + item.brdid + "'>" + title
					+ "(" + item.likes + ")<span style='float:right;font-size:12px;'>" + item.regdate + "</span>";
			$("#topBoardList").append(li);
		});
	});
	
	$.post("./findRecentNoticeList", {}, function(data){
		$.each(data, function(index, item){
			var title = item.title
			if(title.length > 16){
				title = title.substring(0, 16);
				title += "...";
			}
			var li = "<li style='margin-top:8px;margin-left:0px;font-size:14px;'><a href='/About/viewNotice?nid=" + item.nid+ "'>" + title
					+ "<span style='float:right;font-size:12px;'>" + item.regdate + "</span>";
			$("#recentNotice").append(li);
		});
	});
});

function changeBest(ab){
	$("#a").show();
	$("#b").hide();
	if(ab == 1){
		$("#a").show();
		$("#b").hide();
	}else if(ab == 2){
		$("#a").hide();
		$("#b").show();
	}
}

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
							<!-- <li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li> -->
						</ol>

						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img src="../images/kohl_center.jpg" />
							</div>
							<!-- <div class="item">
								<img src="../images/sample_carousel_2.jpg" />
							</div>
							<div class="item">
								<img src="../images/sample_carousel_3.jpg" />
							</div> -->
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
			<div class="body_mid" style="width:100%; height:850px; margin-top:10px;">
				<div class="mid_left" style="float:left; width:35%; height:800px;">
					<div id="top_freeboard" class="body_div">
						<div class="body_inside">
							<a href="/Board/">Best 자유 게시판</a>
						</div>
						<div style="padding:3px; width:100%;font-size:14px;">
							<ol id="topBoardList" style="padding-left:0px;">
							</ol>
						</div>
					</div>
					<div id="websites" class="body_div mt15">
						<div class="body_inside">
							학교 주요사이트
						</div>
						<div style="padding:3px; width:100%;font-size:14px;">
							<ol id="" style="padding-left:0px;">
								<li style="margin-top:8px;maring-left:0px;font-size:14px;">
									<a href="http://www.wisc.edu">위스콘신 대학교 홈페이지</a>
								</li>
								<li style="margin-top:8px;maring-left:0px;font-size:14px;">
									<a href="http://www.wisc.edu">위스콘신 대학교 홈페이지</a>
								</li>
								<li style="margin-top:8px;maring-left:0px;font-size:14px;">
									<a href="http://www.wisc.edu">위스콘신 대학교 홈페이지</a>
								</li>
							</ol>
						</div>
					</div>
				</div>
				<div class="mid_right" style="float:left;width:65%; height:800px;">
					<div class="right_left" style="float:left; width:60%; height:100%;">
						<div id="top_etc" class="body_div">
							<div class="body_inside">
								Best 게시물 
								<span style="float:right; font-size:14px;padding-top:10px;padding-right:15px;">
								<a href="javascript:changeBest(1)" style="color:white;">취업</a> | <a href="javascript:changeBest(2)" style="color:white;">학업</a> 
								</span>
							</div>
							<div style="padding:3px;width:100%;font-size:14px;">
								<ul id="a" style="padding-left:0px;">
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=33">여기는 취업(23)<span
											style="float: right; font-size: 12px;">2017-07-11</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=34">여기는 취업((10)<span
											style="float: right; font-size: 12px;">2017-07-11</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=19">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ...(5)<span
											style="float: right; font-size: 12px;">2017-06-30</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=31">여기는 취업((2)<span
											style="float: right; font-size: 12px;">2017-07-06</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=13">여기는 취업((2)<span
											style="float: right; font-size: 12px;">2017-06-28</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=19">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ...(5)<span
											style="float: right; font-size: 12px;">2017-06-30</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=31">여기는 취업((2)<span
											style="float: right; font-size: 12px;">2017-07-06</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=13">여기는 취업((2)<span
											style="float: right; font-size: 12px;">2017-06-28</span></a></li>
								</ul>
								<ul id="b" style="padding-left:0px; display: none;">
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=33">여기는 학업(23)<span
											style="float: right; font-size: 12px;">2017-07-11</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=34">여기는 학업(10)<span
											style="float: right; font-size: 12px;">2017-07-11</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=19">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ...(5)<span
											style="float: right; font-size: 12px;">2017-06-30</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=31">여기는 학업(2)<span
											style="float: right; font-size: 12px;">2017-07-06</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=13">bb(2)<span
											style="float: right; font-size: 12px;">2017-06-28</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=19">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ...(5)<span
											style="float: right; font-size: 12px;">2017-06-30</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=31">여기는 학업(2)<span
											style="float: right; font-size: 12px;">2017-07-06</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=13">bb(2)<span
											style="float: right; font-size: 12px;">2017-06-28</span></a></li>
								</ul>
							</div>
						</div>
						<div id="top_tips" class="body_div mt15">
							<div class="body_inside">
								깨알팁 
								<span style="float:right; font-size:14px;padding-top:10px;padding-right:15px;">
								<a href="#" style="color:white;">맛집</a> | <a href="#" style="color:white;">벼룩시장</a>
								</span>
							</div>
							<div style="padding:3px;width:100%;font-size:14px;">
								<ul id="" style="padding-left:0px;">
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=33">여기는 팁(23)<span
											style="float: right; font-size: 12px;">2017-07-11</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=34">여기는 팁(10)<span
											style="float: right; font-size: 12px;">2017-07-11</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=19">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ...(5)<span
											style="float: right; font-size: 12px;">2017-06-30</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=31">여기는 팁(2)<span
											style="float: right; font-size: 12px;">2017-07-06</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=13">여기는 팁(2)<span
											style="float: right; font-size: 12px;">2017-06-28</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=19">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ...(5)<span
											style="float: right; font-size: 12px;">2017-06-30</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=31">여기는 학업(2)<span
											style="float: right; font-size: 12px;">2017-07-06</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=13">bb(2)<span
											style="float: right; font-size: 12px;">2017-06-28</span></a></li>
								</ul>
							</div>
						</div>
						<div id="orgs" class="body_div mt15">
							<div class="body_inside">
								<a href="#">학생회 & 동아리 소식</a>
							</div>
							<div style="padding:3px;width:100%;font-size:14px;">
								<ul id="" style="padding-left:0px;">
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=33">여기는 소식(23)<span
											style="float: right; font-size: 12px;">2017-07-11</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=34">여기는 소식((10)<span
											style="float: right; font-size: 12px;">2017-07-11</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=19">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ...(5)<span
											style="float: right; font-size: 12px;">2017-06-30</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=31">여기는 소식((2)<span
											style="float: right; font-size: 12px;">2017-07-06</span></a></li>
									<li style="margin-top: 8px; margin-left: 0px; font-size: 14px;"><a
										href="/Board/BoardView?brdid=13">여기는 소식((2)<span
											style="float: right; font-size: 12px;">2017-06-28</span></a></li>
									
								</ul>
							</div>
						</div>
					</div>
					<div class="right_right" style="float:left; width:40%; height:100%;">
						<div id="notice" class="body_div">
							<div class="body_inside">
								<a href="/About/">공지사항</a>
							</div>
							<div style="padding:7px;width:100%;font-size:14px;">
								<ul id="recentNotice" style="padding-left:0px;list-style:none;">
								</ul>
							</div>
						</div>
						<div id="advertise" class="body_div mt15">
							<img src="/images/truck.png" style="width:75%;margin-bottom:30px;padding-left:10px;" />
							<img src="/images/truck.png" style="width:75%;padding-left:10px;" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
		<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>

<!-- e:container -->