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
		return [ '<a href="#" id="td_'+row.id+'" class="btn btn-info edit" CCrget="_blank">编辑</a>'
				+ '<a href="#" class="btn btn-info deploy">部署</a>'
				+ '导出(<a href="#" id="exportXML_'+row.id+'" class="exportXML" target="_blank">BPMN</a>'
						+'|<a href="#" id="exportJSON_'+row.id+'" class="exportJSON">JSON</a>'
						+'|<a href="#" id="exportSVG_'+row.id+'" class="exportSVG">SVG</a>)'
				+ '<a href="#" class="btn btn-info delete">删除</a>' ]
				.join('');
	}
	
	window.actionEvents = {
		'click .delete' : function(e, value, row, index) {
			deleteModel(row.id);
		},
		'click .edit' : function(e, value, row, index) {
			$("#td_"+row.id).attr("href","${ctx}/modeler.html?modelId="+row.id);
		},
		'click .deploy' : function(e, value, row, index) {
			deployModel(row.id);
		},
		'click .exportXML' : function(e, value, row, index) {
			$("#exportXML_"+row.id).attr("href","${ctx}/process/model/export/"+row.id + "/bpmn");
		},
		'click .exportJSON' : function(e, value, row, index) {
			$("#exportJSON_"+row.id).attr("href","${ctx}/process/model/export/"+row.id + "/json");
		}
	};
	
	function exportXML(modelId,type){
		$.ajax({
			url : "${ctx }/process/model/export/"
					+ modelId + "/" +type,
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

	function deleteModel(modelId) {
		$.ajax({
			url : "${ctx }/process/model/delete/"
					+ modelId,
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
	
	function deployModel(modelId) {
		$.ajax({
			url : "${ctx }/process/model/deploy/"
					+ modelId,
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
							var modal = parent.window.$(parent.document);
							var options = {
								url : '${ctx }/process/model/create',
								type : 'post',
								beforeSubmit : showRequest, //提交前处理 
								success : showResponse, //处理完成 
								dataType : 'html',
								resetForm : true,
							};

							$('#createModelForm', modal).on("submit", function() {
								alert('fda');
								$('#createModelForm', modal).ajaxSubmit(options);
								return false;
							});
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