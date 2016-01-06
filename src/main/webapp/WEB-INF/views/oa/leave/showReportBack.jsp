<form id="modalform" class="form-horizontal" role="form" method="post">
	<input class="form-control" id="id" name="id" type="hidden" />
	<div class="form-group">
		<label class="col-lg-4 control-label">shenqingren:</label>
		<div class="col-lg-8">
			<input class="form-control" id="userId" name="userId" type="text" />
		</div>
	</div>
	<div class="form-group">
		<label class="col-lg-4 control-label">jiazhong:</label>
		<div class="col-lg-8">
			<input class="form-control" id="leaveType" name="leaveType"
				type="text" />
		</div>
	</div>
	<div class="form-group">
		<label class="col-lg-4 control-label">shenqingshijian:</label>
		<div class="col-lg-8">
			<input class="form-control" id="applyTime" name="applyTime"
				type="text" />
		</div>
	</div>
	<div class="form-group">
		<label class="col-lg-4 control-label">kaishishijian:</label>
		<div class="col-lg-8">
			<input class="form-control" id="startTime" name="startTime"
				type="text" />
		</div>
	</div>
	<div class="form-group">
		<label class="col-lg-4 control-label">jieshushijian:</label>
		<div class="col-lg-8">
			<input class="form-control" id="endTime" name="endTime" type="text" />
		</div>
	</div>
	<div class="form-group">
		<label class="col-lg-4 control-label">qingjiashiyou:</label>
		<div class="col-lg-8">
			<textarea class="form-control" rows="4" id="reason" name="reason"></textarea>
		</div>
	</div>

	<div class="form-group">
		<label for="startTime" class="col-lg-6 control-label">shijikaishishijian:</label>
		<div class="col-lg-6">
			<div class="input-group date form_datetime"
				data-date-format="yyyy-MM-dd HH:mm" data-link-field=realityStartTime>
				<input class="form-control" size="16" type="text"
					id="realityStartTime" name="realityStartTime" readonly> <span
					class="input-group-addon"><span
					class="glyphicon glyphicon-remove"></span></span> <span
					class="input-group-addon"><span
					class="glyphicon glyphicon-th"></span></span>
			</div>
			<br />
		</div>
	</div>
	<div class="form-group">
		<label for="endTime" class="col-lg-6 control-label">shijijieshushijian:</label>
		<div class="col-lg-6">
			<div class="input-group date form_datetime"
				data-date-format="yyyy-MM-dd HH:mm" data-link-field="realityEndTime">
				<input class="form-control" size="16" type="text"
					id="realityEndTime" name="realityEndTime" readonly> <span
					class="input-group-addon"><span
					class="glyphicon glyphicon-remove"></span></span> <span
					class="input-group-addon"><span
					class="glyphicon glyphicon-th"></span></span>
			</div>
			<br />
		</div>
	</div>
</form>