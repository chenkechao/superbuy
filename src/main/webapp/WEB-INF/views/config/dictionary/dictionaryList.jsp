<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>配置管理</title>
<%@include file="/common/meta.jsp"%>
<style>
body {
	padding-top: 0px;
}
</style>
<script type="text/javascript">
	function actionFormatter(value, row, index) {
		return [ '<a href="#" class="btn btn-info delete" title="删除">删除</a>'
				+ '<a href="#" class="btn btn-info view" title="查看">查看</a>' ]
				.join('');
	}
	
	window.actionEvents = {
		'click .delete' : function(e, value, row, index) {
			deleteDictionary(row.id);
		},
		'click .view' : function(e, value, row, index) {
			viewDictionary(row.id);
		}
	};

	function deleteDictionary(dictionaryId) {
		$.ajax({
			url : "${ctx}/config/dictionary/delete/" + dictionaryId,
			cache : false,
			success : function(data) {
				location.reload();
			},
			error : function() {
				alert("error");
			}
		});
	}

	function createDictionary() {
		$('#mainIframe', $(parent.document)).attr("src",
				'${ctx }/config/dictionary/dictionaryForm');
	}
	
	function viewDictionary(dictionaryId){
		$('#mainIframe', $(parent.document)).attr("src",
				'${ctx}/config/dictionary/view/'+dictionaryId);
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
						<div id="toolbar" style="margin-bottom: -40px">
							<button id="createDictionary" type="button"
								class="btn btn-primary" onClick="createDictionary()">新建</button>
						</div>
						<table class="table table-striped table-bordered table-hover"
							id="table" data-toggle="table" data-toolbar="#toolbar"
							data-url="${ctx }/config/dictionary/list/json" data-cache="false"
							data-click-to-select="true" data-row-style="rowStyle"
							data-query-params="queryParams" data-pagination="true"
							data-search="true" data-height="600">
							<thead>

								<tr>
									<th data-field="state" data-checkbox="true"></th>
									<th data-field="id">ID</th>
									<th data-field="name">名称</th>
									<th data-field="cnName">中文名称</th>
									<th data-field="description">描述</th>
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
