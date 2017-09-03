<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	
});

</script>
<style type="text/css">
</style>
<div class="dialog" style="padding:10px;">
	<div id="dialog_header" style="width:100%; display:inline-table;">
		<div id="org_image" style="width:20%; float:left;">
			<img id='org_img' src="data:image/jpg;base64," style="width:100%;padding:10px;" />
		</div>
		<div id="org_infos" style="float:left; width:80%;padding:10px 0px;font-size:12px;">
			<div id="org_info" style='float:left; width:30%; padding-left:10px;'>
				<b>정보</b>                                      
				<ul class="no_li" style='padding:0px;'>                      
					<li> <b>이름:</b> <span id="orgname"></span></li> 
					<li> <b>회장:</b> <span id="prname"></span></li>  
					<li> <b>부회장:</b> <span id="vprname1"></span>, <span id="vprname2"></span></li>     
				</ul>                                          
			</div>
			<div id="org_comment" style='min-height:80px; padding-right:20px'>
				<b>한줄 소개</b><br/>
				<i><span id="comment"></span></i>
			</div>
		</div>
	</div>
	<div id="org_details" style="width:100%; border-top:2px solid #cacaca; min-height:300px;margin-top:10px;padding:15px;">
	</div>
	<div style="width:100%;">
	</div>
</div>
