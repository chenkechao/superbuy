<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Calendar</title>
<%@include file="/common/meta.jsp"%>
<style>
body {
	padding-top: 0px;
}
</style>
<link rel="stylesheet" href="${ctx}/resources/calendar/css/calendar.css">
<script type="text/javascript"
	src="${ctx}/resources/calendar/components/underscore/underscore-min.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/calendar/components/jstimezonedetect/jstz.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/calendar/js/language/zh-CN.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/calendar/js/calendar.js"></script>
</head>
<body>
	<!-- Main bar -->
	<div class="mainbar">
		<!-- Page heading -->
		<div class="page-head">
			<h2 class="pull-left">
				<i class="icon-table"></i> Tables
			</h2>
			<!-- Breadcrumb -->
			<div class="bread-crumb pull-right">
				<a href="index.html"><i class="icon-home"></i> Home</a>
				<!-- Divider -->
				<span class="divider">/</span> <a href="#" class="bread-current">Dashboard</a>
			</div>
			<div class="clearfix"></div>
		</div>
		<!-- Page heading ends -->
		<!-- Matter -->
		<div class="matter">
			<div class="container">
				<!-- Table -->
				<div class="row">
					<div class="col-md-12">
						<div id="calendar"></div>
						<div class="modal fade" id="events-modal" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
										<h3 class="modal-title">Event</h3>
									</div>
									<div class="modal-body" style="height: 400px"></div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- con-md-12 ends -->
				</div>
				<!-- row ends -->
			</div>
			<!-- Container ends -->
		</div>
		<!-- Matter ends -->
	</div>
	<div style="background:blue;width:900px;height:300px" class="module-detail-slide"></div>
</body>
<script type="text/javascript" src="${ctx}/resources/calendar/js/app.js"></script>
<!-- 必须放在calendar.js后面 -->
</html>
