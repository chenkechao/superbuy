<!DOCTYPE html>
<html>
    <head>
        <title>Welcome to the Spring MVC Quickstart application! Get started quickly by signing up!</title>
        <%@include file="/common/include.jsp"%>
    </head>
    <body>
    	<div class="navbar navbar-default navbar-static-top">
    	    <div class="container">
	    	    <div class="navbar-header">
		    	    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".nav-collapse">
		                <span class="icon-bar"></span>
		                <span class="icon-bar"></span>
		                <span class="icon-bar"></span>
		            </button>
	                <a class="navbar-brand" href="index.html">SpAdmin</a>
	            </div>
	            <div class="navbar-collapse collapse">
	                <ul class="nav navbar-nav">
	                    <li><a href="#"><i class="icon-reorder"></i></a></li>
	                    <li class="dropdown">
	                        <a  class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-user"></i></a>
	                        <ul class="dropdown-menu">
	                            <li>
	                                <div class="container-fluid">
	                                    <div class="row-fluid">
	                                        <div class="media">
											    <div class="media-left">
											        <a href="#">
											            <img class="media-object" src="<%=request.getContextPath()%>/resources/img/bruce.jpg" alt="...">
											        </a>
											    </div>
											    <div class="media-body">
											        <h4 class="media-heading">Media heading</h4>
											        fdas
											    </div>
											</div>
	                                    </div>
	                                    <!-- End Row -->
	                                    <div class="row-fluid sales">
	                                        <div class="span12 well">
	                                            <div class="row-fluid">
	                                                <div class="border-right span6">
	                                                    <p class="text-center">销售: $800</p>
	                                                </div>
	                                                <div class="span6">
	                                                    <p class="text-center">用户: 1267</p>
	                                                </div>
	                                            </div>
	                                            <!-- End Row -->
	                                        </div>
	                                    </div>
	                                    <!-- End Row -->
	                                </div>
	                                <!-- End Container -->
	                            </li>
	                        </ul>
	                    </li>
	                    <li class="dropdown">
	                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">提示 <span class="top-alert vibrate"><span class="arrow"></span>4</span></a>
	                        <ul class="dropdown-menu">
	                            <li>
	                                <a href="#">
	                                    <p class="padding"><img class="pull-left picture" src="<%=request.getContextPath()%>/resources/img/flat_icons/message.png" width="30" alt="" /><small>第一条提示信息查看</small></p>
	                                    <p><small class="muted"><i class="icon-user"></i> Stan Smith<span class="pull-right"><i class="icon-time"></i>2小时以前</span></small></p>
	                                </a>
	                            </li>
	                            <li>
	                                <a href="#">
	                                    <p class="padding"><img class="pull-left picture" src="<%=request.getContextPath()%>/resources/img/flat_icons/calendar.png" width="30" alt="" /><small>第一条提示信息查看<span class="text-warning">两天以前</span> time at 6pm</small></p>
	                                </a>
	                            </li>
	                            <li>
	                                <a href="#">
	                                    <p class="padding"><img class="pull-left picture" src="<%=request.getContextPath()%>/resources/img/flat_icons/charts.png" width="30" alt="" /><small>第一条提示信息查看<span class="text-success">15%</span> while others are up <span class="text-warning">2%</span></small></p>
	                                </a>
	                            </li>
	                            <li>
	                                <a href="#">
	                                    <p class="padding"><img class="pull-left picture" src="<%=request.getContextPath()%>/resources/img/flat_icons/cone.png" width="30" alt="" /><small><span class="text-error">事故发生了.</span> The cron needs your attention</small></p>
	                                </a>
	                            </li>
	                        </ul>
	                    </li>
	                </ul>
	                <form class="navbar-form navbar-right" role="search" action="">
	                        <div class="form-group">
	                            <input type="text" class="form-control" placeholder="Search">
	                        </div>
	                        <button type="submit" class="btn btn-default">提交</button>
	                </form>
	            </div>
	        </div>
        </div><!-- /.container -->
    </body>
</html>