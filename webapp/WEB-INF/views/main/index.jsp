<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
	
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
					<img src="../images/common/wisckey_1.png" style="height:150px;">		
					<table id="login">
						<colgroup>
							<col style="width: 80px;">
							<col style="width: *;">
							<col style="width: 50px;">
						</colgroup>
						<tr>
							<th>ID : </th>
							<td><input type="text" style="margin-bottom: 5px; width:95%;"></td>
							<td rowspan="2" style="padding-left:3px;">
							<button type="button" class="btn btn-warning" style="height:50px;">로그인</button>
							</td>
						</tr>
						<tr>
							<th>Password : </th>
							<td><input type="password" style="width:95%;"></td>
						</tr>
						<tr style="margin-top: 20px;">
							<td colspan="3"><a href="#">아이디/비밀번호 찾기</a> | <a href="#">회원가입</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="body_mid">
				
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>

<!-- e:container -->