<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- start: Left Menu -->
<div class="fLeft" style="min-height:200px;">
	<div id="sidebar-left" class="fLeft" style="width:250px;">
		<div class="nav-collapse sidebar-nav">
			<ul class="nav nav-tabs nav-stacked main-menu">
				<li name="mainMenu">
					<a href="#">
						<span class="hidden-tablet"> 메인화면</span>
					</a>
				</li>
				<li name="mainMenu">
					<a class="dropmenu" href="a">
						<span class="hidden-tablet"> ABOUT</span><span class="icon-chevron-down fRight"></span>
					</a>
					<ul>
						<li>
							<a class="submenu" href="b">
								&nbsp;&nbsp;<span style="font-size:4px;" class="icon-chevron-right"></span><span class="hidden-tablet"><small>&nbsp; 학교소개</small></span>
							</a>
						</li>
						<li>
							<a class="submenu" href="c">
								&nbsp;&nbsp;<span style="font-size:4px;" class="icon-chevron-right"></span><span class="hidden-tablet"><small>&nbsp; 동아리소개</small></span>
							</a>
						</li>
						<li>
							<a class="submenu" href="d">
								&nbsp;&nbsp;<span style="font-size:4px;" class="icon-chevron-right"></span><span class="hidden-tablet"><small>&nbsp; 주요 사이트 소개</small></span>
							</a>
						</li>
					</ul>
				</li>
				<li class="mainMenu">
					<a class="dropmenu" href="#">
						<span class="hidden-tablet"> 정보슥희</span><span class="icon-chevron-down fRight"></span>
					</a>
					<ul>
						<li>
							<a class="submenu" href="#">
								&nbsp;&nbsp;<span style="font-size:4px;" class="icon-chevron-right"></span><span class="hidden-tablet"><small>&nbsp; 족보슥희</small></span>
							</a>
						</li>
						<li>
							<a class="submenu" href="#">
								&nbsp;&nbsp;<span style="font-size:4px;" class="icon-chevron-right"></span><span class="hidden-tablet"><small>&nbsp; 전공슥희</small></span>
							</a>
						</li>
						<li>
							<a class="submenu" href="#">
								&nbsp;&nbsp;<span style="font-size:4px;" class="icon-chevron-right"></span><span class="hidden-tablet"><small>&nbsp; 맛집슥희</small></span>
							</a>
						</li>
						<li>
							<a class="submenu" href="#">
								&nbsp;&nbsp;<span style="font-size:4px;" class="icon-chevron-right"></span><span class="hidden-tablet"><small>&nbsp; 깨알팁</small></span>
							</a>
						</li>
						<li>
							<a class="submenu" href="#">
								&nbsp;&nbsp;<span style="font-size:4px;" class="icon-chevron-right"></span><span class="hidden-tablet"><small>&nbsp; 공지사항</small></span>
							</a>
						</li>
						<li>
							<a class="submenu" href="#">
								&nbsp;&nbsp;<span style="font-size:4px;" class="icon-chevron-right"></span><span class="hidden-tablet"><small>&nbsp; 자유 게시판</small></span>
							</a>
						</li>
					</ul>
				</li>
				<li name="mainMenu">
					<a class="dropmenu" href="#">
						<span class="hidden-tablet">Q&A</span><span class="icon-chevron-down fRight"></span>
					</a>
					<ul>
						<li>
							<a class="submenu" href="#">
								&nbsp;&nbsp;<span style="font-size:4px;" class="icon-chevron-right"></span><span class="hidden-tablet"><small>&nbsp; Q&A</small></span>
							</a>
						</li>
						<li>
							<a class="submenu" href="#">
								&nbsp;&nbsp;<span style="font-size:4px;" class="icon-chevron-right"></span><span class="hidden-tablet"><small>&nbsp; 졸업생 Q&A</small></span>
							</a>
						</li>
						<li>
							<a class="submenu" href="#">
								&nbsp;&nbsp;<span style="font-size:4px;" class="icon-chevron-right"></span><span class="hidden-tablet"><small>&nbsp; 자유 Q&A</small></span>
							</a>
						</li>
						<li>
							<a class="submenu" href="#">
								&nbsp;&nbsp;<span style="font-size:4px;" class="icon-chevron-right"></span><span class="hidden-tablet"><small>&nbsp; 연애 Q&A</small></span>
							</a>
						</li>							
					</ul>
				</li>
				<li name="mainMenu">
					<a class="dropmenu" href="#">
						<span class="hidden-tablet"> 동아리방</span><span class="icon-chevron-down fRight"></span>
					</a>
					<ul>
						<li>
							<a class="submenu" href="#">
								&nbsp;&nbsp;<span style="font-size:4px;" class="icon-chevron-right"></span><span class="hidden-tablet"><small>&nbsp; 쿠사</small></span>
							</a>
						</li>
						<li>
							<a class="submenu" href="#">
								&nbsp;&nbsp;<span style="font-size:4px;" class="icon-chevron-right"></span><span class="hidden-tablet"><small>&nbsp; 케사</small></span>
							</a>
						</li>
						<li>
							<a class="submenu" href="#">
								&nbsp;&nbsp;<span style="font-size:4px;" class="icon-chevron-right"></span><span class="hidden-tablet"><small>&nbsp; 캅사</small></span>
							</a>
						</li>
						<li>
							<a class="submenu" href="#">
								&nbsp;&nbsp;<span style="font-size:4px;" class="icon-chevron-right"></span><span class="hidden-tablet"><small>&nbsp; 카페스</small></span>
							</a>
						</li>
						<li>
							<a class="submenu" href="#">
								&nbsp;&nbsp;<span style="font-size:4px;" class="icon-chevron-right"></span><span class="hidden-tablet"><small>&nbsp; 얼쑤</small></span>
							</a>
						</li>
					</ul>
				</li>
				<li name="userMenu">
					<span>일정</span><span class="icon-chevron-down fRight"></span>
				</li>
				<li name="userMenu">
					<span>회원정보</span><span class="icon-chevron-down fRight"></span>
				</li>
				<li name="adminMenu">
					<a class="dropmenu" href="#">
						<span class="hidden-tablet"> 관리자</span><span class="icon-chevron-down fRight"></span>
					</a>
					<ul>
						<li>
							<a class="submenu" href="#">
								&nbsp;&nbsp;<span style="font-size:4px;" class="icon-chevron-right"></span><span class="hidden-tablet"><small>&nbsp; 동아리관리</small></span>
							</a>
						</li>
						<li>
							<a class="submenu" href="#">
								&nbsp;&nbsp;<span style="font-size:4px;" class="icon-chevron-right"></span><span class="hidden-tablet"><small>&nbsp; 회원관리</small></span>
							</a>
						</li>
					</ul>
				</li>		
			</ul>
		</div>
	</div>
</div>
