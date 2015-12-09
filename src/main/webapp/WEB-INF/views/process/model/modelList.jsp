<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>modelList</title>
<%@include file="/common/meta.jsp"%>
<style>
body {
	padding-top: 0px;
}
</style>
<script type="text/javascript">
	var $table = $('#table'), $remove = $('#re_send_selected');
	$(function() {
		$table.bootstrapTable('refresh');
		$(".handle").on("click", handle);
	});
	
	function rowStyle(row, index) {
		var classes = [ 'active', 'success', 'info', 'warning', 'danger' ];
		return {};
	}
	
	function queryParams() {
		return {
			type : 'owner',
			sort : 'updated',
			direction : 'desc',
			per_page : 100,
			page : 1
		};
	}
	
	function actionFormatter(value, row, index) {
		return [ '<a href="#" class="edit" target="_blank">编辑</a><br/>'
				+ '<a href="#" class="deploy">部署</a>'
				+ '<a href="#" class="export">导出</a>'
				+ '<a href="#" class="delete">删除</a>' ]
				.join('');
	}
	
	window.actionEvents = {
		'click .delete' : function(e, value, row, index) {
			deleteProcessDefinition(row.id, row.deploymentId);
		},
		'click .convert' : function(e, value, row, index) {
			convertToModel(row.id);
		},
		'click .handle' : function(e, value, row, index) {
			var object = this;
			$.ajax({
				url : "${ctx }/form/formkey/hasStartForm/" + row.id,
				cache : false,
				success : function(data) {
					if (data == 'true') {
						handle.call(object);
					} else if (data == "success") {
						alert("启动成功");
					} else {
						alert("启动失败");
					}
				},
				error : function() {
					alert("error");
				}
			});
		}
	};

	var handleOpts = {
		createmodel : {
			width : 300,
			height : 300,
			url : "${ctx }/process/model/showCreateModelForm",
			open : function(url) {
				//TODO 怎么实现在load的时候执行load页面的js函数，达到load页面只包含html相关代码 
				$(".modal-body", parent.window.$(parent.document)).load(url);
			},
			savebtn : [
					{
						text : 'chuangjian',
						css : 'btn btn-primary',
						click : function() {
							var modal = parent.window.$(parent.document);
							$('#createModelForm', modal).submit();
						}
					},
					{
						text : 'quxiao',
						css : 'btn btn-default',
						click : function() {
							$("#myModal", parent.window.$(parent.document))
									.modal("hide");
						}
					} ]
		}
	};
</script>
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
						<div id="toolbar">
							<button tkey="createmodel" type="button"
								class="btn btn-primary handle">chuangjian</button>
							<button type="button" class="btn btn-default">Primary</button>
							<button type="button" class="btn btn-success">Success</button>
							<button type="button" class="btn btn-info">Info</button>
							<button type="button" class="btn btn-warning">Warning</button>
							<button type="button" class="btn btn-danger">Danger</button>
						</div>
						<table class="table table-striped table-bordered table-hover"
							id="table" data-toggle="table"
							data-url="${ctx }/process/model/list/json"
							data-row-style="rowStyle" 
							data-query-params="queryParams"
							data-cache="false" 
							data-click-to-select="true"
							data-toolbar="#toolbar"
							data-pagination="true" 
							data-search="true" 
							data-height="600">
							<thead>
								<tr>
									<th data-field="state" data-checkbox="true"></th>
									<th data-field="id">ID</th>
									<th data-field="key">KEY</th>
									<th data-field="name">名称</th>
									<th data-field="version">版本</th>
									<th data-field="createTime">创建时间</th>
									<th data-field="lastUpdateTime">最后更新时间</th>
									<th data-field="metaInfo">元数据</th>
									<th data-field="action" data-formatter="actionFormatter"
										data-events="actionEvents">操作</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- con-md-12 ends -->
				</div>
				<!-- row ends -->
			</div>
			<!-- Container ends -->
		</div>
		<!-- Matter ends -->
	</div>
</body>
</html>