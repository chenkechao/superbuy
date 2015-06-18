<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>账号管理</title> 
  <%@include file="/common/meta.jsp"%>
  <style>
  	body{
  		padding-top: 0px;
  	}
  </style>
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
					                <label for="username" class="col-sm-4 control-label">账号:</label>
					                <div class="col-sm-8">
						            	<input class="form-control" type="text" value="" id="username" name="username">
						            </div>
					            </div>
                                
                                <div class="form-group">
					                <label for="fullname" class="col-sm-4 control-label">姓名:</label>
					                <div class="col-sm-8">
						            	<input class="form-control" type="text" value="" id="fullname" name="fullname">
						            </div>
					            </div>
                                
                                <div class="form-group">
					                <label for="plainPassword" class="col-sm-4 control-label">密码:</label>
					                <div class="col-sm-8">
						            	<input class="form-control" type="password" value="" id="plainPassword" name="plainPassword">
						            </div>
					            </div>    
                                
                                <div class="form-group">
					                <label for="email" class="col-sm-4 control-label">邮箱:</label>
					                <div class="col-sm-8">
						            	<input class="form-control" type="email" value="" id="email" name="email" placeholder="jane.doe@example.com">
						            </div>
					            </div>  

                                <div class="form-group">
					                <label for="sex" class="col-sm-4 control-label">性别:</label>
					                <div class="col-sm-8">
						            	<select class="form-control" id="sex" name="sex">
						            		<option>男</option>
						            		<option>女</option>
						            	</select>
						            </div>
					            </div>
					            
					            <div class="form-group">
					                <label for="enabled" class="col-sm-4 control-label">是否可用:</label>
					                <div class="col-sm-8">
						            	<select class="form-control" id="enabled" name="enabled">
						            		<option>是</option>
						            		<option>否</option>
						            	</select>
						            </div>
					            </div>
					            
					            <div class="form-group">
					                <label for="org.id" class="col-sm-4 control-label">部门:</label>
					                <div class="col-sm-8">
						            	<input class="form-control" type="text" id="org.id" name="org.id" readonly/>
						            </div>
					            </div>
					            
					            <div class="form-group">
					                <label for="roles" class="col-sm-4 control-label">角色名称:</label>
					                <div class="col-sm-8">
						            	<input class="form-control" type="text" id="roles" name="roles" readonly/>
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