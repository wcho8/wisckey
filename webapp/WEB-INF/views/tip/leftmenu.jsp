<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
$(document).ready(function(){
	var ptypeid = "${paramVO.ptypeid}";
	$(".current").removeClass('current');
	console.log(ptypeid);
	switch(ptypeid){
	case "6":
		$("#left_food").addClass('current');
		break;
	case "7":
		$("#left_market").addClass('current');
		break;
	case "9":
		$("#left_tips").addClass('current');
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

<!-- leftmenu -->
<div class="left_menu" style="float:left; width:130px; padding-top: 7px; margin-left: 40px;">
	<div id="l_first_title" style="font-weight: bold; border-right: 2px solid #910019; ">
		<div style="font-weight: bold; padding-left:5px; font-size: 110%; ">깨알팁 <br/></div>
		<div style="clear:both;"></div>
		<ul id="title_list" style="list-style: none; padding-top:5px; padding-left: 10px; text-decoration: none;">
			<li><a id="left_food" class="current" href="/Tip/tips?ptypeid=6">맛집</a></li>
			<li><a id="left_market" href="/Tip/tips?ptypeid=7">벼룩시장</a></li>
			<li><a id="left_tips" href="/Tip/tips?ptypeid=9">생활팁</a></li>
		</ul>
	</div>
</div>