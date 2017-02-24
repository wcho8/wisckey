<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
	$(document).ready(function() {
		$("div#calendar").fullCalendar({
			defaultView : "month",
			header : {
				left : "prev, next today",
				center : "title",
				right : ""
			},
			height : "500px",
			editable : false,
			selectable : true,
			selectHelper : true
		});
	});
</script>
<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="row">
		<jsp:include page="../common/leftMenu.jsp" flush="false"></jsp:include>
		<div class="fLeft" id="main_content">
			<div class="box_content">
				<div id="orgs_board"></div>
				<div id="calendar" style="width: 500px;"></div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<%-- <jsp:include page="../common/footer.jsp" flush="false"></jsp:include> --%>
<!-- e:container -->