<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <title>表单管理</title> 
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
  $(function(){
	  $(".handle").on("click",handle);
  });
  
  var handleOpts ={
		  creacreateform:{
			  width:300,
			  height:300,
			  url:"<%=request.getContextPath()%>/form/config/showCreateFormModal",
			  open:function(){
				  var modal = parent.window.$(parent.document);
				  var options = {  
		 			    	url:'<%=request.getContextPath()%>/form/config/create',
		 			    	type:'post',
		 			        beforeSubmit:  showRequest,  //提交前处理 
		 			        success:       showResponse,  //处理完成 
		 			        dataType:'html',
		 			        resetForm: true,  
		 			    }; 
		  			 
		  			$('#modalform',modal).on("submit",function(){
		  				$('#modalform',modal).ajaxSubmit(options);  
					        return false;
		  			});
			  },
			  savebtn:[{
				  text:'chuangjian',
				  css:'btn btn-primary',
				  click:function(){
					  var modal = parent.window.$(parent.document);
					  $('#modalform',modal).submit();
				  }
			  },{
				  text:'quxiao',
				  css:'btn btn-default',
				  click:function(){
					  $("#myModal",parent.window.$(parent.document)).modal("hide");
				  }
			  }]
		  }
  };
  
  function showRequest(formData,jqForm,options){
  }  

function showResponse(responseText,statusText) {
  	if(responseText == "success") {
  		alert("success");
  		$("#myModal",parent.window.$(parent.document)).modal("hide");
  		location.reload();
  	}else{
  		alert("error");
  	}
  }
  
  function handle(){
	  var tkey = $(this).attr("tkey");
	var modal = parent.window.$(parent.document);
	modal.find("#myModal")
		.modal({remote:handleOpts[tkey].url})
		.on("shown.bs.modal",function(){
			if($(".handle-footer input",modal).length==0){
			$.each(handleOpts[tkey].savebtn,function(){
				$("<input>", {
				  type: "button",
				  val: this.text,
				  class:this.css,
				  click: this.click,
				}).appendTo($(".handle-footer",modal));
			});
			handleOpts[tkey].open.call(this);
			}
		}).on("hide.bs.modal",function(){
			modal.find("#myModal").removeData("bs.modal");
			$(".handle-footer input",modal).remove();
			modal.find("#myModal").off("shown.bs.modal");
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
				<button tkey="creacreateform" type="button" class="btn btn-primary handle">xinjian</button>
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
                    <table class="table table-striped table-bordered table-hover">
                      <thead>
                      	<tr>
							<th>表单名称</th>
							<th>显示名称</th>
							<th>创建人</th>
							<th>创建时间</th>
							<th>类别</th>
							<th>操作</th>
                      	</tr>
                      </thead>
                      <tbody>
                          <c:forEach items="${formList }" var="form">
                              <tr>
                                  <td>${form.name }</td>
                                  <td>${form.displayName }</td>
                                  <td>${form.creator }</td>
                                  <td>${form.createTime }</td>
                                  <td>${form.type }</td>
                                  <td>${model.metaInfo }</td>
                                  <td>
									  <a href="<%=request.getContextPath() %>/form/config/designer/${form.id}" target="_blank">sheji</a>
									  <a href="<%=request.getContextPath() %>/form/config/view/${form.id}">chakan</a>
			                          <a href="<%=request.getContextPath() %>/form/config/use/${form.id}">lurushuju</a>
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