<div class="alert alert-warning" id="backReason"></div>
<ul id="myTab" class="nav nav-tabs">
	<li class="active"><a href="#modify" data-toggle="tab"
		value="true">tiaozhengshenqing</a></li>
	<li><a href="#cancel" data-toggle="tab" value="false">Profile</a></li>
</ul>
<div id="myTabContent" class="tab-content"
	style="padding-bottom: 2px; margin-top: 20px">
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
				<label for="startTime" class="col-lg-4 control-label">kaishishijian:</label>
				<div class="col-lg-8">
					<div class="input-group date form_datetime"
						data-date-format="yyyy-MM-dd HH:mm" data-link-field="startTime">
						<input class="form-control" size="16" type="text" id="startTime"
							name="startTime" readonly> <span
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
				<div class="col-lg-8">
					<div class="input-group date form_datetime"
						data-date-format="yyyy-MM-dd HH:mm" data-link-field="endTime">
						<input class="form-control" size="16" type="text" id="endTime"
							name="endTime" readonly> <span class="input-group-addon"><span
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
					<textarea class="form-control" rows="4" id="reason" name="reason"></textarea>
				</div>
			</div>
		</form>
	</div>
	<div class="tab-pane fade" id="cancel">
		<h1>dd</h1>
	</div>
</div>
