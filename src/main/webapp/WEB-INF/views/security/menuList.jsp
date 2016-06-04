<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>菜单管理</title>
<%@include file="/common/meta.jsp"%>
<script type="text/javascript">
var editor; 
$(document).ready(function() {
	editor = new $.fn.dataTable.Editor( {
		ajax: "${ctx }/security/menu/update",
        idSrc:  'id',
        table: "#menuList",
        fields: [ {
                label: "菜单名称:",
                name: "name"
            },{
                label: "上级菜单名称:",
                name: "name"
            }
        ]
    } );
	
    $('#menuList').DataTable( {
    	dom: "Bfrtip",
        ajax: {
        	"url":"${ctx }/security/menu/list/json",
        	"dataSrc": ""
        },
        columns: [
                    { "data": "name" },
                    { "data": "parentMenu.name",
                    	"defaultContent":""}
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
			<div class="col-md-12">
				<div class="table-responsive">
					<table id="menuList" class="table table-striped table-bordered"
						cellspacing="0" width="100%">
						<thead>
							<tr>
								<th data-field="name">菜单名称</th>
								<th data-field="parentMenu.name">上级菜单名称</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<!-- con-md-12 ends -->
		</div>
		<!-- row ends -->
	</div>
	<!-- Container ends -->
</body>
</html>
