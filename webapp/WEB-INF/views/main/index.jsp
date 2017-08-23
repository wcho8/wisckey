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
			if(byteCheck(title)> 19){
				title = cutInUTF8(title, 19);
				title += "...";
			}
			var li = "<li style='margin-top:8px;margin-left:0px;font-size:14px;'><a href='/Board/BoardView?brdid=" + item.brdid + "'>" + "<b>[" + item.typename + "]</b> " + title
					+ "(" + item.likes + ")<span style='float:right;font-size:12px;'>" + item.regdate + "</span>";
			$("#topBoardList").append(li);
		});
	});
	
	$.post("./findFoodList", {}, function(data){
		$.each(data, function(index, item){
			var title = item.title
			if(byteCheck(title)> 56){
				title = cutInUTF8(title, 56);
				title += "...";
			}
			var li = "<li style='margin-top:8px;margin-left:0px;font-size:14px;'><a href='/Tip/foodBoardView?brdid=" + item.brdid + "'>" + "<b>[" + item.typename + "]</b> " + title
					+ "<span style='float:right;font-size:12px;'>" + item.regdate + "</span>";
			$("#food_list").append(li);
		});
	});
	
	$.post("./findMarketList", {}, function(data){
		$.each(data, function(index, item){
			var title = item.title
			if(byteCheck(title)> 56){
				title = cutInUTF8(title, 56);
				title += "...";
			}
			var li = "<li style='margin-top:8px;margin-left:0px;font-size:14px;'><a href='/Tip/marketBoardView?brdid=" + item.brdid + "'>" + "<b>[" + item.typename + "]</b> " + title
					+ "<span style='float:right;font-size:12px;'>" + item.regdate + "</span>";
			$("#market_list").append(li);
		});
	});
	
	$.post("./findRecentNoticeList", {}, function(data){
		$.each(data, function(index, item){
			var title = item.title
			if(title.length > 13){
				title = title.substring(0, 13);
				title += "...";
			}
			var li = "<li style='margin-top:8px;margin-left:0px;font-size:14px;'><a href='/About/viewNotice?nid=" + item.nid+ "'>" + title
					+ "<span style='float:right;font-size:12px;'>" + item.regdate + "</span>";
			$("#recentNotice").append(li);
		});
	});
	
	$.post("./findEmployerList", {}, function(data){
		$.each(data, function(index,item){
			var title = item.title;
			
			if(byteCheck(title)> 74){
				title = cutInUTF8(title, 74);
				title += " ...";
			}
			
			var li="<li style='margin-top: 8px; margin-left: 0px; font-size: 14px;'><a href='/Career/viewEmployer?brdid="+ item.brdid + "'>" + "<b>[" + item.typename + "]</b> "+ title 
					+ "<span style='float: right; font-size: 12px;'>" + item.regdate + "</span></a></li>";
			$("#employer_list").append(li);

		})
	});
	$.post("./findEducationList", {}, function(data){
		$.each(data, function(index,item){
			var title = item.title;
			
			if(byteCheck(title)> 74){
				title = cutInUTF8(title, 74);
				title += " ...";
			}
						
			var li="<li style='margin-top: 8px; margin-left: 0px; font-size: 14px;'><a href='/Career/viewEmployer?brdid="+ item.brdid + "'>" + "<b>[" + item.typename + "]</b> "+title 
					+ "<span style='float: right; font-size: 12px;'>" + item.regdate + "</span></a></li>";
			$("#education_list").append(li);
		})
	});
	
	$.post("./findOrgBoardList", {}, function(data){
		$.each(data, function(index,item){
			var title = item.title;
			
			if(byteCheck(title)> 74){
				title = cutInUTF8(title, 74);
				title += " ...";
			}
						
			var li="<li style='margin-top: 8px; margin-left: 0px; font-size: 14px;'><a href='/Org/BoardView?brdid="+ item.brdid + "'>" + "<b>[" + item.orgname + "]</b> " + title 
					+ "<span style='float: right; font-size: 12px;'>" + item.regdate + "</span></a></li>";
			$("#orgs_list").append(li);
		})
	});
	
	var userid=$("#userid").val();
	$("#memberView").click(function(){
		var url = "/Member/memberView";
		$(location).attr("href", url);
		
	})
});
function changeBest(ab){
	$("#employer_list").show();
	$("#education_list").hide();
	if(ab == 1){
		$("#employer_list").show();
		$("#education_list").hide();
	}else if(ab == 2){
		$("#employer_list").hide();
		$("#education_list").show();
	}
}
function changeTips(ab){
	$("#food_list").show();
	$("#market_list").hide();
	if(ab == 1){
		$("#food_list").show();
		$("#market_list").hide();
	} else if(ab == 2){
		$("#market_list").show();
		$("#food_list").hide();
	}
}
function cutInUTF8(str, n) {
    var len = Math.min(n, str.length);
    var i, cs, c = 0, bytes = 0;
    for (i = 0; i < len; i++) {
        c = str.charCodeAt(i);
        cs = 1;
        if (c >= 128) cs++;
        if (c >= 2048) cs++;
        if (n < (bytes += cs)) break;
    }
    return str.substr(0, i);
}
function byteCheck(str){
	var byteLen = 0;
	for(var i = 0; i<str.length; i++){
		var eachChar = escape(str.charAt(i));
		if(eachChar.length == 1){
			byteLen++;
		}else if(eachChar.indexOf("%u") != -1){
			byteLen+=3;
		}else if(eachChar.indexOf("%") != -1){
			byteLen ++;
		}
	}
	return byteLen;
}
</script>
<style>
a:hover{
	font-weight: bold;
	text-decoration:none;
}
td{
	padding:5px;
}
</style>
<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width:88%; margin-left:auto;margin-right:auto;"></div>
	<div class="row">
		<div class="main_body">
			<div class="body_top">
				<div class="fLeft" id="carousel_div">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<!-- <li data-target="#myCarousel" data-slide-to="2"></li> -->
						</ol>

						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img src="../images/banner1.png" />
							</div>
							<div class="item">
								<img src="../images/banner2.png" />
							</div>
							<!-- <div class="item">
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
			</div>
			<div class="body_mid" style="width:100%; height:750px; margin-top:10px;">
				<div class="mid_left" style="float:left; width:27.7%; height:100%;">
					<div id="top_freeboard" class="body_div" style="height:484px;">
						<div class="body_inside">
							<a href="/Board/?ptypeid=1">Best 자유 게시판</a>
						</div>
						<div style="padding:3px; width:100%;font-size:14px;">
							<ol id="topBoardList" style="padding-left:0px;">
							</ol>
						</div>
					</div>
					<div id="notice" class="body_div mt15" style="height:208px;">
						<div class="body_inside">
							<a href="/About/">공지사항</a>
						</div>
						<div style="padding:3px;width:100%;font-size:14px;">
							<ul id="recentNotice" style="padding-left:0px;list-style:none;">
							</ul>
						</div>
					</div>
				</div>
				<div class="mid_right" style="float:left;width:72.3%; height:100%;">
					<div class="right_left" style="float:left; width:61.68%; height:100%;">
						<div id="top_etc" class="body_div" style="height:234px;">
							<div class="body_inside">
								Best 게시물 
								<span style="float:right; font-size:14px;padding-top:10px;padding-right:15px;">
								<a href="javascript:changeBest(1)" style="color:white;">취업</a> | <a href="javascript:changeBest(2)" style="color:white;">학업</a> 
								</span>
							</div>
							<div style="padding:3px;width:100%;font-size:14px;">
								<ul id="employer_list" style="padding-left:0px;">
								</ul>								
								<ul id="education_list" style="padding-left:0px; display: none;">
								</ul>
							</div>
						</div>
						<div id="top_tips" class="body_div mt15" style="margin-top:18px; height:232px;">
							<div class="body_inside">
								깨알팁 
								<span style="float:right; font-size:14px;padding-top:10px;padding-right:15px;">
								<a href="javascript:changeTips(1)" style="color:white;">맛집</a> | <a href="javascript:changeTips(2)" style="color:white;">벼룩시장</a>
								</span>
							</div>
							<div style="padding:3px;width:100%;font-size:14px;">
								<ul id="food_list" style="padding-left:0px;">
								</ul>
								<ul id="market_list" style="padding-left:0px; display:none;">
								</ul>
							</div>
						</div>
						<div id="orgs" class="body_div mt15" style="height:208px;">
							<div class="body_inside">
								<a href="#">학생회 & 동아리 소식</a>
							</div>
							<div style="padding:3px;width:100%;font-size:14px;">
								<ul id="orgs_list" style="padding-left:0px;">
								</ul>
							</div>
						</div>
					</div>
					<div class="right_right" style="float:left; width:38.32%; height:100%; border-top: 1px solid #CCC;">
						<div class="login" style="float:left; padding-top: 10px; padding-left: 15px; background-color: #f2f2f2; border-bottom: 1px solid #ccc;
								padding-bottom: 10px;">
							<table id="login" style=" float:left;width:280px;">
								<tr>
									<td ><input type="text" placeholder="아이디" style="width:95%;" id="userid"></td>
								</tr>
								<tr>
									<td><input type="password" placeholder="패스워드" style="width:95%;" id="passwd"></td>
								</tr>
							</table>
							<div id="userinfo" style="padding-top:20px; width:285px; margin">
								<div style="line-height: 60px; text-align:center;padding-right: 25px;">
									안녕하세요 <span style="font-weight: bold; "> ${session.nickname}</span> 님
								</div>
								
								<div class="detail" style=" width: 100%; height:45px; text-align:center; padding-right:25px;">
									<span style="font-size: 90%;"><a href="/Member/memberView">내 정보</a></span>
								</div>
								
								<a href="/LogInOut/Logout"> <button type="button" class="btn btn-warning" style="color: white; height:45px; width:255px;
								   background-color:#910019; margin-top:20px; margin-left: 5px; border: #910019;">
									<span style="letter-spacing: 5px;">LOGOUT</span></button>
								</a>
							</div>
							
							<div style="float:left; margin-top:13px;" id="login_button">
								<button type="button" class="btn btn-warning" style="color: white; height:45px; width:255px;
									 background-color:#910019; margin-top:20px; margin-left: 5px;  border: #910019;"  onClick="javascript:login()">
									<span style="letter-spacing: 5px;">LOGIN</span>
								</button>
							</div>
							
							<div style="clear:both;"></div>
							<div class="hr_dash" style="width: 255px; margin-left:5px;"></div>
							<div style="float:left;" id="login_function">
								<div style="float:left; margin-left:5px;display: inline-block; width: 60px;"><a href="/Member/">Sign Up</a></div>
							    <div style="float:left; display: inline-block; width:120px; margin-left: 85px;"><a href="/Member/findID&PW">Forgot Password?</a></div> 
							</div>
						</div>
						
						<div id="advertisea" class="body_div mt15">
							<img src="/images/truck.png" style="width:75%;margin-bottom:21px;padding-left:10px; margin-top: 30px;" />
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
