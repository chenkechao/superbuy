<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>main</title>
<!-- Widgets stylesheet -->
<link href="${ctx }/resources/style/widgets.css" rel="stylesheet">
<!-- Favicon -->
<link rel="shortcut icon"
	href="${ctx }/resources/img/favicon/favicon.png">
<style>
</style>
<script type="text/javascript">
	$(function() {
		var carousel = document.getElementById('carousel-example-generic');
		var hammer = new Hammer.Manager(carousel);
		var rotate = new Hammer.Swipe();
		hammer.add(rotate);
		hammer.on('swipeleft', function() {
			$('#carousel-example-generic').carousel('next');
		});
		hammer.on('swiperight', function() {
			$('#carousel-example-generic').carousel('prev');
		});

		//document.getElementById('btn-group-ul').style.marginLeft = '-800px';
		var btngroup = document.getElementById('btn-group');
		new Hammer(btngroup)
				.on(
						'swiperight',
						function(ev) {
							//alert(ev.deltaX);
							//document.getElementById('btn-group-ul').style.marginLeft += ev.deltaX* 0.4+'px';
							document.getElementById('btn-group-ul').style.webkitTransform = 'translate('
									+ ev.deltaX * 0.4 + 'px)';
						})
				.on(
						'swipeleft',
						function(ev) {
							//document.getElementById('btn-group-ul').style.marginLeft += ev.deltaX* 0.4+'px';
							document.getElementById('btn-group-ul').style.webkitTransform = 'translate('
									+ ev.deltaX * 0.4 + 'px)';
						});
	});
</script>
</head>

<body>
	<!-- Page heading -->
	<div class="page-head">
		<h2 class="pull-left">
			<i class="icon-home"></i> 首页
		</h2>

		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right">
			<a href="index.html"><i class="icon-home"></i> 首页</a>
			<!-- Divider -->
			<span class="divider">/</span> <a href="#" class="bread-current">控制台</a>
		</div>

		<div class="clearfix"></div>

	</div>
	<!-- Page heading ends -->

	<div class="container">
		<div class="container">
			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>
				<!-- wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img alt="" src="${ctx}/resources/img/carousel_1.jpg">
						<div class="carousel-caption"></div>
					</div>
					<div class="item">
						<img alt="" src="${ctx}/resources/img/carousel_2.jpg">
						<div class="carousel-caption"></div>
					</div>
					<div class="item">
						<img alt="" src="${ctx}/resources/img/carousel_3.jpg">
						<div class="carousel-caption"></div>
					</div>
				</div>

				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>

		<!-- wrapper for slides -->
		<div id="btn-group" class="btn-group">
			<ul id="btn-group-ul">
				<li><img style="wdith: 70px; height: 70px" alt=""
					src="${ctx }/resources/img/btn_group/btn_group_1.png"
					onClick="frameSrcChange('${ctx}/security/user')"></li>
				<li><img style="wdith: 70px; height: 70px" alt=""
					src="${ctx }/resources/img/btn_group/btn_group_2.png"></li>
				<li><img style="wdith: 70px; height: 70px" alt=""
					src="${ctx }/resources/img/btn_group/btn_group_3.png"></li>
				<li><img style="wdith: 70px; height: 70px" alt=""
					src="${ctx }/resources/img/btn_group/btn_group_4.png"></li>
				<li><img style="wdith: 60px; height: 70px" alt=""
					src="${ctx }/resources/img/btn_group/btn_group_5.png"></li>
				<li><img style="wdith: 60px; height: 70px" alt=""
					src="${ctx }/resources/img/btn_group/btn_group_6.png"></li>
				<li><img style="wdith: 60px; height: 70px" alt=""
					src="${ctx }/resources/img/btn_group/btn_group_7.png"></li>
				<li><img style="wdith: 60px; height: 70px" alt=""
					src="${ctx }/resources/img/btn_group/btn_group_8.png"></li>
				<li><img style="wdith: 60px; height: 70px" alt=""
					src="${ctx }/resources/img/btn_group/btn_group_9.png"></li>
				<li><img style="wdith: 60px; height: 70px" alt=""
					src="${ctx }/resources/img/btn_group/btn_group_10.png"></li>
				<li><img style="wdith: 60px; height: 70px" alt=""
					src="${ctx }/resources/img/btn_group/btn_group_11.png"></li>
				<li><img style="wdith: 60px; height: 70px" alt=""
					src="${ctx }/resources/img/btn_group/btn_group_12.png"></li>
				<li><img style="wdith: 60px; height: 70px" alt=""
					src="${ctx }/resources/img/btn_group/btn_group_13.png"></li>
			</ul>
		</div>

		<!-- Dashboard Graph starts -->
		<div class="row">
			<div class="col-md-8">

				<!-- Widget -->
				<div class="widget">
					<!-- Widget head -->
					<div class="widget-head">
						<div class="pull-left">图表</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i
								class="glyphicon glyphicon-chevron-up"></i></a> <a href="#"
								class="wclose"><i class="glyphicon glyphicon-remove"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>

					<!-- Widget content -->
					<div class="widget-content">
						<div class="padd">
							<canvas id="lineChart"></canvas>
						</div>
					</div>
					<!-- Widget ends -->

				</div>
			</div>

			<div class="col-md-4">

				<div class="widget">

					<div class="widget-head">
						<div class="pull-left">今天统计</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i
								class="glyphicon glyphicon-chevron-up"></i></a> <a href="#"
								class="wclose"><i class="glyphicon glyphicon-remove"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="widget-content">
						<div class="padd">
							<!-- Visitors, pageview, bounce rate, etc., Sparklines plugin used -->
							<ul class="current-status">
								<li><span id="status1"></span> <span class="bold">Visits
										: 2000</span></li>
								<li><span id="status2"></span> <span class="bold">Unique
										Visitors : 1,345</span></li>
								<li><span id="status3"></span> <span class="bold">Pageviews
										: 2000</span></li>
								<li><span id="status4"></span> <span class="bold">Pages
										/ Visit : 2000</span></li>
								<li><span id="status5"></span> <span class="bold">Avg.
										Visit Duration : 2000</span></li>
								<li><span id="status6"></span> <span class="bold">Bounce
										Rate : 2000</span></li>
								<li><span id="status7"></span> <span class="bold">%
										New Visits : 2000</span></li>
							</ul>
						</div>
					</div>

				</div>

			</div>
		</div>

		<!-- Chats, File upload and Recent Comments -->
		<div class="row">
			<div class="col-md-4">
				<!-- Widget -->
				<div class="widget">
					<!-- Widget title -->
					<div class="widget-head">
						<div class="pull-left">图表</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i
								class="glyphicon glyphicon-chevron-up"></i></a> <a href="#"
								class="wclose"><i class="glyphicon glyphicon-remove"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="widget-content">
						<!-- Widget content -->
						<div class="padd">
							<ul class="chats">
								<!-- Chat by us. Use the class "by-me". -->
								<li class="by-me">
									<!-- Use the class "pull-left" in avatar -->
									<div class="avatar pull-left">
										<img src="${ctx }/resources/img/user.jpg" alt="" />
									</div>
									<div class="chat-content">
										<!-- In meta area, first include "name" and then "time" -->
										<div class="chat-meta">
											Ashok <span class="pull-right">3 hours ago</span>
										</div>
										Vivamus diam elit diam, consectetur dapibus adipiscing elit.
										<div class="clearfix"></div>
									</div>
								</li>
								<!-- Chat by other. Use the class "by-other". -->
								<li class="by-other">
									<!-- Use the class "pull-right" in avatar -->
									<div class="avatar pull-right">
										<img src="${ctx }/resources/img/user.jpg" alt="" />
									</div>

									<div class="chat-content">
										<!-- In the chat meta, first include "time" then "name" -->
										<div class="chat-meta">
											3 hours ago <span class="pull-right">Ravi</span>
										</div>
										Vivamus diam elit diam, consectetur fconsectetur dapibus
										adipiscing elit.
										<div class="clearfix"></div>
									</div>
								</li>
								<li class="by-me">
									<div class="avatar pull-left">
										<img src="${ctx }/resources/img/user.jpg" alt="" />
									</div>
									<div class="chat-content">
										<div class="chat-meta">
											Ashok <span class="pull-right">4 hours ago</span>
										</div>
										Vivamus diam elit diam, consectetur fermentum sed dapibus
										eget, Vivamus consectetur dapibus adipiscing elit.
										<div class="clearfix"></div>
									</div>
								</li>
								<li class="by-other">
									<!-- Use the class "pull-right" in avatar -->
									<div class="avatar pull-right">
										<img src="${ctx }/resources/img/user.jpg" alt="" />
									</div>
									<div class="chat-content">
										<!-- In the chat meta, first include "time" then "name" -->
										<div class="chat-meta">
											3 hours ago <span class="pull-right">Ravi</span>
										</div>
										Vivamus diam elit diam, consectetur fermentum sed dapibus
										eget, Vivamus consectetur dapibus adipiscing elit.
										<div class="clearfix"></div>
									</div>
								</li>
							</ul>
						</div>
						<!-- Widget footer -->
						<div class="widget-foot">
							<form class="form-inline">
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="Type your message here...">
								</div>
								<button type="submit" class="btn btn-primary">Send</button>
							</form>
						</div>
					</div>
				</div>
			</div>

			<!-- File Upload widget -->
			<div class="col-md-4">
				<div class="widget">
					<!-- Widget title -->
					<div class="widget-head">
						<div class="pull-left">文件上传</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i
								class="glyphicon glyphicon-chevron-up"></i></a> <a href="#"
								class="wclose"><i class="glyphicon glyphicon-remove"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="widget-content">
						<!-- Widget content -->
						<ul class="file-upload">
							<li><strong><i class="icon-upload-alt"></i>
									File_Name_Here.Mp3</strong>
								<div class="file-meta">3.3 of 5MB - 5 mins - 1MB/Sec</div>
								<div class="progress progress-animated progress-striped">
									<div class="progress-bar progress-bar-success"
										data-percentage="100">
										<span class="sr-only">100 % completed</span>
									</div>
								</div></li>
							<li><strong><i class="icon-ok"></i>
									Third_File_Here.Mp3</strong>
								<div class="file-meta">5MB - 5 mins - Stopped</div></li>
							<li><strong><i class="icon-ok"></i>
									Third_File_Here.Mp3</strong>
								<div class="file-meta">5MB - 5 mins - Stopped</div></li>
						</ul>
						<div class="widget-foot"></div>
					</div>
				</div>
				<div class="widget">
					<!-- Widget title -->
					<div class="widget-head">
						<div class="pull-left">浏览器统计</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i
								class="glyphicon glyphicon-chevron-up"></i></a> <a href="#"
								class="wclose"><i class="glyphicon glyphicon-remove"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="widget-content referrer">
						<!-- Widget content -->
						<table class="table table-striped table-bordered table-hover">
							<tr>
								<th><center>#</center></th>
								<th>Browsers</th>
								<th>Visits</th>
							</tr>
							<tr>
								<td><img src="${ctx }/resources/img/icons/chrome.png"
									alt="" />
								<td>Google Chrome</td>
								<td>3,005</td>
							</tr>
							<tr>
								<td><img src="${ctx }/resources/img/icons/firefox.png"
									alt="" />
								<td>Mozilla Firefox</td>
								<td>2,505</td>
							</tr>
							<tr>
								<td><img src="${ctx }/resources/img/icons/ie.png" alt="" />
								<td>Internet Explorer</td>
								<td>1,405</td>
							</tr>
							<tr>
								<td><img src="${ctx }/resources/img/icons/opera.png" alt="" />
								<td>Opera</td>
								<td>4,005</td>
							</tr>
							<tr>
								<td><img src="${ctx }/resources/img/icons/safari.png"
									alt="" />
								<td>Safari</td>
								<td>505</td>
							</tr>
						</table>
						<div class="widget-foot"></div>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<!-- Widget -->
				<div class="widget">
					<!-- Widget title -->
					<div class="widget-head">
						<div class="pull-left">最近评论</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i
								class="glyphicon glyphicon-chevron-up"></i></a> <a href="#"
								class="wclose"><i class="glyphicon glyphicon-remove"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="widget-content">
						<!-- Widget content -->
						<div class="padd">
							<ul class="recent">
								<li>
									<div class="recent-content">
										<div class="recent-meta">Posted on 25/1/2120 by Ashok</div>
										<div>Vivamus diam elit diam, consectetur fermentum sed
											dapibus eget, Vivamus consectetur dapibus adipiscing elit.</div>
										<div class="btn-group">
											<button class="btn btn-xs btn-default">
												<i class="glyphicon glyphicon-ok"></i>
											</button>
											<button class="btn btn-xs btn-default">
												<i class="glyphicon glyphicon-pencil"></i>
											</button>
											<button class="btn btn-xs btn-default">
												<i class="glyphicon glyphicon-remove"></i>
											</button>
										</div>
										<button class="btn btn-xs btn-danger pull-right">Spam</button>
										<div class="clearfix"></div>
									</div>
								</li>
								<li>
									<div class="recent-content">
										<div class="recent-meta">Posted on 25/1/2120 by Ashok</div>
										<div>Vivamus diam elit diam, consectetur fermentum sed
											dapibus eget, Vivamus consectetur dapibus adipiscing elit.</div>

										<div class="btn-group">
											<button class="btn btn-xs btn-default">
												<i class="icon-ok"></i>
											</button>
											<button class="btn btn-xs btn-default">
												<i class="icon-pencil"></i>
											</button>
											<button class="btn btn-xs btn-default">
												<i class="icon-remove"></i>
											</button>
										</div>

										<button class="btn btn-xs btn-danger pull-right">Spam</button>
										<div class="clearfix"></div>
									</div>
								</li>

								<li>
									<div class="recent-content">
										<div class="recent-meta">Posted on 25/1/2120 by Ashok</div>
										<div>Vivamus diam elit diam, consectetur fermentum sed
											dapibus eget, Vivamus consectetur dapibus adipiscing elit.</div>
										<div class="btn-group">
											<button class="btn btn-xs btn-default">
												<i class="icon-ok"></i>
											</button>
											<button class="btn btn-xs btn-default">
												<i class="icon-pencil"></i>
											</button>
											<button class="btn btn-xs btn-default">
												<i class="icon-remove"></i>
											</button>
										</div>
										<button class="btn btn-xs btn-danger pull-right">Spam</button>
										<div class="clearfix"></div>
									</div>
								</li>
							</ul>
						</div>
						<!-- Widget footer -->
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
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="widget wblack">
					<div class="widget-head">
						<div class="pull-left">黑色图表</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i
								class="glyphicon glyphicon-chevron-up"></i></a> <a href="#"
								class="wclose"><i class="glyphicon glyphicon-remove"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="widget-content">
						<div class="padd">
							<canvas id="barChart"></canvas>
						</div>
						<div class="widget-foot">
							<!-- Footer goes here -->
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="widget">
					<div class="widget-head">
						<div class="pull-left">快速提交</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i
								class="glyphicon glyphicon-chevron-up"></i></a> <a href="#"
								class="wclose"><i class="glyphicon glyphicon-remove"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="widget-content">
						<div class="padd">

							<div class="form quick-post">
								<!-- Edit profile form (not working)-->
								<form class="form-horizontal">
									<!-- Title -->
									<div class="form-group">
										<label class="control-label col-lg-3" for="title">Title</label>
										<div class="col-lg-9">
											<input type="text" class="form-control" id="title">
										</div>
									</div>
									<!-- Content -->
									<div class="form-group">
										<label class="control-label col-lg-3" for="content">Content</label>
										<div class="col-lg-9">
											<textarea class="form-control" id="content"></textarea>
										</div>
									</div>
									<!-- Cateogry -->
									<div class="form-group">
										<label class="control-label col-lg-3">Category</label>
										<div class="col-lg-9">
											<select class="form-control">
												<option value="">- Choose Cateogry -</option>
												<option value="1">General</option>
												<option value="2">News</option>
												<option value="3">Media</option>
												<option value="4">Funny</option>
											</select>
										</div>
									</div>
									<!-- Tags -->
									<div class="form-group">
										<label class="control-label col-lg-3" for="tags">Tags</label>
										<div class="col-lg-9">
											<input type="text" class="form-control" id="tags">
										</div>
									</div>

									<!-- Buttons -->
									<div class="form-group">
										<!-- Buttons -->
										<div class="col-lg-offset-2 col-lg-9">
											<button type="submit" class="btn btn-success">Publish</button>
											<button type="submit" class="btn btn-danger">Save
												Draft</button>
											<button type="reset" class="btn btn-default">Reset</button>
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

	<script src="${ctx }/resources/js/excanvas.min.js"></script>
	<script src="${ctx }/resources/js/Chart.js"></script>

	<!-- jQuery Notification - Noty -->
	<script src="${ctx }/resources/js/jquery.noty.js"></script>
	<!-- jQuery Notify -->
	<script src="${ctx }/resources/js/themes/default.js"></script>
	<!-- jQuery Notify -->
	<script src="${ctx }/resources/js/layouts/bottom.js"></script>
	<!-- jQuery Notify -->
	<script src="${ctx }/resources/js/layouts/topRight.js"></script>
	<!-- jQuery Notify -->
	<script src="${ctx }>/resources/js/layouts/top.js"></script>
	<!-- jQuery Notify -->
	<!-- jQuery Notification ends -->

	<script src="${ctx }/resources/js/sparklines.js"></script>
	<!-- Sparklines -->
	<script src="${ctx }/resources/js/filter.js"></script>
	<!-- Filter for support page -->
	<script src="${ctx }/resources/js/charts.js"></script>
	<!-- Charts & Graphs -->
	<!-- Script for this page -->
	<script type="text/javascript">
		$(function() {
			var lineChartData = {
				labels : [ "January", "February", "March", "April", "May",
						"June", "July" ],
				datasets : [ {
					fillColor : "rgba(220,220,220,0.5)",
					strokeColor : "rgba(220,220,220,1)",
					pointColor : "rgba(220,220,220,1)",
					pointStrokeColor : "#fff",
					data : [ 65, 59, 90, 81, 56, 55, 40 ]
				}, {
					fillColor : "rgba(151,187,205,0.5)",
					strokeColor : "rgba(151,187,205,1)",
					pointColor : "rgba(151,187,205,1)",
					pointStrokeColor : "#fff",
					data : [ 28, 48, 40, 19, 96, 27, 100 ]
				} ]
			}

			/* Bar Chart starts */
			var barChartData = {
				labels : [ "January", "February", "March", "April", "May",
						"June", "July" ],
				datasets : [ {
					fillColor : "rgba(220,220,220,0.5)",
					strokeColor : "rgba(220,220,220,1)",
					data : [ 65, 59, 90, 81, 56, 55, 40 ]
				}, {
					fillColor : "rgba(151,187,205,0.5)",
					strokeColor : "rgba(151,187,205,1)",
					data : [ 28, 48, 40, 19, 96, 27, 100 ]
				} ]
			}

			var lineCharContext = $("#lineChart").get(0).getContext("2d");
			new Chart(lineCharContext).Line(lineChartData, {
				responsive : true
			});

			var barCharContext = $("#barChart").get(0).getContext("2d");
			new Chart(barCharContext).Line(barChartData, {
				responsive : true
			});
		});

		/* Curve chart starts */

		$(function() {
			var sin = [], cos = [];
			for (var i = 0; i < 14; i += 0.5) {
				sin.push([ i, Math.sin(i) ]);
				cos.push([ i, Math.cos(i) ]);
			}

			function showTooltip(x, y, contents) {
				$('<div id="tooltip">' + contents + '</div>').css({
					position : 'absolute',
					display : 'none',
					top : y + 5,
					left : x + 5,
					border : '1px solid #000',
					padding : '2px 8px',
					color : '#ccc',
					'background-color' : '#000',
					opacity : 0.9
				}).appendTo("body").fadeIn(200);
			}
		});

		/* Curve chart ends */
	</script>
</body>
</html>