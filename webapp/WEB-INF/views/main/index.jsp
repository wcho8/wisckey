<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript">
	$(document).ready(function() {
		var data = [{"test" : "hello", "id" : 3},{"test" : "hello", "id" : 1},{"test" : "hello1", "id" : 2}];
		$("div#calendar").fullCalendar({
			defaultView : "basicWeek",
			header : {
				left : "prev, next today",
				center : "title",
				right : ""
			},
			height : "300",
			editable : false,
			selectable : true,
			selectHelper : true
		});
		$("#myCarousel").hide();
		
		$("#objGrid").jqGrid({
			data: data,
			width: "300",
			datatype:"local",
			colNames:['test', 'id'],
			colModel:[
			          {name: 'test', index:'test', width:100},
			          {name: 'id', index: 'id', width: 100}
			          ],
			rowNum: 10,
			viewrecords : true,
			caption:"example"
		})
	});
</script>
<!-- s:container -->
<div class="container">
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="row">
		<!-- s:carousel -->
		<div class="carousel slide" id="myCarousel" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="/images/sample_carousel_3.jpg" alt="carousel3">
				</div>
				<div class="item">
					<img src="/images/sample_carousel_4.jpg" alt="carousel4">
				</div>
				<div class="item">
					<img src="/images/sample_carousel_5.jpg" alt="carousel5">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!-- e:carousel -->
		<!-- s:login -->
		<!-- e:login -->
	</div>
	<div class="row">
		<div class="indexCal" style="position:relative;">
			<div id="calheader" style="padding-bottom: 10px;">
				헤더
			</div>
			<div id="calendar">
			</div>
		</div>
		<table id="objGrid">
		</table>
	</div>
	
</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>

<!-- e:container -->