<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>

<script type="text/javascript">
$(document).ready(function(){
	Kakao.init('fa5ffdcf54450462647682c007192f99');
	function getKakaotalkUserProfile(){
		Kakao.API.request({
			url: '/v1/user/me',
			success: function(res) {
				console.log(res.properties);
				$("#kakao-profile").append(res.properties.nickname);
				$("#kakao-profile").append($("<img/>",{"src":res.properties.profile_image,"alt":res.properties.nickname+"님의 프로필 사진"}));
			},
			fail: function(error) {
				console.log(error);
			}
		});
	}
	function createKakaotalkLogin(){
		$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
		var loginBtn = $("<a/>",{"class":"kakao-login-btn","text":"로그인"});
		loginBtn.click(function(){
			Kakao.Auth.login({
				persistAccessToken: true,
				persistRefreshToken: true,
				success: function(authObj) {
					getKakaotalkUserProfile();
					createKakaotalkLogout();
				},
				fail: function(err) {
					console.log(err);
				}
			});
		});
		$("#kakao-logged-group").prepend(loginBtn)
	}
	function createKakaotalkLogout(){
		$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
		var logoutBtn = $("<a/>",{"class":"kakao-logout-btn","text":"로그아웃"});
		logoutBtn.click(function(){
			Kakao.Auth.logout();
			createKakaotalkLogin();
			$("#kakao-profile").text("");
		});
		$("#kakao-logged-group").prepend(logoutBtn);
	}
	/* if(Kakao.Auth.getRefreshToken()!=undefined&&Kakao.Auth.getRefreshToken().replace(/ /gi,"")!=""){
		createKakaotalkLogout();
		getKakaotalkUserProfile();
	}else{
	} */
	createKakaotalkLogin();
});
</script>
<body>
<a id="kakao-link-btn" href="javascript:;">
<img src="//dev.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
</a>

<div id="kakao-logged-group"></div>
	<div id="kakao-profile"></div>
</body>
</html>