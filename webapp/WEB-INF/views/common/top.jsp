<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../include/css/top.css">


<script type="text/javascript">
	var defaultParams = {
		userno : "${session.userno}",
		userid : "${session.userid}",
		nickname : "${session.nickname}",
		email : "${session.email}",
		authid : "${session.authid}",
		authname : "${session.authname}"
	}
	$(document).ready(function() {
		var navbars;
		var url;
		if (defaultParams.authid == 1) {
			$("#admin_menu").show();
		}
	});
	function login() {
		var url = "/LogInOut/Login";
		var params = $("#login").serialization();
		$.post(url, params, function(data) {
			if (data == "Success") {
				$.cookie("saveid", params.userid, {
					expires : 7
				});
				location.reload();
			} else if (data == "NotFound") {
				alert("존재하지 않는 회원입니다.");
				$.cookie("saveid", '', {
					expires : -1
				});
				$("#userid").val('');
				$("#userid").focus();
				$("#passwd").val('');
			} else if (data == "Fail") {
				alert("비밀번호가 일치하지 않습니다.");
				$.cookie("saveid", '', {
					expires : -1
				});
				$("#passwd").val('');
				$("#passwd").focus();
			}
		}).error(function() {
			alert("로딩에 실패하였습니다. 잠시 후 다시 시도해 주시기 바랍니다.");
		});

	}
</script>

<div class="row top_nav">
	<div style="width: 100%; height: 140px;">
		<div align="center" class="logo" id="top_logo"
			style="width: 35%; height: 100%; margin-left: auto; margin-right: auto">
			<a id="logoSrc" href="/"><img style="height: 100%; width: 100%;"
				src="../images/common/LOGO.png" alt="logo" /></a>
		</div>
	</div>

<!--  conflict start here -->
<script type="text/javascript">
var defaultParams = {
		userno: "${session.userno}",
		userid: "${session.userid}",
		nickname: "${session.nickname}",
		email: "${session.email}",
		authid: "${session.authid}",
		authname: "${session.authname}"
	}
$(document).ready(function(){
	var navbars;
	var url;
	if(defaultParams.authid == 1){
		$("#admin_menu").show();
	}
});
function login(){
	var url = "/LogInOut/Login";
	var params = $("#login").serialization();
	$.post(url, params, function(data){
		if(data == "Success"){
			$.cookie("saveid", params.userid, {
				expires:7
			});
			location.reload();
		} else if(data == "NotFound"){
			alert("존재하지 않는 회원입니다.");
			$.cookie("saveid", '', {expires:-1});
			$("#userid").val('');
			$("#userid").focus();
			$("#passwd").val('');
		} else if(data == "Fail"){
			alert("비밀번호가 일치하지 않습니다.");
			$.cookie("saveid", '', {expires:-1});
			$("#passwd").val('');
			$("#passwd").focus();
		}
	}).error(function(){
		alert("로딩에 실패하였습니다. 잠시 후 다시 시도해 주시기 바랍니다.");
	});
	
}

</script>

<div class="row top_nav">
		<div style="width:100%; height:140px;">
			<div class="logo" id="top_logo" style="width:35%; height:100%; margin-left:auto; margin-right:auto">
				<a id="logoSrc" href="/"><img style="height:100%; width: 100%;"src="../images/common/LOGO.png" alt="logo" /></a>
			</div>
		</div>
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="/">Wisckey</a>
				</div>
				<div class="div_nav">
					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">ABOUT</a>
							<ul class="dropdown-menu">
								<li><a href="/About/introWisckey">위스키 소개</a></li>
								<li><a href="/About/introUniv">학교소개</a></li>
								<li><a href="/About/">공지사항</a></li>
								<li><a href="/About/otherSites">주요사이트 소개</a></li>
							</ul>
						</li>
					</ul>
					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">취업<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/Career/">취업공고</a></li>
								<li><a href="/Career/employBoard">취업 게시판</a></li>
							</ul></li>
					</ul>
					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">학업 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/School/pastWork">족보</a></li>
								<li><a href="/School/education">학업게시판</a></li>
							</ul></li>
					</ul>
					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">깨알팁<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/Tip/food">맛집</a></li>
								<li><a href="#">벼룩시장</a></li>
							</ul></li>
					</ul>
					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">동아리 게시판<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">동아리 정보</a></li>
								<li><a href="#">KUSA</a></li>
								<li><a href="#">KESA</a></li>
								<li><a href="#">KAFES</a></li>
								<li><a href="#">KBSA</a></li>
								<li><a href="#">ULSSU</a></li>
							</ul></li>
					</ul>
					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">자유게시판<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/Board/">게시판</a></li>
								<li><a href="#">신입생 게시판</a></li>
							</ul></li>
					</ul>
					<ul class="nav navbar-nav" style="display:none;" id="admin_menu">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">관리자<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">ABOUT 관리</a></li>
								<li><a href="#">게시판 관리</a></li>
								<li><a href="/Admin/ManageOrg">동아리 관리</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>


</div>
	<div class="navbar-wrapper">
    <div class="container-fluid">
        <nav class="navbar navbar">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="javascript:;">Logo</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="javascript:;" class="">Home</a></li>
                        <li class=" dropdown">
                            <a href="javascript:;" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Departments <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li class=" dropdown">
                                    <a href="javascript:;" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">View Departments</a>
                                </li>
                                <li><a href="javascript:;">Add New</a></li>
                            </ul>
                        </li>
                        <li><a href="javascript:;">Add New</a></li>
                        <li class=" dropdown"><a href="javascript:;" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Managers <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="javascript:;">View Managers</a></li>
                                <li><a href="javascript:;">Add New</a></li>
                            </ul>
                        </li>
                        <li class=" dropdown"><a href="javascript:;" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Staff <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="javascript:;">View Staff</a></li>
                                <li><a href="javascript:;">Add New</a></li>
                                <li><a href="javascript:;">Bulk Upload</a></li>
                            </ul>
                        </li>
                        <li class=" down"><a href="javascript:;" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">HR <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="javascript:;">Change Time Entry</a></li>
                                <li><a href="javascript:;">Report</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav pull-right">
                        <li class=" dropdown"><a href="javascript:;" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Signed in as  <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="javascript:;">Change Password</a></li>
                                <li><a href="javascript:;">My Profile</a></li>
                            </ul>
                        </li>
                        <li class=""><a href="javascript:;">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>

<!--  
<nav class="navbar navbar-default navbar-inverse" role="navigation">
	<div class="container-fluid">

		
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Wisckey</a>
		</div>
		
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">ABOUT<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/About/introWisckey">위스키 소개</a></li>
						<li><a href="/About/introUniv">학교소개</a></li>
						<li><a href="/About/">공지사항</a></li>
						<li><a href="/About/otherSites">주요사이트 소개</a></li>
					</ul></li>
			
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">취업<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/Career/">취업공고</a></li>
						<li><a href="/Career/employBoard">취업 게시판</a></li>
					</ul></li>
			
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">학업 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">족보</a></li>
						<li><a href="#">학업게시판</a></li>
					</ul></li>
			
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">깨알팁<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">맛집</a></li>
						<li><a href="#">벼룩시장</a></li>
					</ul></li>
			
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">동아리 게시판<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">동아리 정보</a></li>
						<li><a href="#">KUSA</a></li>
						<li><a href="#">KESA</a></li>
						<li><a href="#">KAFES</a></li>
						<li><a href="#">KBSA</a></li>
						<li><a href="#">ULSSU</a></li>
					</ul></li>
			
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">자유게시판<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/Board/">게시판</a></li>
						<li><a href="#">신입생 게시판</a></li>
					</ul></li>
			</ul>
			
			
			<ul class="nav navbar-nav navbar-right" style="display: none;" id="admin_menu">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">관리자<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">ABOUT 관리</a></li>
						<li><a href="#">게시판 관리</a></li>
						<li><a href="/Admin/ManageOrg">동아리 관리</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>
-->
