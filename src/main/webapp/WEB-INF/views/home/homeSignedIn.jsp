<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <title>Bootstrap响应式后台管理系统模版Mac - JS代码网</title> 
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
  
  <!-- HTML5 Support for IE -->
  <!--[if lt IE 9]>
  <script src="js/html5shim.js"></script>
  <![endif]-->

  <!-- Favicon -->
  <link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/img/favicon/favicon.png">
  <script type="text/javascript">
      function processList(){
    	  $('#mainIframe').attr("src",'<%=request.getContextPath() %>/workflow/processList');
      }
      
      function runningList(){
    	  $.ajax({
    		  url:'<%=request.getContextPath() %>/workflow/processinstance/running',
    		  cache:false,
    		  dataType:"html",//
    		  success:function(data){
    			 $(".mainbar").html(data);
    		  }
    	  });
      }
      
      function modelList(){
    	  $.ajax({
    		  url:'<%=request.getContextPath() %>/workflow/model/list',
    		  cache:false,
    		  dataType:"html",//
    		  success:function(data){
    			 $(".mainbar").html(data);
    		  }
    	  });
      }
      
      function leaveApply() {
    	  $('#mainIframe').attr("src",'<%=request.getContextPath() %>/oa/leave/apply');
      }

      function taskList() {
    	  $('#mainIframe').attr("src",'<%=request.getContextPath() %>/oa/leave/list/task');
      }
  </script>
</head>

<body>

<div class="navbar navbar-fixed-top bs-docs-nav" role="banner">
  
    <div class="conjtainer">
      <!-- Menu button for smallar screens -->
      <div class="navbar-header">
		  <button class="navbar-toggle btn-navbar" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
			<span>菜单</span>
		  </button>
		  <!-- Site name for smallar screens -->
		  <a href="index.html" class="navbar-brand hidden-lg">首页</a>
		</div>
      
      

      <!-- Navigation starts -->
      <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">         

        <ul class="nav navbar-nav">  

          <!-- Upload to server link. Class "dropdown-big" creates big dropdown -->
          <li class="dropdown dropdown-big">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="label label-success"><i class="icon-cloud-upload"></i></span> 上传到云服务器</a>
            <!-- Dropdown -->
            <ul class="dropdown-menu">
              <li>
                <!-- Progress bar -->
                <p>图片上传进度</p>
                <!-- Bootstrap progress bar -->
                <div class="progress progress-striped active">
					<div class="progress-bar progress-bar-info"  role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
						<span class="sr-only">完成40%</span>
					</div>
			    </div>

                <hr />

                <!-- Progress bar -->
                <p>视频上传进度</p>
                <!-- Bootstrap progress bar -->
                <div class="progress progress-striped active">
					<div class="progress-bar progress-bar-success"  role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
						<span class="sr-only">完成80%</span>
					</div>
			    </div> 

                <hr />             

                <!-- Dropdown menu footer -->
                <div class="drop-foot">
                  <a href="#">查看所有</a>
                </div>

              </li>
            </ul>
          </li>

          <!-- Sync to server link -->
          <li class="dropdown dropdown-big">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="label label-danger"><i class="icon-refresh"></i></span> 同步到服务器</a>
            <!-- Dropdown -->
            <ul class="dropdown-menu">
              <li>
                <!-- Using "icon-spin" class to rotate icon. -->
                <p><span class="label label-info"><i class="icon-cloud"></i></span>同步会员到服务器</p>
                <hr />
                <p><span class="label label-warning"><i class="icon-cloud"></i></span>同步书签到云端</p>

                <hr />

                <!-- Dropdown menu footer -->
                <div class="drop-foot">
                  <a href="#">查看所有</a>
                </div>

              </li>
            </ul>
          </li>

        </ul>

        <!-- Search form -->
        <form class="navbar-form navbar-left" role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form>
        <!-- Links -->
        <ul class="nav navbar-nav pull-right">
          <li class="dropdown pull-right">            
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
              <i class="icon-user"></i>${user.id }<b class="caret"></b>              
            </a>
            
            <!-- Dropdown menu -->
            <ul class="dropdown-menu">
              <li><a href="#"><i class="icon-user"></i> ziliao</a></li>
              <li><a href="<%=request.getContextPath() %>/logout"><i class="icon-off"></i> logout</a></li>
              <li><a href="#"><i class="icon-cogs"></i> Settings</a></li>
            </ul>
          </li>
          
        </ul>
      </nav>

    </div>
  </div>


<!-- Header starts -->
  <header>
    <div class="container">
      <div class="row">

        <!-- Logo section -->
        <div class="col-md-4">
          <!-- Logo. -->
          <div class="logo">
            <h1><a href="#">Mac<span class="bold"></span></a></h1>
            <p class="meta">后台管理系统</p>
          </div>
          <!-- Logo ends -->
        </div>

        <!-- Button section -->
        <div class="col-md-4">

          <!-- Buttons -->
          <ul class="nav nav-pills">

            <!-- Comment button with number of latest comments count -->
            <li class="dropdown dropdown-big">
              <a class="dropdown-toggle" href="#" data-toggle="dropdown">
                <i class="icon-comments"></i> 聊天 <span   class="label label-info">6</span> 
              </a>

                <ul class="dropdown-menu">
                  <li>
                    <!-- Heading - h5 -->
                    <h5><i class="icon-comments"></i> 聊天</h5>
                    <!-- Use hr tag to add border -->
                    <hr />
                  </li>
                  <li>
                    <!-- List item heading h6 -->
                    <h6><a href="#">你好 :)</a> <span class="label label-warning pull-right">10:42</span></h6>
                    <div class="clearfix"></div>
                    <hr />
                  </li>
                  <li>
                    <h6><a href="#">你怎么样?</a> <span class="label label-warning pull-right">20:42</span></h6>
                    <div class="clearfix"></div>
                    <hr />
                  </li>
                  <li>
                    <h6><a href="#">你在干撒呢?</a> <span class="label label-warning pull-right">14:42</span></h6>
                    <div class="clearfix"></div>
                    <hr />
                  </li>                  
                  <li>
                    <div class="drop-foot">
                      <a href="#">查看所有</a>
                    </div>
                  </li>                                    
                </ul>
            </li>

            <!-- Message button with number of latest messages count-->
            <li class="dropdown dropdown-big">
              <a class="dropdown-toggle" href="#" data-toggle="dropdown">
                <i class="icon-envelope-alt"></i> 收件箱 <span class="label label-primary">6</span> 
              </a>

                <ul class="dropdown-menu">
                  <li>
                    <!-- Heading - h5 -->
                    <h5><i class="icon-envelope-alt"></i> 消息</h5>
                    <!-- Use hr tag to add border -->
                    <hr />
                  </li>
                  <li>
                    <!-- List item heading h6 -->
                    <h6><a href="#">你好啊?</a></h6>
                    <!-- List item para -->
                    <p>最近咋样啊...</p>
                    <hr />
                  </li>
                  <li>
                    <h6><a href="#">今天很好啊?</a></h6>
                    <p>相当好...</p>
                    <hr />
                  </li>
                  <li>
                    <div class="drop-foot">
                      <a href="#">查看所有</a>
                    </div>
                  </li>                                    
                </ul>
            </li>

            <!-- Members button with number of latest members count -->
            <li class="dropdown dropdown-big">
              <a class="dropdown-toggle" href="#" data-toggle="dropdown">
                <i class="icon-user"></i> 用户 <span   class="label label-success">6</span> 
              </a>

                <ul class="dropdown-menu">
                  <li>
                    <!-- Heading - h5 -->
                    <h5><i class="icon-user"></i> 用户</h5>
                    <!-- Use hr tag to add border -->
                    <hr />
                  </li>
                  <li>
                    <!-- List item heading h6-->
                    <h6><a href="#">Ravi Kumar</a> <span class="label label-warning pull-right">免费</span></h6>
                    <div class="clearfix"></div>
                    <hr />
                  </li>
                  <li>
                    <h6><a href="#">Balaji</a> <span class="label label-important pull-right">高级</span></h6>
                    <div class="clearfix"></div>
                    <hr />
                  </li>
                  <li>
                    <h6><a href="#">Kumarasamy</a> <span class="label label-warning pull-right">免费</span></h6>
                    <div class="clearfix"></div>
                    <hr />
                  </li>                  
                  <li>
                    <div class="drop-foot">
                      <a href="#">查看所有</a>
                    </div>
                  </li>                                    
                </ul>
            </li> 

          </ul>

        </div>

        <!-- Data section -->

        <div class="col-md-4">
          <div class="header-data">

            <!-- Traffic data -->
            <div class="hdata">
              <div class="mcol-left">
                <!-- Icon with red background -->
                <i class="icon-signal bred"></i> 
              </div>
              <div class="mcol-right">
                <!-- Number of visitors -->
                <p><a href="#">7000</a> <em>访问</em></p>
              </div>
              <div class="clearfix"></div>
            </div>

            <!-- Members data -->
            <div class="hdata">
              <div class="mcol-left">
                <!-- Icon with blue background -->
                <i class="icon-user bblue"></i> 
              </div>
              <div class="mcol-right">
                <!-- Number of visitors -->
                <p><a href="#">3000</a> <em>用户</em></p>
              </div>
              <div class="clearfix"></div>
            </div>

            <!-- revenue data -->
            <div class="hdata">
              <div class="mcol-left">
                <!-- Icon with green background -->
                <i class="icon-money bgreen"></i> 
              </div>
              <div class="mcol-right">
                <!-- Number of visitors -->
                <p><a href="#">5000</a><em>订单</em></p>
              </div>
              <div class="clearfix"></div>
            </div>                        

          </div>
        </div>

      </div>
    </div>
  </header>

<!-- Header ends -->

<!-- Main content starts -->

<div class="content">

  	<!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-dropdown"><a href="#">导航</a></div>

        <!--- Sidebar navigation -->
        <!-- If the main navigation has sub navigation, then add the class "has_sub" to "li" of main navigation. -->
        <ul id="nav">
          <!-- Main menu with font awesome icon -->
          <li><a href="index.html" class="open"><i class="icon-home"></i> 首页</a>
            <!-- Sub menu markup 
            <ul>
              <li><a href="#">Submenu #1</a></li>
              <li><a href="#">Submenu #2</a></li>
              <li><a href="#">Submenu #3</a></li>
            </ul>-->
          </li>
          <li class="has_sub"><a href="#"><i class="icon-list-alt"></i> 请假  <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
            <ul>
              <li><a href="#" onClick="leaveApply()">请假申请(普通)</a></li>
              <li><a href="#" onClick="taskList()">请假办理(普通)</a></li>
              <li><a href="widgets3.html">运行中流程(普通)</a></li>
              <li><a href="widgets3.html">已结束流程(普通)</a></li>
            </ul>
          </li>  
          <li class="has_sub"><a href="#"><i class="icon-file-alt"></i>动态表单 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
            <ul>
              <li><a href="post.html">流程列表(动态)</a></li>
              <li><a href="login.html">登录页</a></li>
              <li><a href="register.html">任务列表(动态)</a></li>
              <li><a href="support.html">运行中流程表(动态)</a></li>
              <li><a href="invoice.html">已结束流程(动态)</a></li>
            </ul>
          </li> 
          <li class="has_sub"><a href="#"><i class="icon-file-alt"></i> 外置表单  <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
            <ul>
              <li><a href="media.html">流程列表(外置)</a></li>
              <li><a href="statement.html">任务列表(外置)</a></li>
              <li><a href="error.html">运行中流程表(外置)</a></li>
              <li><a href="error-log.html">已结束流程(外置)</a></li>
            </ul>
          </li>    
          <li class="has_sub"><a href="#"><i class="icon-file-alt"></i>综合流程  <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
            <ul>
              <li><a href="media.html">流程列表</a></li>
              <li><a href="statement.html">任务列表(综合)</a></li>
              <li><a href="error.html">运行中流程表(综合)</a></li>
              <li><a href="error-log.html">已结束流程(综合)</a></li>
            </ul>
          </li>
          <li class="has_sub"><a href="#"><i class="icon-file-alt"></i>流程管理  <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
            <ul>
              <li><a href="#" onClick="processList()">流程定义及部署管理</a></li>
              <li><a href="#" onClick="runningList()">运行中流程</a></li>
              <li><a href="#" onCLick="modelList()">模型工作区</a></li>
            </ul>
          </li>                                     
        </ul>
    </div>

    <!-- Sidebar ends -->




<iframe id="mainIframe" name="mainIframe" src="<%=request.getContextPath()%>/main" scrolling="no" frameborder="0" style="width:100%;height:100%;"></iframe>

   <!-- Mainbar ends -->
   <div class="clearfix"></div>

</div>
<!-- Content ends -->

<!-- Footer starts -->
<footer>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
            <!-- Copyright info -->
            <p class="copy">Copyright &copy; 2012 | <a href="#">Your Site</a> </p>
      </div>
    </div>
  </div>
</footer> 	

<!-- Footer ends -->

<!-- Scroll to top -->
<span class="totop"><a href="#"><i class="icon-chevron-up"></i></a></span> 

<!-- JS -->
<script src="<%=request.getContextPath() %>/resources/js/jquery.js"></script> <!-- jQuery -->
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

<!-- Script for this page -->
<script type="text/javascript">
$(function () {

    /* Bar Chart starts */

    var d1 = [];
    for (var i = 0; i <= 20; i += 1)
        d1.push([i, parseInt(Math.random() * 30)]);

    var d2 = [];
    for (var i = 0; i <= 20; i += 1)
        d2.push([i, parseInt(Math.random() * 30)]);


    var stack = 0, bars = true, lines = false, steps = false;
    
    function plotWithOptions() {
        $.plot($("#bar-chart"), [ d1, d2 ], {
            series: {
                stack: stack,
                lines: { show: lines, fill: true, steps: steps },
                bars: { show: bars, barWidth: 0.8 }
            },
            grid: {
                borderWidth: 0, hoverable: true, color: "#777"
            },
            colors: ["#ff6c24", "#ff2424"],
            bars: {
                  show: true,
                  lineWidth: 0,
                  fill: true,
                  fillColor: { colors: [ { opacity: 0.9 }, { opacity: 0.8 } ] }
            }
        });
    }

    plotWithOptions();
    
    $(".stackControls input").click(function (e) {
        e.preventDefault();
        stack = $(this).val() == "With stacking" ? true : null;
        plotWithOptions();
    });
    $(".graphControls input").click(function (e) {
        e.preventDefault();
        bars = $(this).val().indexOf("Bars") != -1;
        lines = $(this).val().indexOf("Lines") != -1;
        steps = $(this).val().indexOf("steps") != -1;
        plotWithOptions();
    });

    /* Bar chart ends */

});


/* Curve chart starts */

$(function () {
    var sin = [], cos = [];
    for (var i = 0; i < 14; i += 0.5) {
        sin.push([i, Math.sin(i)]);
        cos.push([i, Math.cos(i)]);
    }

    var plot = $.plot($("#curve-chart"),
           [ { data: sin, label: "sin(x)"}, { data: cos, label: "cos(x)" } ], {
               series: {
                   lines: { show: true, fill: true},
                   points: { show: true }
               },
               grid: { hoverable: true, clickable: true, borderWidth:0 },
               yaxis: { min: -1.2, max: 1.2 },
               colors: ["#1eafed", "#1eafed"]
             });

    function showTooltip(x, y, contents) {
        $('<div id="tooltip">' + contents + '</div>').css( {
            position: 'absolute',
            display: 'none',
            top: y + 5,
            left: x + 5,
            border: '1px solid #000',
            padding: '2px 8px',
            color: '#ccc',
            'background-color': '#000',
            opacity: 0.9
        }).appendTo("body").fadeIn(200);
    }

    var previousPoint = null;
    $("#curve-chart").bind("plothover", function (event, pos, item) {
        $("#x").text(pos.x.toFixed(2));
        $("#y").text(pos.y.toFixed(2));

        if ($("#enableTooltip:checked").length > 0) {
            if (item) {
                if (previousPoint != item.dataIndex) {
                    previousPoint = item.dataIndex;
                    
                    $("#tooltip").remove();
                    var x = item.datapoint[0].toFixed(2),
                        y = item.datapoint[1].toFixed(2);
                    
                    showTooltip(item.pageX, item.pageY, 
                                item.series.label + " of " + x + " = " + y);
                }
            }
            else {
                $("#tooltip").remove();
                previousPoint = null;            
            }
        }
    }); 

    $("#curve-chart").bind("plotclick", function (event, pos, item) {
        if (item) {
            $("#clickdata").text("You clicked point " + item.dataIndex + " in " + item.series.label + ".");
            plot.highlight(item.series, item.datapoint);
        }
    });

});


$("#mainIframe").load(function(){
	var mainheight = $(this).contents().find("body").height()+30;
	$(this).height(mainheight);
}); 
/* Curve chart ends */
</script>

<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
					<h4 class="modal-title">Modal title</h4>
				</div>
				<div class="modal-body">
					<table id="view-info" class="table table-striped table-bordered table-hover">
						<tr>
							<td width="100">shengqingren:</td>
							<td name="userId"></td>
						</tr>
						<tr>
							<td>jiazhong:</td>
							<td name="leaveType"></td>
						</tr>
						<tr>
							<td>shengqingshijian:</td>
							<td name="applyTime"></td>
						</tr>
						<tr>
							<td>qingjia<font color="red">kaishi</font>shijian:</td>
							<td name="startTime"></td>
						</tr>
						<tr>
							<td>qingjia<font color="red">jieshu</font>shijian:</td>
							<td name="endTime"></td>
						</tr>
						<tr>
							<td>qingjiashiyou:</td>
							<td name="reason"></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
					<button id="savebtn" type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>