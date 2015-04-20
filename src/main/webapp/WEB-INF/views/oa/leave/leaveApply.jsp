<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <title>表格页面 Bootstrap响应式后台管理系统模版Mac - JS代码网</title> 
  <meta name="keywords" content="Bootstrap模版,Bootstrap模版下载,Bootstrap教程,Bootstrap中文,后台管理系统模版,后台模版下载,后台管理系统,后台管理模版" />
  <meta name="description" content="JS代码网提供Bootstrap模版,后台管理系统模版,后台管理界面,Bootstrap教程,Bootstrap中文翻译等相关Bootstrap插件下载" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
  <meta name="author" content="">
  <!-- Stylesheets -->
  <link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
  <!-- Font awesome icon -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/fontawesome/css/font-awesome.css"> 
  <!-- jQuery UI -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/style/jquery-ui.css"> 
  <!-- Calendar -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/style/fullcalendar.css">
  <!-- prettyPhoto -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/style/prettyPhoto.css">  
  <!-- Star rating -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/style/rateit.css">
  <!-- Date picker -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/style/bootstrap-datetimepicker.min.css">
  <!-- CLEditor -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/style/jquery.cleditor.css"> 
  <!-- Uniform -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/style/uniform.default.css"> 
  <!-- Bootstrap toggle -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/style/bootstrap-switch.css">
  <!-- Main stylesheet -->
  <link href="<%=request.getContextPath() %>/resources/style/style.css" rel="stylesheet">
  <!-- Widgets stylesheet -->
  <link href="<%=request.getContextPath() %>/resources/style/widgets.css" rel="stylesheet">   
  
  <!-- JS -->
<script src="<%=request.getContextPath() %>/resources/js/jquery.js" ></script> <!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script> <!-- Bootstrap -->
<script src="<%=request.getContextPath() %>/resources/js/jquery-ui-1.9.2.custom.min.js"></script> <!-- jQuery UI -->
<script src="<%=request.getContextPath() %>/resources/js/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->
<script src="<%=request.getContextPath() %>/resources/js/jquery.rateit.min.js"></script> <!-- RateIt - Star rating -->
<script src="<%=request.getContextPath() %>/resources/js/jquery.prettyPhoto.js"></script> <!-- prettyPhoto -->

<!-- jQuery Flot -->
<script src="<%=request.getContextPath() %>/resources/js/excanvas.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.flot.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.flot.resize.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.flot.pie.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.flot.stack.js"></script>

<!-- jQuery Notification - Noty -->
<script src="<%=request.getContextPath() %>/resources/js/jquery.noty.js"></script> <!-- jQuery Notify -->
<script src="<%=request.getContextPath() %>/resources/js/themes/default.js"></script> <!-- jQuery Notify -->
<script src="<%=request.getContextPath() %>/resources/js/layouts/bottom.js"></script> <!-- jQuery Notify -->
<script src="<%=request.getContextPath() %>/resources/js/layouts/topRight.js"></script> <!-- jQuery Notify -->
<script src="<%=request.getContextPath() %>/resources/js/layouts/top.js"></script> <!-- jQuery Notify -->
<!-- jQuery Notification ends -->

<script src="<%=request.getContextPath() %>/resources/js/sparklines.js"></script> <!-- Sparklines -->
<script src="<%=request.getContextPath() %>/resources/js/jquery.cleditor.min.js"></script> <!-- CLEditor -->
<script src="<%=request.getContextPath() %>/resources/js/bootstrap-datetimepicker.js"></script> <!-- Date picker -->
<script src="<%=request.getContextPath() %>/resources/js/locales/bootstrap-datetimepicker.fr.js"></script> <!-- Date picker -->
<script src="<%=request.getContextPath() %>/resources/js/jquery.uniform.min.js"></script> <!-- jQuery Uniform -->
<script src="<%=request.getContextPath() %>/resources/js/bootstrap-switch.min.js"></script> <!-- Bootstrap Toggle -->
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