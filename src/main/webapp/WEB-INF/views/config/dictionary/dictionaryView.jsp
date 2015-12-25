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
	$(function() {

		//defaults
		//$.fn.editable.defaults.url = '${ctx}/security/user/update';
		$.fn.editable.defaults.mode = 'inline';

		$('.myeditable').editable();

		$('.myeditable').on(
				'save.newuser',
				function() {
					var that = this;
					setTimeout(function() {
						$(that).closest('tr').next().find('.myeditable')
								.editable('show');
					}, 200);
				});

		$('#name').editable('option', 'validate', function(v) {
			if (!v)
				return 'not null';
		});

		$('#cnName').editable({
			validate : function(value) {
				if ($.trim(value) == '')
					return 'This field is required';
			}
		});

		/**
		$('#savebtn').click(function() {
			$('.myeditable').editable('submit', {
				url : '${ctx}/config/dictionary/update',
				ajaxOptions : {
					cache : false,
					dataType : 'text' //assuming json response
				},
				success : function() {
					alert('11');
				},
				error : function(errors) {
					alert('22');
					var msg = '';
				}
			});
		});**/
		
		//TODO 修改功能还需要研究
		$('#savebtn').click(function(){
			alert($("#name").attr("value"));
			//$("#dictionaryForm").submit();
		});

		$('#cancelbtn').click(function() {
			$('.myeditable').editable('setValue', null) //clear values
			.editable('option', 'pk', null) //clear pk
			.removeClass('editable-unsaved'); //remove bold css

			$('#save-btn').show();
			$('#msg').hide();
		});

	});

	function actionFormatter(value, row, index) {
		var string = '';
		if (row.temp == '1') {
			string = '<a href="#" class="btn btn-info save" title="保存">保存</a>'
					+ '<a href="#" class="btn btn-info cancel" title="取消">取消</a>';
		} else {
			string = '<a href="#" class="btn btn-info delete" title="删除">删除</a>'
					+ '<a href="#" class="btn btn-info edit" title="编辑">编辑</a>';
		}
		return [ string ].join('');
	}

	window.actionEvents = {
		'click .edit' : function(e, value, row, index) {
			//$("#table-methods-table > tbody tr:eq("+index+")").replaceWith("");
			$("#items-table")
					.bootstrapTable(
							'updateRow',
							{
								index : index,
								row : {
									orderby : "<input id='orderby_"+row.id+"' name='orderbys' value='"+row.orderby+"'>",
									code : "<input id='code_"+row.id+"' name='codes' value='"+row.code+"'>",
									name : "<input id='name_"+row.id+"' name='names' value='"+row.name+"'>",
									temp : "1"
								}
							});
		},
		'click .save' : function(e, value, row, index) {
			$("#items-table").bootstrapTable('updateRow', {
				index : index,
				row : {
					orderby : $("#orderby_"+row.id).val(),
					code : $("#code_"+row.id).val(),
					name : $("#name_"+row.id).val(),
					temp : "0"
				}
			});
		},
		'click .cancel' : function(e, value, row, index) {
			$("#items-table").bootstrapTable('updateRow', {
				index : index,
				row : {
					orderby : $(row.orderby).attr('value'),
					code : $(row.code).attr('value'),
					name : $(row.name).attr('value'),
					temp : "0"
				}
			});
		},
		//@TODO 删除选择有点 问题
		'click .delete' : function(e, value, row, index) {
			 var selects = $("#items-table").bootstrapTable('getSelections');
             var ids = $.map(selects, function (row) {
                 return row.id;
             });
             if(ids == ''){
            	 alert("请选择其中一个!");
             }else{
            	 $("#items-table").bootstrapTable('remove', {
     				field: 'id',
                     values: ids
     			});
             }
		},
	};

	function appendRow(){
		var datas = $("#items-table").bootstrapTable('getData');
		var maxId = 0;
		for(var i=0;i < datas.length;i++){
			if(maxId < datas[i].id){
				maxId = datas[i].id;
			}
		}
        var rowId = maxId + 1;
		$("#items-table").bootstrapTable('append', 
		{
			orderby : "<input id='orderby_"+rowId+"' name='orderbys' value=''>",
			code : "<input id='code_"+rowId+"' name='codes' value=''>",
			name : "<input id='name_"+rowId+"' name='names' value=''>",
			temp : "1"
		});
	}
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
					<form id="dictionaryForm" action="${ctx}/config/dictionary/update" method="post">
						<div class="padd">
							<!-- Form starts.  -->
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>name</th>
										<th>value</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td width="35%">配置名称</td>
										<td width="65%"><a href="#" id="id" class="myeditable"
											style="display: none" data-type="text"
											data-value="${dictionary.id }"></a> <a href="#" id="name"
											class="myeditable" data-type="text" data-title="Enter name"
											data-value="${dictionary.name }"></a></td>
									</tr>
									<tr>
										<td>显示名称</td>
										<td><a href="#" id="cnName" class="myeditable"
											data-type="text" data-placement="right"
											data-value="${dictionary.cnName}" data-placeholder="Required"
											data-title="Enter cnName"></a></td>
									</tr>
								</tbody>
							</table>

							<label>添加选项：</label>
							<button id="append-data" type="button" class="btn btn-default"
								onclick="appendRow()">添加选项</button>

							<br> <br>
							<table class="table table-striped table-bordered table-hover"
								id="items-table" data-toggle="table"
								data-url="${ctx }/config/dictionary/dictionaryItem/list/json/${dictionary.name}"
								data-height="200" data-responseHandler="handle">
								<thead>
									<tr>
										<th data-field="state" data-radio="true"></th>
										<th data-field="orderby">序号</th>
										<th data-field="code">编号</th>
										<th data-field="name">名称</th>
										<th data-field="action" data-formatter="actionFormatter"
											data-events="actionEvents">操作</th>
									</tr>
								</thead>
							</table>
							<br>
							<div>
								<button type="button" id="savebtn" class="btn btn-primary">Submit</button>
								<button type="button" id="cancelbtn" class="btn btn-default">Cancel</button>
							</div>
						</div>
						<!-- padd ends -->
						<input id="input_id" name="id" type="hidden" value=""/>
						<input id="input_name" name="name" type="hidden" value=""/>
						<input id="input_cnName" name="cnName" type="hidden" value=""/>
					</form>
					</div>
					<!-- col-md-12 ends -->
				</div>
				<!-- row ends -->
			</div>
			<!-- container ends-->
		</div>
		<!-- matter ends-->
	</div>

</body>
</html>