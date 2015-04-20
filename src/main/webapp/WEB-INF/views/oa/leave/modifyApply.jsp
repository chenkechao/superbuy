<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <!-- Stylesheets -->
  <link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
  <!-- JS -->
<script src="<%=request.getContextPath() %>/resources/js/jquery.js" ></script> <!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script> <!-- Bootstrap -->
<!-- jQuery Notification ends -->
<script src="<%=request.getContextPath() %>/resources/js/bootstrap-datetimepicker.js"></script> <!-- Date picker -->
<script src="<%=request.getContextPath() %>/resources/js/locales/bootstrap-datetimepicker.fr.js"></script> <!-- Date picker -->
  
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
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">x</button>
		<h4 class="modal-title">Modal title</h4>
	</div>
	<div class="modal-body">
		<div class="alert alert-warning" id="backReason"></div>
		<ul id="myTab" class="nav nav-tabs">
			<li class="active"><a href="#modify" data-toggle="tab"
				value="true">tiaozhengshenqing</a></li>
			<li><a href="#cancel" data-toggle="tab" value="false">quxiaoshenqing</a></li>
		</ul>
		<div id="myTabContent" class="tab-content"
			style="padding-bottom: 2px; margin-top: 20px">
			<div id="modify" class="tab-pane fade in active">
				<form class="form-horizontal" role="form" action="">
					<div class="form-group">
						<label class="col-lg-4 control-label">qingjialeixin:</label>
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
					<div class="form-group">
						<label for="startTime" class="col-lg-4 control-label">kaishishijian:</label>
						<div class="col-lg-8">
							<div class="input-group date form_datetime"
								data-date-format="yyyy-MM-dd HH:mm" data-link-field="startTime">
								<input class="form-control" size="16" type="text" id="startTime" name="startTime"
									readonly> <span class="input-group-addon"><span
									class="glyphicon glyphicon-remove"></span></span> <span
									class="input-group-addon"><span
									class="glyphicon glyphicon-th"></span></span>
							</div>
							<br />
						</div>
					</div>
					<div class="form-group">
						<label for="endTime" class="col-lg-4 control-label">jieshushijian:</label>
						<div class="col-lg-8">
							<div class="input-group date form_datetime"
								data-date-format="yyyy-MM-dd HH:mm" data-link-field="endTime">
								<input class="form-control" size="16" type="text" id="endTime" name="endTime"
									readonly> <span class="input-group-addon"><span
									class="glyphicon glyphicon-remove"></span></span> <span
									class="input-group-addon"><span
									class="glyphicon glyphicon-th"></span></span>
							</div>
							<br />
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-4 control-label">qingjiayuanyin:</label>
						<div class="col-lg-8">
							<textarea class="form-control" rows="4" id="reason" name="reason"></textarea>
						</div>
					</div>
				</form>
			</div>
			<div class="tab-pane fade" id="cancel">
				<h1>quxiao</h1>
			</div>
		</div>
	</div>
	<div class="modal-footer handle-footer"></div>
</body>
</html>