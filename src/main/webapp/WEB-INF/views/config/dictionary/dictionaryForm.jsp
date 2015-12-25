<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>数据字典管理</title>
<%@include file="/common/meta.jsp"%>
<style>
body {
	padding-top: 0px;
}
</style>
<script type="text/javascript">
//TODO 新建dictionary时 添加动态表格需要调整
	$(function() {
		$('.no-records-found').remove();
		var id = ${index + 1};
		getRowItem = function() {
			var rowItem = [];
			rowItem.push({
				orderby : "<input id='orderby_"+id+"' type='text' class='form-control' name='orderbys'>",
				code : "<input id='code_"+id+"' type='text' class='form-control' name='codes' >",
				name : "<input id='itemName_"+id+"' type='text' class='form-control' name='itemNames' >"
			});
			id++;
			return rowItem;
		},
		// init table use data
		$table = $('#table-methods-table').bootstrapTable({
			data : getRowItem()
		});

		$('#append-data').click(function() {
			$table.bootstrapTable($(this).data('method'), getRowItem());
		});
	});

	function actionFormatter(value, row, index) {
		return [ '<a class="save" href="#" title="保存">保存</a>' ].join('');
	}

	window.actionEvents = {
		'click .save' : function(e, value, row, index) {
			alert(row);
		}
	};
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
						<div class="padd">
							<!-- Form starts.  -->
							<form id="dictionary" class="form-horizontal" role="form"
								action="${ctx }/config/dictionary/update" method="post">

								<div class="form-group">
									<label for="name" class="col-sm-4 control-label">配置名称：</label>
									<div class="col-sm-8">
										<input class="form-control" type="text" value="" id="name"
											name="name">
									</div>
								</div>

								<div class="form-group">
									<label for="cnName" class="col-sm-4 control-label">显示名称：</label>
									<div class="col-sm-8">
										<input class="form-control" type="text" value="" id="cnName"
											name="cnName">
									</div>
								</div>

								<div class="form-group">
									<label for="description" class="col-sm-4 control-label">配置描述：</label>
									<div class="col-sm-8">
										<textarea class="form-control" rows="3" id="description"
											name="description"></textarea>
									</div>
								</div>

								<div class="form-group">
									<label for="email" class="col-sm-4 control-label">添加选项：</label>
									<div class="col-sm-8">
										<button id="append-data" type="button" class="btn btn-default"
											data-method="append">添加选项</button>
									</div>
								</div>

								<hr />
								<div class="form-group">
									<label for="email" class="col-md-4 control-label">选项列表：</label>
									<div class="col-md-8">
										<table class="table table-striped table-bordered table-hover"
											id="table-methods-table" data-toggle="table"
											data-height="200" data-responseHandler="handle">
											<thead>
												<tr>
													<th data-field="state" data-checkbox="true"></th>
													<th data-field="orderby">序号</th>
													<th data-field="code">编号</th>
													<th data-field="name">名称</th>
													<th data-field="action" data-formatter="actionFormatter"
														data-events="actionEvents">操作</th>
												</tr>
											</thead>
										</table>
									</div>
								</div>

								<hr />
								<div class="form-group">
									<div class="col-lg-offset-4 col-md-4">
										<input type="submit" value="保存" class="btn btn-primary">
										<input type="submit" value="取消" class="btn btn-primary">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
