<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>数据字典管理</title> 
  <%@include file="/common/meta.jsp"%>
  <style>
  	body{
  		padding-top: 0px;
  	}
  </style>
  <script type="text/javascript">
  	$(function(){
  		$('.no-records-found').remove();
  	});
  
  	function addItem() {
		var table = document.getElementById("itemTable");
		var row = table.insertRow(-1);
		var cell = row.insertCell(-1);
		cell.innerHTML = "<input type='checkbox' name=''>";
		
		var cell = row.insertCell(-1);
		cell.innerHTML = "<input type='text' value='" + 1 + "' name='orderbys'>";
		
		cell = row.insertCell(-1);
		cell.innerHTML = "<input type='text' value='' name='codes' >";
		
		cell = row.insertCell(-1);
		cell.innerHTML = "<input type='text' value='' name='itemNames' >";
		
		cell = row.insertCell(-1);
		cell.innerHTML = "<a href='javascript:void(0)' onclick='delRow1' title='删除'>删除</a>";
	}
  </script>
</head>

<body>


<!-- Main bar -->
  	<div class="mainbar">
      <!-- Page heading -->
	    <div class="page-head">
        <!-- Page heading -->
	      <h2 class="pull-left">Forms 
          <!-- page meta -->
          <span class="page-meta">Something Goes Here</span>
        </h2>


        <!-- Breadcrumb -->
        <div class="bread-crumb pull-right">
          <a href="index.html"><i class="icon-home"></i> Home</a> 
          <!-- Divider -->
          <span class="divider">/</span> 
          <a href="#" class="bread-current">Forms</a>
        </div>

        <div class="clearfix"></div>

	    </div>
	    <!-- Page heading ends -->



	    <!-- Matter -->

	    <div class="matter">
        <div class="container">

          <div class="row">

            <div class="col-md-12">


              <div class="widget wgreen">
                
                <div class="widget-head">
                  <div class="pull-left">Forms</div>
                  <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a> 
                    <a href="#" class="wclose"><i class="icon-remove"></i></a>
                  </div>
                  <div class="clearfix"></div>
                </div>

                <div class="widget-content">
                  <div class="padd">

                    <h6>Input Boxs</h6>
                    <hr />
                    <!-- Form starts.  -->
                     <form id="user" class="form-horizontal" role="form" action="${ctx }/oa/leave/start" method="post">
                              
                                <div class="form-group">
					                <label for="name" class="col-sm-4 control-label">配置名称：</label>
					                <div class="col-sm-8">
						            	<input class="form-control" type="text" value="" id="name" name="name">
						            </div>
					            </div>
                                
                                <div class="form-group">
					                <label for="cnName" class="col-sm-4 control-label">显示名称：</label>
					                <div class="col-sm-8">
						            	<input class="form-control" type="text" value="" id="cnName" name="cnName">
						            </div>
					            </div>
                                
                                <div class="form-group">
					                <label for="description" class="col-sm-4 control-label">配置描述：</label>
					                <div class="col-sm-8">
						            	<textarea class="form-control" rows="3" id="description" name="description"></textarea>
						            </div>
					            </div>    
                                
                                <div class="form-group">
					                <label for="email" class="col-sm-4 control-label">添加选项：</label>
					                <div class="col-sm-8">
						            	<button type="button" class="btn btn-default" onclick="addItem()">添加选项</button>
						            </div>
					            </div>  

								 <hr />
								 <div class="form-group">
								     <label for="email" class="col-md-4 control-label">选项列表：</label>
								     <div class="col-md-8">
										 <table class="table table-striped table-bordered table-hover"
										   id="itemTable" data-toggle="table"
										   data-click-to-select="true"
									       data-height="200"
									       data-responseHandler="handle">
											<thead>
										    <tr>
										        <th data-field="state" data-checkbox="true"></th>
										        <th data-field="orderby">序号</th>
										        <th data-field="code">编号</th>
										        <th data-field="name">名称</th>
										        <th data-field="action">操作</th>
										    </tr>
										    </thead>
										</table>
									</div>
								</div>
                              </form>
                  </div>
                </div>
                  <div class="widget-foot">
                    <!-- Footer goes here -->
                  </div>
              </div>  

            </div>

          </div>

        </div>
		  </div>
</div>

</body>
</html>