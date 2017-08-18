<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
});
</script>
<style type="text/css">
#login_box{
	background: url("../images/lock.png");
	background-repeat: no-repeat;
	background-size: cover;
	opacity: 1;
}

#login_function>a:hover{
	text-decoration:none;
	text-size: 105%;
	color: white;
}
#login_function>a{
	color:white;
	font-weight:bold;
}
</style>

<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width:100%;"></div>
	<div class="row">
		<div class="main_body">
			<div class="login_div" style="width:50%; margin-top:15px; margin-left:auto; margin-right:auto;">
				<div id="login_box" style="width:100%; height: 500px; float:left; clear:both;">
					<div id="login" style="text-align: center; padding-top:45%; height:80%; ">
						<input type="text" placeholder="아이디" style="margin-bottom: 5px; width:50%; height: 35px; margin:3 auto;" id="userid">
						<input type="password" placeholder="패스워드" style="width:50%; height:35px;  margin:3 auto;" id="passwd">
						<div style="float:left; width:100%; text-align: center; margin-top:30px;" id="login_button">
							<button type="button" class="btn btn-warning" style="border: 0;background: #910019; width: 50%;height:50px;" onClick="javascript:login()">
								<span style="letter-spacing: 10px; font-weight: bold;">LOGIN</span>
							</button>
						</div>
						<div style="width: 80%; margin-left:60px; margin-top:30px; float:left; text-align:center;b" id="login_function">
							 <a href="/Member/" style="width: 30%; ">회원가입</a>  <a href="#" style="width:30%; margin-left: 100px;">아이디/비밀번호 찾기</a>
						</div>
					</div>
				</div>
				<div style="text-align: center; font-weight:bold; font-size:30px; padding-top: 20px;">
					<span>"자물쇠를 풀어 주세요"</br></span>
					<span>UNLOCK ME!</span>
				</div>
			</div>
		</div>
		<div style="clear:both;"></div>
		<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
	</div>
</div>
<!-- e:container -->