<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>superbuy</title>
<%@include file="/common/meta.jsp"%>

<!-- Favicon -->
<link rel="shortcut icon"
	href="${ctx }/resources/img/favicon/favicon.png">
<script type="text/javascript">
	$(function() {
		frameSrcChange("${ctx}/main");
	});

	function frameSrcChange(url) {
		$("main").load(url);
	}

	$(function() {
		var PullToRefresh = (function() {
			function Main(container, slidebox, slidebox_icon, handler) {
				var self = this;

				this.breakpoint = 80;

				this.container = container;
				this.slidebox = slidebox;
				this.slidebox_icon = slidebox_icon;
				this.handler = handler;

				this._slidedown_height = 0;
				this._anim = null;
				this._dragged_down = false;
				this.hummer = new Hammer(this.container).on(
						"pandown panstart panend", function(ev) {
							self.handleHammer(ev);
						});
			}
			;

			/**
			 * Handle HammerJS callback
			 * @param ev
			 */
			Main.prototype.handleHammer = function(ev) {
				var self = this;

				switch (ev.type) {
				// reset element on start
				case 'panstart':
					this.hide();
					break;

				// on release we check how far we dragged
				case 'panend':
					if (!this._dragged_down) {
						return;
					}

					// cancel animation
					cancelAnimationFrame(this._anim);
					// over the breakpoint, trigger the callback
					if (ev.deltaY >= this.breakpoint) {
						container_el.className = 'pullrefresh-loading';
						pullrefresh_icon_el.className = 'icon loading';

						this.setHeight(60);
						this.handler.call(this);
					}
					// just hide it
					else {
						pullrefresh_el.className = 'slideup';
						container_el.className = 'pullrefresh-slideup';

						this.hide();
					}
					break;

				// when we dragdown
				case 'pandown':
					this._dragged_down = true;

					// if we are not at the top move down
					var scrollY = window.scrollY;
					if (scrollY > 5) {
						return;
					} else if (scrollY !== 0) {
						window.scrollTo(0, 0);
					}

					// no requestAnimationFrame instance is running, start one
					if (!this._anim) {
						this.updateHeight();
					}

					// stop browser scrolling
					//ev.gesture.preventDefault();

					// update slidedown height
					// it will be updated when requestAnimationFrame is called
					this._slidedown_height = ev.deltaY * 0.4;
					break;
				}
			};

			/**
			 * when we set the height, we just change the container y
			 * @param {Number} height
			 */
			Main.prototype.setHeight = function(height) {
				if (Modernizr.csstransforms3d) {
					this.container.style.transform = 'translate3d(0,' + height
							+ 'px,0) ';
					this.container.style.oTransform = 'translate3d(0,' + height
							+ 'px,0)';
					this.container.style.msTransform = 'translate3d(0,'
							+ height + 'px,0)';
					this.container.style.mozTransform = 'translate3d(0,'
							+ height + 'px,0)';
					this.container.style.webkitTransform = 'translate3d(0,'
							+ height + 'px,0) scale3d(1,1,1)';
				} else if (Modernizr.csstransforms) {
					this.container.style.transform = 'translate(0,' + height
							+ 'px) ';
					this.container.style.oTransform = 'translate(0,' + height
							+ 'px)';
					this.container.style.msTransform = 'translate(0,' + height
							+ 'px)';
					this.container.style.mozTransform = 'translate(0,' + height
							+ 'px)';
					this.container.style.webkitTransform = 'translate(0,'
							+ height + 'px)';
				} else {
					this.container.style.top = height + "px";
				}
			};

			/**
			 * hide the pullrefresh message and reset the vars
			 */
			Main.prototype.hide = function() {
				container_el.className = '';
				this._slidedown_height = 0;
				this.setHeight(0);
				cancelAnimationFrame(this._anim);
				this._anim = null;
				this._dragged_down = false;
			};

			/**
			 * hide the pullrefresh message and reset the vars
			 */
			Main.prototype.slideUp = function() {
				var self = this;
				cancelAnimationFrame(this._anim);

				pullrefresh_el.className = 'slideup';
				container_el.className = 'pullrefresh-slideup';

				this.setHeight(0);

				setTimeout(function() {
					self.hide();
				}, 500);
			};

			/**
			 * update the height of the slidedown message
			 */
			Main.prototype.updateHeight = function() {
				var self = this;

				this.setHeight(this._slidedown_height);

				if (this._slidedown_height >= this.breakpoint) {
					this.slidebox.className = 'breakpoint';
					this.slidebox_icon.className = 'icon arrow arrow-up';
				} else {
					this.slidebox.className = '';
					this.slidebox_icon.className = 'icon arrow';
				}

				this._anim = requestAnimationFrame(function() {
					self.updateHeight();
				});
			};

			return Main;
		})();

		function getEl(id) {
			return document.getElementById(id);
		}

		var container_el = document.getElementsByTagName('body')[0];
		var pullrefresh_el = getEl('pullrefresh');
		var pullrefresh_icon_el = getEl('pullrefresh-icon');
		var image_el = getEl('random-image');

		var refresh = new PullToRefresh(container_el, pullrefresh_el,
				pullrefresh_icon_el);

		// update image onrefresh
		refresh.handler = function() {
			var self = this;
			// a small timeout to demo the loading state
			setTimeout(function() {
				var preload = new Image();
				preload.onload = function() {
					image_el.src = this.src;
					self.slideUp();
				};
				preload.src = 'http://lorempixel.com/300/200/?'
						+ (new Date().getTime());
			}, 1000);
		};
	});
</script>
</head>

<body>
	<nav class="navbar navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button class="navbar-toggle btn-navbar" type="button"
					data-toggle="collapse" data-target=".navbar-collapse"
					aria-expanded="false">
					<!-- <span class="glyphicon glyphicon-user"></span> -->
					<span class="icon-menu-hamburger"></span>
				</button>
				<a href="index.html" class="navbar-brand hidden-lg">首页</a>
			</div>
			<!-- for small screen -->

			<div class="collapse navbar-collapse" role="navigation">
				<ul class="nav navbar-nav">
					<li class="dropdown dropdown-big"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"><span
							class="label label-success"><i class="icon-cloud-upload"></i></span>
							上传到云服务器</a> <!-- Dropdown -->
						<ul class="dropdown-menu">
							<li>
								<!-- Progress bar -->
								<p>图片上传进度</p> <!-- Bootstrap progress bar -->
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-info" role="progressbar"
										aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
										style="width: 40%">
										<span class="sr-only">完成40%</span>
									</div>
								</div>

								<hr /> <!-- Progress bar -->
								<p>视频上传进度</p> <!-- Bootstrap progress bar -->
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-success"
										role="progressbar" aria-valuenow="80" aria-valuemin="0"
										aria-valuemax="100" style="width: 80%">
										<span class="sr-only">完成80%</span>
									</div>
								</div>

								<hr /> <!-- Dropdown menu footer -->
								<div class="drop-foot">
									<a href="#">查看所有</a>
								</div>

							</li>
						</ul></li>

					<!-- Sync to server link -->
					<li class="dropdown dropdown-big"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"><span
							class="label label-danger"><i class="icon-refresh"></i></span>
							同步到服务器</a> <!-- Dropdown -->
						<ul class="dropdown-menu">
							<li>
								<!-- Using "icon-spin" class to rotate icon. -->
								<p>
									<span class="label label-info"><i class="icon-cloud"></i></span>同步会员到服务器
								</p>
								<hr />
								<p>
									<span class="label label-warning"><i class="icon-cloud"></i></span>同步书签到云端
								</p>

								<hr /> <!-- Dropdown menu footer -->
								<div class="drop-foot">
									<a href="#">查看所有</a>
								</div>
							</li>
						</ul></li>
				</ul>

				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
				</form>
				<!-- Search form -->

				<ul class="nav navbar-nav pull-right">
					<li class="dropdown pull-right"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <i class="icon-user"></i>${user.id }<b
							class="caret"></b>
					</a> <!-- Dropdown menu -->
						<ul class="dropdown-menu">
							<li><a href="#"><i class="icon-user"></i> ziliao</a></li>
							<li><a href="${ctx }/logout"><i class="icon-off"></i>
									logout</a></li>
							<li><a href="#"><i class="icon-cogs"></i> Settings</a></li>
						</ul></li>
				</ul>
				<!-- Links -->
			</div>
		</div>
	</nav>

	<nav class="navbar navbar-fixed-bottom">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-3" style="font-size: 25px">
					<div class="glyphicon glyphicon-home"></div>
					<div style="font-size: 14px">首页</div>
				</div>
				<div class="col-xs-3" style="font-size: 25px">
					<div class="glyphicon glyphicon-th-list"></div>
					<div style="font-size: 14px">分类</div>
				</div>
				<div class="col-xs-3" style="font-size: 25px">
					<div class="glyphicon glyphicon-shopping-cart"></div>
					<div style="font-size: 14px">购物车</div>
				</div>
				<div class="col-xs-3" style="font-size: 25px">
					<div class="glyphicon glyphicon-user"></div>
					<div style="font-size: 14px">我的</div>
				</div>
			</div>
		</div>
	</nav>

	<header>
		<div>
			<div id="pullrefresh">
				<div class="message">
					<div id="pullrefresh-icon" class="icon arrow arrow-down"></div>
					<span></span>
				</div>
			</div>

			<div id="content" style="display: none">
				<h4>
					Pull-to-Refresh <small>random images</small>
				</h4>
				<p>
					<img id="random-image" class="img-rounded"
						src="http://lorempixel.com/300/200/">
				</p>
			</div>
		</div>

		<div id="messag_header" class="container-fluid">
			<div class="row">
				<div class="col-md-4">
					<div class="logo">
						<h1>
							<a href="#">Mac</a>
						</h1>
						<p class="meta">后台管理系统</p>
					</div>
					<!-- Logo ends -->
				</div>

				<div class="col-md-4">
					<ul class="nav nav-pills">
						<li class="dropdown dropdown-big"><a class="dropdown-toggle"
							href="#" data-toggle="dropdown"> <i class="icon-comments"></i>
								聊天 <span class="label label-info">6</span>
						</a>
							<ul class="dropdown-menu">
								<li>
									<!-- Heading - h5 -->
									<h5>
										<i class="icon-comments"></i> 聊天
									</h5> <!-- Use hr tag to add border -->
									<hr />
								</li>
								<li>
									<!-- List item heading h6 -->
									<h6>
										<a href="#">你好 :)</a> <span
											class="label label-warning pull-right">10:42</span>
									</h6>
									<div class="clearfix"></div>
									<hr />
								</li>
								<li>
									<h6>
										<a href="#">你怎么样?</a> <span
											class="label label-warning pull-right">20:42</span>
									</h6>
									<div class="clearfix"></div>
									<hr />
								</li>
								<li>
									<h6>
										<a href="#">你在干撒呢?</a> <span
											class="label label-warning pull-right">14:42</span>
									</h6>
									<div class="clearfix"></div>
									<hr />
								</li>
								<li>
									<div class="drop-foot">
										<a href="#">查看所有</a>
									</div>
								</li>
							</ul></li>

						<li class="dropdown dropdown-big"><a class="dropdown-toggle"
							href="#" data-toggle="dropdown"> <i class="icon-envelope-alt"></i>
								收件箱 <span class="label label-primary">6</span>
						</a>
							<ul class="dropdown-menu">
								<li>
									<!-- Heading - h5 -->
									<h5>
										<i class="icon-envelope-alt"></i> 消息
									</h5> <!-- Use hr tag to add border -->
									<hr />
								</li>
								<li>
									<!-- List item heading h6 -->
									<h6>
										<a href="#">你好啊?</a>
									</h6> <!-- List item para -->
									<p>最近咋样啊...</p>
									<hr />
								</li>
								<li>
									<h6>
										<a href="#">今天很好啊?</a>
									</h6>
									<p>相当好...</p>
									<hr />
								</li>
								<li>
									<div class="drop-foot">
										<a href="#">查看所有</a>
									</div>
								</li>
							</ul></li>

						<li class="dropdown dropdown-big"><a class="dropdown-toggle"
							href="#" data-toggle="dropdown"> <i class="icon-user"></i> 用户
								<span class="label label-success">6</span>
						</a>
							<ul class="dropdown-menu">
								<li>
									<!-- Heading - h5 -->
									<h5>
										<i class="icon-user"></i> 用户
									</h5> <!-- Use hr tag to add border -->
									<hr />
								</li>
								<li>
									<!-- List item heading h6-->
									<h6>
										<a href="#">Ravi Kumar</a> <span
											class="label label-warning pull-right">免费</span>
									</h6>
									<div class="clearfix"></div>
									<hr />
								</li>
								<li>
									<h6>
										<a href="#">Balaji</a> <span
											class="label label-important pull-right">高级</span>
									</h6>
									<div class="clearfix"></div>
									<hr />
								</li>
								<li>
									<h6>
										<a href="#">Kumarasamy</a> <span
											class="label label-warning pull-right">免费</span>
									</h6>
									<div class="clearfix"></div>
									<hr />
								</li>
								<li>
									<div class="drop-foot">
										<a href="#">查看所有</a>
									</div>
								</li>
							</ul></li>
					</ul>
				</div>

				<div class="col-md-4">
					<div class="header-data">
						<div class="hdata">
							<div class="mcol-left">
								<i class="glyphicon glyphicon-signal bred"></i>
							</div>
							<div class="mcol-right">
								<p>
									<a href="#">7000</a> <em>访问</em>
								</p>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="hdata">
							<div class="mcol-left">
								<i class="glyphicon glyphicon-user bblue"></i>
							</div>
							<div class="mcol-right">
								<p>
									<a href="#">3000</a> <em>用户</em>
								</p>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="hdata">
							<div class="mcol-left">
								<i class="glyphicon glyphicon-money bgreen"></i>
							</div>
							<div class="mcol-right">
								<p>
									<a href="#">5000</a><em>订单</em>
								</p>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- Header ends -->

	<nav>
		<div class="sidebar">
			<!--- Sidebar navigation -->
			<!-- If the main navigation has sub navigation, then add the class "has_sub" to "li" of main navigation. -->
			<ul id="nav">
				<!-- Main menu with font awesome icon -->
				<li><a href="index.html" class="open"><i
						class="glyphicon glyphicon-home"></i>首页</a> <!-- Sub menu markup 
            <ul>
              <li><a href="#">Submenu #1</a></li>
              <li><a href="#">Submenu #2</a></li>
              <li><a href="#">Submenu #3</a></li>
            </ul>--></li>
				<li class="has_sub"><a href="#"><i
						class="glyphicon glyphicon-list-alt"></i> 请假 <span
						class="pull-right"><i class="icon-chevron-right"></i></span></a>
					<ul>
						<li><a href="#"
							onClick="frameSrcChange('${ctx }/oa/leave/apply')">请假申请(普通)</a></li>
						<li><a href="#"
							onClick="frameSrcChange('${ctx }/oa/leave/task/list')">待办任务</a></li>
					</ul></li>
				<li class="has_sub"><a href="#"><i
						class="glyphicon glyphicon-list-alt"></i>动态表单 <span
						class="pull-right"><i
							class="glyphicon glyphicon-chevron-right"></i></span></a>
					<ul>
						<li><a href="post.html">流程列表(动态)</a></li>
						<li><a href="login.html">登录页</a></li>
						<li><a href="register.html">任务列表(动态)</a></li>
						<li><a href="support.html">运行中流程表(动态)</a></li>
						<li><a href="invoice.html">已结束流程(动态)</a></li>
					</ul></li>
				<li class="has_sub"><a href="#"><i
						class="glyphicon glyphicon-list-alt"></i> 日程安排 <span
						class="pull-right"><i
							class="glyphicon glyphicon-chevron-right"></i></span></a>
					<ul>
						<li><a href="#"
							onClick="frameSrcChange('${ctx }/oa/schedule/showCalendar')">日程安排</a></li>
						<li><a href="statement.html">任务列表(外置)</a></li>
						<li><a href="error.html">运行中流程表(外置)</a></li>
						<li><a href="error-log.html">已结束流程(外置)</a></li>
					</ul></li>
				<li class="has_sub"><a href="#"><i
						class="glyphicon glyphicon-list-alt"></i>表单管理 <span
						class="pull-right"><i
							class="glyphicon glyphicon-chevron-right"></i></span></a>
					<ul>
						<li><a href="#"
							onClick="frameSrcChange('${ctx}/config/form/list')">表单列表</a></li>
						<li><a href="#"
							onClick="frameSrcChange('${ctx }/config/dictionary')">数据字典</a></li>
					</ul></li>
				<li class="has_sub"><a href="#"><i
						class="glyphicon glyphicon-list-alt"></i>流程管理 <span
						class="pull-right"><i
							class="glyphicon glyphicon-chevron-right"></i></span></a>
					<ul>
						<li><a href="#"
							onClick="frameSrcChange('${ctx}/process/processList/all')">流程定义及部署管理</a></li>
						<li><a href="#"
							onClick="frameSrcChange('${ctx}/process/processinstance/runningList')">运行中流程</a></li>
						<li><a href="#"
							onCLick="frameSrcChange('${ctx}/process/model/list')">模型工作区</a></li>
					</ul></li>
				<li class="has_sub"><a href="#"><i
						class="glyphicon glyphicon-list-alt"></i>系统管理 <span
						class="pull-right"><i
							class="glyphicon glyphicon-chevron-right"></i></span></a>
					<ul>
						<li><a href="#"
							onClick="frameSrcChange('${ctx }/security/user')">用户管理</a></li>
						<li><a href="#"
							onClick="frameSrcChange('${ctx }/security/role')">角色管理</a></li>
						<li><a href="#"
							onCLick="frameSrcChange('${ctx }/security/org')">部门管理</a></li>
						<li><a href="#"
							onCLick="frameSrcChange('${ctx }/security/authority')">权限管理</a></li>
						<li><a href="#"
							onCLick="frameSrcChange('${ctx }/security/resource')">资源管理</a></li>
						<li><a href="#"
							onCLick="frameSrcChange('${ctx }/security/menu')">菜单管理</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<!-- Sidebar ends -->

	<main class="mainbar"> </main>
	<!-- main ends -->

	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<!-- Copyright info -->
					<p class="copy">
						Copyright &copy; 2012 | <a href="#">Your Site</a>
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer ends -->

	<!-- Scroll to top -->
	<span class="totop"><a href="#"><i class="icon-chevron-up"></i></a></span>

	<div id="myModal" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">x</button>
					<h4 class="modal-title">Modal title</h4>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer handle-footer"></div>
			</div>
		</div>
	</div>

	<div id="myModal2" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: 80%; width: 30%">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal2"
						aria-hidden="true">x</button>
					<h4 class="modal-title">Modal title2</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<label class="col-lg-4 control-label">Textarea</label>
							<div class="col-lg-8">
								<textarea id="backReason" class="form-control" rows="10"
									placeholder="Textarea"></textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer reason-footer"></div>
			</div>
		</div>
	</div>
</body>
</html>