<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>用户管理</title>
<%@include file="/common/meta.jsp"%>
<script type="text/javascript">
var editor; 
$(document).ready(function() {
	editor = new $.fn.dataTable.Editor( {
		ajax: "${ctx }/security/user/update",
        idSrc:  'id',
        table: "#example",
        fields: [ {
                label: "username:",
                name: "username"
            }, {
                label: "fullname:",
                name: "fullname"
            }, {
                label: "org:",
                name: "org.name"
            }, {
                label: "enabled:",
                name: "enabled"
            }
        ]
    } );
	
    $('#example').DataTable( {
    	dom: "Bfrtip",
        ajax: {
        	"url":"${ctx }/security/user/list/json"
        	//"dataSrc": ""
        },
        columns: [
                    { "data": "username" },
                    { "data": "fullname" },
                    { "data": "org.name" },
                    { "data": "enabled" }
                ],
        select: true,
        buttons: [
                  { extend: "create", editor: editor },
                  { extend: "edit",   editor: editor },
                  //{
                  //    extend: "selectedSingle",
                  //    text: "edit1",
                  //    action: function ( e, dt, node, config ) {
                  //        alert('ss');
                  //    }
                  //},
                  { extend: "remove", editor: editor }
              ]
    } );
} );

	function actionFormatter(value, row, index) {
		return [ '<a href="#" class="btn btn-info delete" title="删除">删除</a>'
				+ '<a href="#" class="btn btn-info update" title="编辑">编辑</a>'
				+ '<a href="#" class="btn btn-info view" title="查看">查看</a>' ]
				.join('');
	}

	window.actionEvents = {
		'click .delete' : function(e, value, row, index) {
			deleteUser(row.id);
		},
		'click .update' : function(e, value, row, index) {
			viewUser(row.id);
		},
		'click .view' : function(e, value, row, index) {
			viewUser(row.id);
		}
	};

	function createUser() {
		$('#mainIframe', $(parent.document)).attr("src",
				'${ctx }/security/user/create');
	}

	function updateUser(userId) {
		$('#mainIframe', $(parent.document)).attr("src",
				'${ctx}/security/user/update/' + userId);
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
			<div class="container">
				<!-- Table -->
				<div class="row">
					<div class="col-xs-12 visible-xs-block">
						hello
					</div>
					<div class="col-lg-12">
						<div class="table-responsive">
							<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
						        <thead>
						            <tr>
						                <th>username</th>
						                <th>fullname</th>
						                <th>org</th>
						                <th>enabled</th>
						            </tr>
						        </thead>
						    </table>
						</div>
						<!-- 
						<div id="toolbar" class="fixed-table-toolbar"
							style="margin-bottom: -40px">
							<button id="createUser" type="button" class="btn btn-primary"
								onClick="createUser()">新建</button>
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
									<th data-field="username" class="hidden-phone">账号</th>
									<th data-field="fullname">姓名</th>
									<th data-field="enabled">是否可用</th>
									<th data-field="action" data-formatter="actionFormatter"
										data-events="actionEvents">操作</th>
								</tr>
							</thead>
						</table> -->
					</div>
					<!-- con-md-12 ends -->
				</div>
				<!-- row ends -->
			</div>
			<!-- Container ends -->
</body>
</html>
