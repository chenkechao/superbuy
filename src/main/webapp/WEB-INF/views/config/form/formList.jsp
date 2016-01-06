<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>listForm</title>
<%@include file="/common/meta.jsp"%>
<style>
body {
	padding-top: 0px;
}
</style>
<script type="text/javascript">
	function actionFormatter(value, row, index) {
		return [ '<a href="#" class="btn btn-info delete">删除</a>'
				+ '<a href="#" id="design_'+row.id+'" class="btn btn-info design" target="_blank">设计</a>'
				+ '<a href="#" tkey="showDfForm" tid="'+row.id+'" class="btn btn-info view">查看</a>'
				+ '<a href="#" tkey="useDfForm" tid="'+row.id+'" class="btn btn-info use">录入数据</a>']
				.join('');
	}

	window.actionEvents = {
		'click .delete' : function(e, value, row, index) {
			deleteConfigForm(row.id);
		},
		'click .design' : function(e, value, row, index) {
			designForm(row.id);
		},
		'click .view' : function(e, value, row, index) {
			handle.call(this);
		},
		'click .use' : function(e, value, row, index) {
			handle.call(this);
		},
		
	};

	function deleteConfigForm(formId) {
		$.ajax({
			url : "${ctx}/config/form/delete/" + formId,
			cache : false,
			success : function(data) {
				location.reload();
			},
			error : function() {
				alert("error");
			}
		});
	}

	function designForm(formId) {
		$("#design_" + formId).attr("href",
				"${ctx}/config/form/designer/" + formId);
	}

	var handleOpts = {
		showDfForm : {
			width : 300,
			height : 300,
			url : "${ctx }/config/form/showCreateForm",
			open : function(url, id) {
				$(".modal-body", parent.window.$(parent.document)).load(url);
				if(id != null){
					var detailurl = '${ctx }/config/form/detail/' + id;
					loadDetail1.call(this, detailurl);
				}
			},
			savebtn : [ {
				text : 'chuangjian',
				css : 'btn btn-primary',
				click : function() {
					var modal = parent.window.$(parent.document);
					var options = {
						url : '${ctx }/config/form/create',
						type : 'post',
						beforeSubmit : showRequest, //æäº¤åå¤ç 
						success : showResponse, //å¤çå®æ 
						dataType : 'html',
						resetForm : true,
					};

					$('#modalform', modal).ajaxSubmit(options);
				}
			}, {
				text : 'quxiao',
				css : 'btn btn-default',
				click : function() {
					var modal = parent.window.$(parent.document);
					$("#myModal",modal).modal("hide");
					// $("#myModal",parent.window.$(parent.document)).modal("hide");
				}
			} ]
		},
		useDfForm : {
			width : 300,
			height : 300,
			url : "${ctx }/config/form/use",
			open : function(url, id) {
				$(".modal-body", parent.window.$(parent.document)).load(url+"/"+id);
			},
			savebtn : [ {
				text : 'chuangjian',
				css : 'btn btn-primary',
				click : function() {
					var modal = parent.window.$(parent.document);
					var options = {
						url : '${ctx }/config/form/use',
						type : 'post',
						beforeSubmit : showRequest, //æäº¤åå¤ç 
						success : showResponse, //å¤çå®æ 
						dataType : 'html',
						resetForm : true,
					};
					$('#modalform', modal).submit();
				}
			}, {
				text : 'quxiao',
				css : 'btn btn-default',
				click : function() {
					var modal = parent.window.$(parent.document);
					$("#myModal",modal).modal("hide");
					// $("#myModal",parent.window.$(parent.document)).modal("hide");
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
				<div id="toolbar">
					<button tkey="showDfForm" type="button"
						class="btn btn-primary handle">新建</button>
					<button type="button" class="btn btn-default">Primary</button>
					<button type="button" class="btn btn-success">Success</button>
					<button type="button" class="btn btn-info">Info</button>
					<button type="button" class="btn btn-warning">Warning</button>
					<button type="button" class="btn btn-danger">Danger</button>
				</div>
				<!-- Table -->
				<div class="row">
					<div class="col-md-12">
						<table class="table table-striped table-bordered table-hover"
							id="table" data-toggle="table"
							data-url="${ctx }/config/form/list/json"
							data-row-style="rowStyle" data-query-params="queryParams"
							data-cache="false" data-click-to-select="true"
							data-toolbar="#toolbar" data-pagination="true" data-search="true"
							data-height="600">
							<thead>
								<tr>
									<th data-field="state" data-checkbox="true"></th>
									<th data-field="name">表单名称</th>
									<th data-field="displayName">显示名称</th>
									<th data-field="creator">创建人</th>
									<th data-field="createTime">创建时间</th>
									<th data-field="type">类别</th>
									<th data-field="action" data-formatter="actionFormatter"
										data-events="actionEvents">操作</th>
								</tr>
							</thead>
						</table>
						<div class="widget-foot">
							<ul class="pagination pull-right">
								<li><a href="#">Prev</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">Next</a></li>
							</ul>
							<div class="clearfix"></div>
						</div>
						<!--widget-foot ends  -->
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