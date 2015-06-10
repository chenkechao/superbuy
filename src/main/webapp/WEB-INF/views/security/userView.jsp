<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>leaveApply</title> 
  <%@include file="/common/meta.jsp"%>
  <style>
  	body{
  		padding-top: 0px;
  	}
  </style>
  <script type="text/javascript">
  $(function(){
	  var url = '${ctx}/security/user/view/json/'+${userId};
	  loadDetail1(url);
  });
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
	                <table class="table table-striped table-bordered table-hover">
	                	<thead>
	                		<tr>
	                			<th>name</th>
	                			<th>value</th>
							</tr>
	                	</thead>
	                	<tbody> 
		                    <tr>         
		                        <td width="35%">账号</td>
		                        <td width="65%"><a href="#" id="username" data-type="text" data-pk="1" data-title="Enter username"></a></td>
		                    </tr>
		                    <tr>         
		                        <td>姓名</td>
		                        <td><a href="#" id="fullname" data-type="text" data-pk="1" data-placement="right" data-placeholder="Required" data-title="Enter your fullname"></a></td>
		                    </tr>  
		                    <tr>         
		                        <td>邮箱</td>
		                        <td><a href="#" id="email" data-type="select" data-pk="1" data-value="" data-title="Select email"></a></td>
		                    </tr>
		                    <tr>         
		                        <td>部门</td>
		                        <td><a href="#" id="group" data-type="select" data-pk="1" data-value="5" data-source="/groups" data-title="Select group"></a></td>
		                    </tr> 
		                    <tr>         
		                        <td>角色</td>
		                        <td><a href="#" id="status" data-type="select" data-pk="1" data-value="0" data-source="/status" data-title="Select status"></a></td>
		                    </tr>  
	                	</tbody>
	            	</table>
                  </div>
                </div>
                  <div class="widget-foot">
                    <!-- Footer goes here -->
                  </div>
              </div>  

            </div>

          </div><!-- row ends -->

        </div><!-- container -->
		  </div><!-- matter -->
	</div>

</body>
</html>