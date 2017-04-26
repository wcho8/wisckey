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
					<table id="login">
						<colgroup>
							<col style="width: 100px;">
							<col style="width: *;">
							<col style="width: 50px;">
						</colgroup>
						<tr>
							<td colspan="2">아이디</td>
							<td rowspan="4">로그인</td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" style="margin-bottom: 5px; width:95%;"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
						</tr>
						<tr>
							<td colspan="2"><input type="password" style="width:95%;"></td>
						</tr>
						<tr style="margin-top: 10px;">
							<td colspan="3"><a href="#">아이디/비밀번호 찾기</a> | <a href="#">회원가입</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="body_bot">
				<div class="fLeft" id="bot_left">
					<table id="top_post">
						<tbody>
							<tr style="border: 0px; height:34px;">
								<th style="border:0px;">
									top 10 게시물
								</th>
								<td style="float:right; border:0px;">더보기</td>
							</tr>
							<tr>
								<th>1</th>
								<td>test</td>
							</tr>
							<tr>
								<th>2</th>
								<td>test</td>
							</tr>
							<tr>
								<th>3</th>
								<td>test</td>
							</tr>
							<tr>
								<th>4</th>
								<td>test</td>
							</tr>
							<tr>
								<th>5</th>
								<td>test</td>
							</tr>
							<tr>
								<th>6</th>
								<td>test</td>
							</tr>
							<tr>
								<th>7</th>
								<td>test</td>
							</tr>
							<tr>
								<th>8</th>
								<td>test</td>
							</tr>
							<tr>
								<th>9</th>
								<td>test</td>
							</tr>
							<tr>
								<th>10</th>
								<td>test</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="fLeft" id="bot_mid">
					<table id="mid_table">
						<colgroup>
							<col style="width:30%;">
							<col style="width*;">
						</colgroup>
						<tbody>
							<tr style="height:34px;">
								<th style="border:0px;">정보 게시판</th>
								<td style="float:right; border:0px;">더보기</td>
							</tr>
							<tr>
								<th rowspan="6">취업정보</th>
							</tr>
							<tr><td>test</td></tr>
							<tr><td>test</td></tr>
							<tr><td>test</td></tr>
							<tr><td>test</td></tr>
							<tr><td>test</td></tr>
							<tr>
								<td rowspan="6">족보정보</td>
							</tr>
							<tr><td>test</td></tr>
							<tr><td>test</td></tr>
							<tr><td>test</td></tr>
							<tr><td>test</td></tr>
							<tr><td>test</td></tr>
							<tr>
								<td rowspan="6">벼룩시장</td>
							</tr>
							<tr><td>test</td></tr>
							<tr><td>test</td></tr>
							<tr><td>test</td></tr>
							<tr><td>test</td></tr>
							<tr><td>test</td></tr>
						</tbody>
					</table>
				</div>
				<div class="fLeft" id="bot_right">
					<table id="new_face" style="height:calc(100% - 3px);">
						<tr>
							<th style="border:0px; height:34px;">신입생 게시판</th>
							<td style="float:right; border:0px;">더보기</td>
						</tr>
						<tr><th>1</th><td>test</td></tr>
						<tr><th>2</th><td>test</td></tr>
						<tr><th>3</th><td>test</td></tr>
						<tr><th>4</th><td>test</td></tr>
						<tr><th>5</th><td>test</td></tr>
						<tr><th>6</th><td>test</td></tr>
						<tr><th>7</th><td>test</td></tr>
						<tr><th>8</th><td>test</td></tr>
						<tr><th>9</th><td>test</td></tr>
						<tr><th>10</th><td>test</td></tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>

<!-- e:container -->