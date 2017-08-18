<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
$(document).ready(function(){
	var ptypeid = "${paramVO.ptypeid}";
	$(".current").removeClass('current');
	switch(ptypeid){
	case "1":
		$("#left_board").addClass('current');
		break;
	case "2":
		$("#left_newbie").addClass('current');
		break;
	}
});
</script>
<style type="text/css">
#title_list_about li>a:hover {
	text-decoration: none;
	font-size: 105%;
	font-weight: bold;
	opacity: 1;
	color: black;
}
.current{
	font-size: 110%;
	font-weight: bold;
	opacity:1;
	color: black;
}
#title_list_about li>a {
	opacity: 0.7;
	text-decoration: none;
	
}
#title_list_about>li{
	list-style-type: disc; 
	list-style-position: inside;	
}
</style>
<div id="left_menu" style="float: left; width: 130px;  padding-top: 7px; margin-left: 40px;"> <!-- -20px -->
	<div id="l_first_title" style="font-weight: bold; border-right: 2px solid #910019; ">
		<div style="font-weight: bold; padding-left:5px; font-size: 110%; ">자유게시판 <br/></div>
		<div style="clear:both;"></div>
		<ul id="title_list_about" style="list-style: none; padding-left: 10px; text-decoration: none; padding-top: 5px;">
			<li><a class="current" id="left_board" href="/Board/?ptypeid=1">자유게시판</a></li>
			<li><a id="left_newbie" href="/Board/?ptypeid=2">신입생 게시판</a></li>
		</ul>
	</div>
</div>
