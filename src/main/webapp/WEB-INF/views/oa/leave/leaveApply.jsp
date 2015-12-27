<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>leaveApply</title>
<%@include file="/common/meta.jsp"%>
<style>
body {
	padding-top: 0px;
}
</style>

<script type="text/javascript">
	$(function() {
		$('.form_datetime').datetimepicker({
			//language:  'fr',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			forceParse : 0,
			showMeridian : 1
		});
	});
</script>
</head>

<body>
	<!-- Main bar -->
	<div class="mainbar">
		<!-- Page heading -->
		<div class="page-head">
			<!-- Page heading -->
			<h2 class="pull-left">
				Forms
				<!-- page meta -->
				<span class="page-meta">Something Goes Here</span>
			</h2>
			<!-- Breadcrumb -->
			<div class="bread-crumb pull-right">
				<a href="index.html"><i class="icon-home"></i> Home</a>
				<!-- Divider -->
				<span class="divider">/</span> <a href="#" class="bread-current">Forms</a>
			</div>
			<div class="clearfix"></div>
		</div>
		<!-- Page heading ends -->
		<!-- Matter -->
		<div class="matter">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<!-- Form starts.  -->
						<form id="leave" class="form-horizontal" role="form"
							action="${ctx }/oa/leave/start" method="post">
							<div class="form-group">
								<label for="startTime" class="col-lg-4 control-label">kaishishijian:</label>
								<div class="col-lg-4">
									<div class="input-group date form_datetime"
										data-date-format="yyyy-MM-dd HH:mm"
										data-link-field="startTime">
										<input class="form-control" size="16" type="text" value=""
											id="startTime" name="startTime" readonly> <span
											class="input-group-addon"><span
											class="glyphicon glyphicon-remove"></span></span> <span
											class="input-group-addon"><span
											class="glyphicon glyphicon-th"></span></span>
									</div>
									<br />
								</div>
							</div>
							<div class="form-group">
								<label for="endTime" class="col-lg-4 control-label">jieshushijian:</label>
								<div class="col-lg-4">
									<div class="input-group date form_datetime"
										data-date-format="yyyy-MM-dd HH:mm" data-link-field="endTime">
										<input class="form-control" size="16" type="text" value=""
											id="endTime" name="endTime" readonly> <span
											class="input-group-addon"><span
											class="glyphicon glyphicon-remove"></span></span> <span
											class="input-group-addon"><span
											class="glyphicon glyphicon-th"></span></span>
									</div>
									<br />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-4 control-label">qingjiayuanyin:</label>
								<div class="col-lg-8">
									<textarea class="form-control" rows="5" id="reason"
										name="reason"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-4 control-label">qingjialeixin</label>
								<div class="col-lg-8">
									<select class="form-control" id="leaveType" name="leaveType">
										<option>gongxiu</option>
										<option>binjia</option>
										<option>tiaoxiu</option>
										<option>shijia</option>
										<option>hunjia</option>
									</select>
								</div>
							</div>
							<hr />
							<div class="form-group">
								<div class="col-lg-offset-1 col-lg-9">
									<input type="submit" name="shenqing" class="btn btn-primary">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>