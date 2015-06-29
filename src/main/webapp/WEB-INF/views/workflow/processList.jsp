<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>流程列表</title>
<%@include file="/common/meta.jsp"%>
   <style>
  	body{
  		padding-top: 0px;
  	}
  </style>
  <script type="text/javascript">
  
	  var $table = $('#table'), $remove = $('#re_send_selected');
	  $(function () {
		  $table.bootstrapTable('refresh');
		  
	      $table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
	          $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
	      });
	      $remove.click(function () {
	          var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
	              return row.id;
	          });
	          alert('重新发送选中邀请, rows: ' + ids);
	          $remove.prop('disabled', true);
	      });
	  });
	  
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
  
	  function actionFormatter(value, row, index) {
	      return [
	          '<a href="${ctx}/config/dictionary/delete/'+row.id+' class="btnDel" title="删除">删除</a>'
	          + '<a href="${ctx}/config/dictionary/update/'+row.id+'" class="btnEdit" title="编辑">编辑</a>'
			  + '<a href="${ctx}/config/dictionary/view/'+row.id+'" class="btnView" title="查看">查看</a>'
	      ].join('');
	  }
	
	  window.actionEvents = {
	      'click .resend': function (e, value, row, index) {
	          alert('重新发送该邀请, row: ' + JSON.stringify(row));
	          console.log(value, row, index);
	      }
	  };
	  
	  var handleOpts = {
    		  deploy:  {
      	        width: 300,
      		    height: 300,
      		    url:"${ctx }/workflow/showUploadModal",
      	    	open:function(url) {
      	    		$(".modal-body",parent.window.$(parent.document)).load(url);
      	    	},
      	    	savebtn:[]
              },
    		  startup:  {
    	        width: 300,
    		    height: 300,
    		    url:"${ctx }/form/formkey/start/showStartForm/",
    	    	open:function(url,processDefinitionId) {
    	    		alert('fd');
    	    		$(".modal-body",parent.window.$(parent.document)).load(url);
    	    	},
    	    	savebtn:[{
    	    		text:'qidongliucheng',
    	    		css:'btn btn-primary',
    	    		click:function(){
    	    			//$(".form-horizontal",parent.window.$(parent.document)).submit();
    	    		}
    	    	}
    	    	,{
    	    		text:'quxiao',
    	    		css:'btn btn-default',
    	    		click:function(){
    	    			$("#myModal",modal).modal("hide");
    	    		}
    	    	}]
          	}
      }
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
					    <div class="btn-group">
						  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    Action <span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu">
						    <li><a href="#" onClick="processDefinitionList('all')">All</a></li>
						    <li><a href="#" onClick="processDefinitionList('dynamicForm')">DynamicForm</a></li>
						    <li role="separator" class="divider"></li>
						    <li><a href="#">Separated link</a></li>
						  </ul>
						</div>
						
						<button type="button" class="btn btn-default handle" tkey="deploy">deploy</button>
					</div>
					<table class="table table-striped table-bordered table-hover"
					   id="table" data-toggle="table"
				       data-url="${ctx }/workflow/processList/all/list/json"
				       data-cache="false"
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
