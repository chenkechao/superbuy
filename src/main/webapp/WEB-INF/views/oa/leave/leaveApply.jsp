<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/include.jsp"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>leaveApply</title> 
  <%@include file="/common/meta.jsp"%>
  
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script> <!-- Bootstrap -->
<script src="<%=request.getContextPath() %>/resources/js/jquery-ui-1.9.2.custom.min.js"></script> <!-- jQuery UI -->


<!-- jQuery Notification - Noty -->
<script src="<%=request.getContextPath() %>/resources/js/jquery.noty.js"></script> <!-- jQuery Notify -->
<script src="<%=request.getContextPath() %>/resources/js/themes/default.js"></script> <!-- jQuery Notify -->
<script src="<%=request.getContextPath() %>/resources/js/layouts/bottom.js"></script> <!-- jQuery Notify -->
<script src="<%=request.getContextPath() %>/resources/js/layouts/topRight.js"></script> <!-- jQuery Notify -->
<script src="<%=request.getContextPath() %>/resources/js/layouts/top.js"></script> <!-- jQuery Notify -->
<!-- jQuery Notification ends -->

<script src="<%=request.getContextPath() %>/resources/js/sparklines.js"></script> <!-- Sparklines -->
<script src="<%=request.getContextPath() %>/resources/js/filter.js"></script> <!-- Filter for support page -->
<script src="<%=request.getContextPath() %>/resources/js/custom.js"></script> <!-- Custom codes -->
<script src="<%=request.getContextPath() %>/resources/js/charts.js"></script> <!-- Charts & Graphs -->
  
  <!-- HTML5 Support for IE -->
  <!--[if lt IE 9]>
  <script src="js/html5shim.js"></script>
  <![endif]-->

  <!-- Favicon -->
  <link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/img/favicon/favicon.png">
  <style>
  	body{
  		padding-top: 0px;
  	}
  </style>
  
  <script type="text/javascript">
      $(function(){
    	  $('.form_datetime').datetimepicker({
    	        //language:  'fr',
    	        weekStart: 1,
    	        todayBtn:  1,
    			autoclose: 1,
    			todayHighlight: 1,
    			startView: 2,
    			forceParse: 0,
    	        showMeridian: 1
    	    });
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
                     <form id="leave" class="form-horizontal" role="form" action="<%=request.getContextPath()%>/oa/leave/start" method="post">
                              
                                <div class="form-group">
					                <label for="startTime" class="col-lg-4 control-label">kaishishijian:</label>
					                <div class="col-lg-4">
						                <div class="input-group date form_datetime" data-date-format="yyyy-MM-dd HH:mm" data-link-field="startTime">
						                    <input class="form-control" size="16" type="text" value="" id="startTime" name="startTime" readonly>
						                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
											<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
						                </div>
										<br/>
									</div>
					            </div>
                                
                                <div class="form-group">
					                <label for="endTime" class="col-lg-4 control-label">jieshushijian:</label>
					                <div class="col-lg-4">
						                <div class="input-group date form_datetime" data-date-format="yyyy-MM-dd HH:mm" data-link-field="endTime">
						                    <input class="form-control" size="16" type="text" value="" id="endTime" name="endTime" readonly>
						                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
											<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
						                </div>
										<br/>
									</div>
					            </div>
                                
                                <div class="form-group">
                                  <label class="col-lg-4 control-label">qingjiayuanyin:</label>
                                  <div class="col-lg-8">
                                    <textarea class="form-control" rows="5" id="reason" name="reason"></textarea>
                                  </div>
                                </div>    
                                
                                <div class="form-group">
                                  <label class="col-lg-4 control-label">qingjialeixin</label>
                                  <div class="col-lg-8">
                                    <select class="form-control" id="leaveType" name="leaveType">
                                      <option>gongxiu</option>
                                      <option>binjia</option>
                                      <option>tiaoxiu</option>
                                      <option>shijia</option>
                                      <option>hunjia</option>
                                    </select>
                                  </div>
                                </div>     

                                    <hr />
                                <div class="form-group">
                                  <div class="col-lg-offset-1 col-lg-9">
                                    <input type="submit" name="shenqing" class="btn btn-primary">
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