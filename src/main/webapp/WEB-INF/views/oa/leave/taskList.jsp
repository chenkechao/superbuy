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
<script src="<%=request.getContextPath() %>/resources/js/bootstrap-datetimepicker.min.js"></script> <!-- Date picker -->
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
  	$(function() {
	    // 办理
	    $('.handle').click(handle);
	});
  	
  	$.fn.coffee = function(obj){
	  for(var eName in obj)
	    for(var selector in obj[eName])
	      $(this).on(eName, selector, obj[eName][selector]);
	}
  	
      function claim(taskId){
      	 $.ajax({
    		  url:'<%=request.getContextPath() %>/oa/leave/task/claim/'+taskId,
    		  cache:false,
    		  dataType:"text",
    		  success:function(data){
    			 if (resp == 'success') {
		            alert('success');
		            location.reload();
		        } else {
		            alert('error');
		        }
    		  }
    	  });
      }
      
      
      var handleOpts = {
      	  deptLeaderAudit:  {
	        width: 300,
		    height: 300,
	    	open:function(id) {
	    		loadDetail.call(this,id);
	    	},
	    	savebtn:[{
	    		text:'tongyi',
	    		click:function(event){
	    			complete(event.data.taskId,[{
	    				key:'deptLeaderPass',
	    				value:true,
	    				type:'B'
	    			}]);
	    		}
	    	}]
      	}
      };
      
      function complete(taskId,variables) {
      	  var keys="",values="",types="";
      	  if(variables) {
      	  	$.each(variables,function(){
      	  		if(keys!="") {
      	  			keys +=",";
      	  			valeus +=",";
      	  			types +=",";
      	  		}
      	  		keys += this.key;
      	  		values += this.value;
      	  		types +=this.type;
      	  	});
      	  }
      	  
		// 发送任务完成请求
	    $.post('<%=request.getContextPath() %>/oa/leave/complete/' + taskId, {
	        keys: keys,
	        values: values,
	        types: types
	    }, function(resp) {
	        if (resp == 'success') {
	            alert('success');
	            parent.window.$(parent.document).find("#myModal").modal("hide");
	            location.reload();
	        } else {
	            alert('error');
	        }
	    });
      }
      
      function handle(){
      	var modal = parent.window.$(parent.document);
		// 当前节点的英文名称
		var tkey = $(this).attr("tkey");
		// 当前节点的中文名称
		var tname = $(this).attr("tname");
		// 请假记录ID
		var rowId = $(this).parents("tr").attr("id");
		// 任务ID
		var taskId = $(this).parents("tr").attr("tid");
		modal.find("#myModal")
		.on("shown.bs.modal",function(){
			$("#savebtn",modal).text(handleOpts[tkey].savebtn[0].text)
			.on('click',{taskId:taskId},handleOpts[tkey].savebtn[0].click);
			handleOpts[tkey].open.call(this,rowId,taskId);
		 })
		 .modal();
	}
      
      function loadDetail(id) {
      	var dialog = parent.window.$(parent.document);
		$.ajax({
			  url:"<%=request.getContextPath() %>/oa/leave/detail/"+id,
			  cache:false,
			  dataType:"json",//
			  success:function(data){
			  	$.each(data, function(k, v) {
					// 格式化日期
					if (k == 'applyTime' || k == 'startTime' || k == 'endTime') {
						if(v != null){
							$('#view-info td[name=' + k + ']', dialog).text(new Date(v).format('yyyy-MM-dd hh:mm'));
						}
					} else {
			            $('#view-info td[name=' + k + ']', dialog).text(v);
					}
					
		        });
			  }
		  });
    }
    
    Date.prototype.format = function(format) {
	    var o = {
	        "M+": this.getMonth() + 1, //month 
	        "d+": this.getDate(), //day 
	        "h+": this.getHours(), //hour 
	        "m+": this.getMinutes(), //minute 
	        "s+": this.getSeconds(), //second 
	        "q+": Math.floor((this.getMonth() + 3) / 3), //quarter 
	        "S": this.getMilliseconds() //millisecond 
	    }
	    if (/(y+)/.test(format)) 
	        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o) 
	        if (new RegExp("(" + k + ")").test(format)) 
	            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
	    return format;
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

                    <table class="table table-striped table-bordered table-hover">
                      <thead>
                      	<tr>
							<th>jiazhong</th>
							<th>shengqingren</th>
							<th>shengqingshijian</th>
							<th>kaishishijian</th>
							<th>jieshushijian</th>
							<th>dangqianjiedian</th>
							<th>renwuchuangjianshijian</th>
							<th>liuchengzhuangtai</th>
							<th>caozuo</th>
                      	</tr>
                      </thead>
                      <tbody>
                      	<c:forEach items="${results}" var="leave">
                      		<c:set var="task" value="${leave.task }"/>
                      		<c:set var="pi" value="${leave.processInstance }"/>
                      		<tr id="${leave.id}" tid="${task.id}">
									<td>${leave.leaveType }</td>
									<td>${leave.userId }</td>
									<td>${leave.applyTime }</td>
									<td>${leave.startTime }</td>
									<td>${leave.endTime }</td>
									<td>dangqianjiedian</td>
									<td>${task.createTime }</td>
									<td>${pi.suspended }</td>
									<td>
										<c:if test="${empty task.assignee}">
										<a class="claim" href="#" onClick="claim('${task.id}')">qianshou</a>
										</c:if>
										<c:if test="${not empty task.assignee}">
										 <a tkey="${task.taskDefinitionKey}" tname="${task.name}" class="handle">banli</a>
										</c:if>
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