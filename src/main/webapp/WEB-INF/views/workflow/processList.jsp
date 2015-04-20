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
      $(document).ready(
      	function(){
            $("#convertButton").on("click",
            	function(processDefinitionId){
            		//alert(processDefinitionId);
            	}
            );      		
      	}
      );
      
      function convertToModel(processDefinitionId){
      	 $.ajax({
      		 url:"<%=request.getContextPath() %>/workflow/process/convertToModel/"+processDefinitionId,
      		 success:function(){
      			 alert("da");
      		 },
      		 error:function(){
      		 	alert("error1f");
      		 }
      	 });
      }
      
      function deleteProcessDefinition(processDefinitionId,deploymentId){
      	$.ajax({
      		url:"<%=request.getContextPath() %>/workflow/process/deleteProcessDefinition/"+deploymentId,
      		cache : false,
      		success:function(){
      			alert("success");
      		},
      		error:function(){
      			alert("fda");
      		}
      	});
      }
      
      function reDeployAll(){
      		$.ajax({
      			url:"<%=request.getContextPath() %>/workflow/redeploy/all",
      			cache: false,
      			success:function(){
      				alert("redeploy success");
      			}
      		});
      	}
  </script>
</head>

<body>


	<!-- Main bar -->
  	<div class="mainbar">
      <!-- Page heading -->
      <div class="page-head">
        <h2 class="pull-left"><i class="icon-table"></i> Tables</h2>

		<button type="button" class="btn btn-primary " onclick="reDeployAll()">chognxinbushu</button>
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

                    <table class="table table-striped table-bordered table-hover">
                      <thead>
                      	<tr>
							<th>ProcessDefinitionId</th>
							<th>DeploymentId</th>
							<th>名称</th>
							<th>KEY</th>
							<th>版本号</th>
							<th>XML</th>
							<th>图片</th>
							<th>部署时间</th>
							<th>是否挂起</th>
							<th>操作</th>	
                      	</tr>
                      </thead>
                      <tbody>
                      	<c:forEach items="${processList}" var="object">
                      		<c:set var="process" value="${object[0] }"/>
                      		<c:set var="deployment" value="${object[1]}"/>
                      		<tr id="tr_"+${process.id }>
                      		    <tr>
									<td>${process.id }</td>
									<td>${process.deploymentId }</td>
									<td>${process.name }</td>
									<td>${process.key }</td>
									<td>${process.version }</td>
									<td><a target="_blank" href='<%=request.getContextPath()%>/workflow/resource/read?processDefinitionId=${process.id}&resourceType=xml'>xml</a></td>
									<td><a target="_blank" href='<%=request.getContextPath()%>/workflow/resource/read?processDefinitionId=${process.id}&resourceType=image'>image</a></td>
									<td>${deployment.deploymentTime }</td>
									<td>${process.suspended} |
										<c:if test="${process.suspended }">
											<a href="processdefinition/update/active/${process.id}">jihuo</a>
										</c:if>
										<c:if test="${!process.suspended }">
											<a href="processdefinition/update/suspend/${process.id}">guaqi</a>
										</c:if>
									</td>
									<td>
				                        <a href='#' onclick="deleteProcessDefinition('${process.id}','${process.deploymentId }')">Delete</a><br/>
				                        <a href='#' id="convertButton" onClick="convertToModel('${process.id}')">Convert to Model</a>
				                    </td>
                      		</tr>
                      	</c:forEach>                                                    
                      </tbody>
                    </table>

                    <div class="widget-foot">

                      
                        <ul class="pagination pull-right">
                          <li><a href="#">Prev</a></li>
                          <li><a href="#">1</a></li>
                          <li><a href="#">2</a></li>
                          <li><a href="#">3</a></li>
                          <li><a href="#">4</a></li>
                          <li><a href="#">Next</a></li>
                        </ul>
                      
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