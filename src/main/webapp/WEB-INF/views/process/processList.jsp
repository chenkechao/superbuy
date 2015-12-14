<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>流程列表</title>
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
		return [ '<a href="#" class="delete">删除</a><br/>'
				+ '<a href="#" class="convert">转换为Model</a>'
				+ '<a href="#" tkey="startup" tid="'+row.id+'" class="handle">启动</a>' ]
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
			//TODO 启动流程还有问题
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
		deploy : {
			width : 300,
			height : 300,
			url : "${ctx }/process/showUploadModal",
			open : function(url) {
				$(".modal-body", parent.window.$(parent.document)).load(url);
			},
			savebtn : []
		},
		startup : {
			width : 300,
			height : 300,
			url : "${ctx }/form/formkey/showStartForm/",
			open : function(url, processDefinitionId) {
				$(".modal-body", parent.window.$(parent.document)).load(
						url + processDefinitionId);
			},
			savebtn : [ {
				text : 'qidongliucheng',
				css : 'btn btn-primary',
				click : function() {
					//$(".form-horizontal",parent.window.$(parent.document)).submit();
				}
			}, {
				text : 'quxiao',
				css : 'btn btn-default',
				click : function() {
					$("#myModal", modal).modal("hide");
				}
			} ]
		}
	}

	function deleteProcessDefinition(processDefinitionId, deploymentId) {
		$.ajax({
			url : "${ctx }/process/deleteProcessDefinition/"
					+ deploymentId,
			cache : false,
			success : function() {
				location.reload();
			},
			 //TODO 回调
			error : function() {
				alert("error");
			}
		});
	}

	function convertToModel(processDefinitionId) {
		$.ajax({
			url : "${ctx }/process/convertToModel/"
					+ processDefinitionId,
			success : function() {
				alert("success");
			},
			error : function() {
				alert("error1f");
			}
		});
	}
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
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									Action <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#" onClick="processDefinitionList('all')">All</a></li>
									<li><a href="#"
										onClick="processDefinitionList('dynamicForm')">DynamicForm</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="#">Separated link</a></li>
								</ul>
							</div>
							<button type="button" class="btn btn-default handle"
								tkey="deploy">deploy</button>
						</div>
						<table class="table table-striped table-bordered table-hover"
							id="table" data-toggle="table"
							data-url="${ctx }/process/processList/all/list/json"
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
									<th data-field="id">ProcessDefinitionId</th>
									<th data-field="deploymentId">DeploymentId</th>
									<th data-field="name">名称</th>
									<th data-field="key">KEY</th>
									<th data-field="version">版本号</th>
									<th data-field="id">XML</th>
									<th data-field="id">图片</th>
									<th data-field="deploymentTime">部署时间</th>
									<th data-field="suspended">是否挂起</th>
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