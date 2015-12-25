<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>用户管理</title>
<%@include file="/common/meta.jsp"%>
<style>
body {
	padding-top: 0px;
}
</style>
<script type="text/javascript">
	function actionFormatter(value, row, index) {
		return [ '<a href="#" class="btn btn-info delete" title="删除">删除</a>'
				+ '<a href="${ctx}/security/user/update/'+row.id+'" class="btnEdit" title="编辑">编辑</a>'
				+ '<a href="#" class="btn btn-info view" title="查看">查看</a>' ]
				.join('');
	}

	window.actionEvents = {
		'click .delete' : function(e, value, row, index) {
			deleteUser(row.id);
		},
		'click .view' : function(e, value, row, index) {
			viewUser(row.id);
		}
	};

	function createUser() {
		$('#mainIframe', $(parent.document)).attr("src",
				'${ctx }/security/user/create');
	}

	function viewUser(userId) {
		$('#mainIframe', $(parent.document)).attr("src",
				"${ctx}/security/user/view/" + userId);
	}

	function deleteUser(userId) {
		$.ajax({
			url : "${ctx}/security/user/delete/" + userId,
			cache : false,
			success : function(data) {
				location.reload();
			},
			error : function() {
				alert("error");
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
						<div id="toolbar" class="fixed-table-toolbar"
							style="margin-bottom: -40px">
							<button id="createUser" type="button" class="btn btn-primary"
								onClick="createUser()">新建</button>
							<button type="button" class="btn btn-default">Primary</button>
							<button type="button" class="btn btn-success">Success</button>
							<button type="button" class="btn btn-info">Info</button>
							<button type="button" class="btn btn-warning">Warning</button>
							<button type="button" class="btn btn-danger">Danger</button>
						</div>
						<table class="table table-striped table-bordered table-hover"
							id="table" data-toggle="table"
							data-url="${ctx }/security/user/list/json"
							data-click-to-select="true" data-row-style="rowStyle"
							data-query-params="queryParams" data-pagination="true"
							data-search="true" data-height="600">
							<thead>
								<tr>
									<th data-field="state" data-checkbox="true"></th>
									<th data-field="username">账号</th>
									<th data-field="fullname">姓名</th>
									<th data-field="enabled">是否可用</th>
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
