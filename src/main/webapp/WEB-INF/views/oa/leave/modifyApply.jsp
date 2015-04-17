<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">x</button>
		<h4 class="modal-title">Modal title</h4>
	</div>
	<div class="modal-body">
		<div class="alert alert-warning" id="backReason">
			
		</div>
		<ul id="myTab" class="nav nav-tabs">
			<li class="active"><a id="modify" href="#modify" data-toggle="tab" value="true">tiaozhengshenqing</a></li>
			<li><a id="cancel" href="#cancel" data-toggle="tab" value="false">Profile</a></li>
		</ul>
		<div id="myTabContent" class="tab-content" style="padding-bottom: 2px;margin-top:20px">
			<div class="tab-pane fade in active" id="modify">
				<form class="form-horizontal" role="form" action="">
					<div class="form-group">
						<label class="col-lg-4 control-label">qingjialeixin:</label>
							<div class="col-lg-8">
								<select class="form-control" id="leaveType" name="leaveType">
								    <option>gongxiu</option>
		                            <option>bingjia</option>
		                            <option>tiaoxiu</option>
		                            <option>shijia</option>
		                             <option>hunjia</option>
								</select>
							</div>
					</div>
					<div class="form-group">
						<label class="col-lg-4 control-label">kaishishijian:</label>
						<div class="col-lg-8">
							<input type="text" class="form-control" id="startTime" name="startTime"/>
					    </div>
					</div>
					<div class="form-group">
						<label class="col-lg-4 control-label">jieshushijian:</label>
						<div class="col-lg-8">
							<input type="text" class="form-control" id="endTime" name="endTime" />
						</div>
					</div>	
					<div class="form-group">
						<label class="col-lg-4 control-label">qingjiayuanyin:</label>
						<div class="col-lg-8">
							<textarea class="form-control" rows="4" id="reason" name="reason"></textarea>
						</div>
					</div>
				</form>
			</div>
			<div class="tab-pane fade" id="cancel">
				<h1>dd</h1>
			</div>
		</div>
	</div>
	<div class="modal-footer handle-footer"></div>
</body>
</html>