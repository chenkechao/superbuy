<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>配置管理</title>
<%@include file="/common/meta.jsp"%>
   <style>
  	body{
  		padding-top: 0px;
  	}
  </style>
  <script type="text/javascript">
	  function rowStyle(row, index) {
	      var classes = ['active', 'success', 'info', 'warning', 'danger'];
	
	      if (row.status == "未接受邀请") {
	          return {
	              classes: 'warning'
	          };
	      }
	
	      if (row.status == "程序错误，发送邀请未成功") {
	          return {
	              classes: 'danger'
	          };
	      }
	      return {};
	  }
	  function queryParams() {
	      return {
	          type: 'owner',
	          sort: 'updated',
	          direction: 'desc',
	          per_page: 100,
	          page: 1
	      };
	  }
  
	  var $table = $('#table'), $remove = $('#re_send_selected');
	  $(function () {
	      $table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
	          $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
	      });
	      $remove.click(function () {
	          var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
	              return row.id
	          });
	          alert('重新发送选中邀请, rows: ' + ids);
	          $remove.prop('disabled', true);
	      });
	  });
  
	  function actionFormatter(value, row, index) {
	      return [
	          '<button class="btn btn-primary resend">重新发送邀请</button>'
	      ].join('');
	  }
	
	  window.actionEvents = {
	      'click .resend': function (e, value, row, index) {
	          alert('重新发送该邀请, row: ' + JSON.stringify(row));
	          console.log(value, row, index);
	      }
	  };
  </script>
</head>

<body>
<!-- Main bar -->
  	<div class="mainbar">
      <!-- Page heading -->
      <div class="page-head">
        <h2 class="pull-left"><i class="icon-table"></i> Tables</h2>

        <!-- Breadcrumb -->
        <div class="bread-crumb pull-right">
          <a href="index.html"><i class="icon-home"></i> Home</a> 
          <!-- Divider -->
          <span class="divider">/</span> 
          <a href="#" class="bread-current">Dashboard</a>
        </div>

        <div class="clearfix"></div>

      </div>
      <!-- Page heading ends -->

	    <!-- Matter -->

	    <div class="matter">
        <div class="container">

		<div>
				<button tkey="createDfForm" type="button" class="btn btn-primary handle">新建</button>
				<button type="button" class="btn btn-default">Primary</button>
				<button type="button" class="btn btn-success">Success</button>
				<button type="button" class="btn btn-info">Info</button>
				<button type="button" class="btn btn-warning">Warning</button>
				<button type="button" class="btn btn-danger">Danger</button>
			</div>
          <!-- Table -->

            <div class="row">

              <div class="col-md-12">

                <div class="widget">

                <div class="widget-head">
                  <div class="pull-left">Tables</div>
                  <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a> 
                    <a href="#" class="wclose"><i class="icon-remove"></i></a>
                  </div>  
                  <div class="clearfix"></div>
                </div>

                  <div class="widget-content">
                  	<div id="toolbar" class="fixed-table-toolbar" style="margin-bottom: -40px">
					    <button id="re_send_selected" class="btn btn-danger remove" disabled>
					        重新发送选中邀请
					    </button>
					</div>
					<table class="table table-striped table-bordered table-hover"
					   id="table" data-toggle="table"
				       data-url="${ctx }/invited/json"
				       data-click-to-select="true"
				       data-row-style="rowStyle"
				       data-query-params="queryParams"
				       data-pagination="true"
				       data-search="true"
				       data-height="600">
						<thead>

					    <tr>
					        <th data-field="state" data-checkbox="true"></th>
					        <th data-field="id">ID</th>
					        <th data-field="invited_name">受邀人名称</th>
					        <th data-field="invited_phone">受邀人手机</th>
					        <th data-field="invited_email">受邀人邮箱</th>
					        <th data-field="inviter_name">邀请人名称</th>
					        <th data-field="inviter_org">邀请人部门</th>
					        <th data-field="invite_time">邀请时间</th>
					        <th data-field="status">邀请状态</th>
					        <th data-field="action" data-formatter="actionFormatter" data-events="actionEvents">操作</th>
					    </tr>
					    </thead>
					</table>
					<div class="widget-foot">
                      
                      <div class="clearfix"></div> 

                    </div><!--widget-foot ends  -->

                </div><!-- widget-content ends -->

              </div><!-- widget ends -->

            </div><!-- con-md-12 ends -->

            </div><!-- row ends -->

        </div><!-- Container ends -->
		  </div><!-- Matter ends -->
</div>
</body>
</html>
