<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
});
</script>

<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="hr_dash" style="width:100%;"></div>
	<div class="row">
		<div class="main_body">
			<div id="msg" style="width:80%; font-size:30px; text-align:center; margin:auto;">
				로그인이 필요한 페이지입니다.
			</div>
			<div class="hr_dash" style="width:100%;clear:both;"></div>
			<div class="login_div" style="width:50%; margin-top:15px;margin-left:auto;margin-right:auto;border:1px solid #cacaca;">
				<img src="/images/LOGO1.png" style="width:100%;"/>
				<div id="login_box" style="width:70%;float:left;clear:both;">
					<table id="login">
						<tr>
							<td><input type="text" placeholder="아이디" style="margin-bottom: 5px; width:95%;" id="userid"></td>
						</tr>
						<tr>
							<td><input type="password" placeholder="패스워드" style="width:95%;" id="passwd"></td>
						</tr>
					</table>
				</div>
				<div style="float:left; width:25%;" id="login_button">
					<button type="button" class="btn btn-warning" style="height:50px;" onClick="javascript:login()">로그인</button>
				</div>
				<div style="margin-top:10px; float:left;" id="login_function">
					<a href="#">아이디/비밀번호 찾기</a> | <a href="/Member/">회원가입</a>
				</div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
	</div>
</div>
<!-- e:container -->