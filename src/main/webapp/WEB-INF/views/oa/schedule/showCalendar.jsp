<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/include.jsp"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>Twitter Bootstrap jQuery Calendar component</title>

	<meta name="description" content="Full view calendar component for twitter bootstrap with year, month, week, day views.">
	<meta name="keywords" content="jQuery,Bootstrap,Calendar,HTML,CSS,JavaScript,responsive,month,week,year,day">
	<meta name="author" content="Serhioromano">
	<meta charset="UTF-8">

	<link rel="stylesheet" href="${ctx }/resources/calendar/components/bootstrap3/css/bootstrap.min.css">
	<link rel="stylesheet" href="${ctx }/resources/calendar/components/bootstrap3/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="${ctx }/resources/calendar/css/calendar.css">

	<style type="text/css">
		.btn-twitter {
			padding-left: 30px;
			background: rgba(0, 0, 0, 0) url(https://platform.twitter.com/widgets/images/btn.27237bab4db188ca749164efd38861b0.png) -20px 9px no-repeat;
		}
		.btn-twitter:hover {
			background-position:  -21px -16px;
		}
	</style>
</head>
<body>
<div class="container">
	<div class="jumbotron">
		<h1>Bootstrap Calendar Demo</h1>

		<p>Bootstrap based full view calendar. Template based.</p>

		<a class="btn btn-default btn-primary" href="https://github.com/Serhioromano/bootstrap-calendar">Fork on GitHub</a>
		<a class="btn btn-default" href="index.html">Use bootstrap 2</a>
		<a href="https://twitter.com/serhioromano" class="btn btn-default btn-twitter" data-show-count="false" data-size="large">Follow @serhioromano</a>
		<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');
		</script>
	</div>

	<div class="page-header">

		<div class="pull-right form-inline">
			<div class="btn-group">
				<button class="btn btn-primary" data-calendar-nav="prev"><< Prev</button>
				<button class="btn btn-default" data-calendar-nav="today">Today</button>
				<button class="btn btn-primary" data-calendar-nav="next">Next >></button>
			</div>
			<div class="btn-group">
				<button class="btn btn-warning" data-calendar-view="year">Year</button>
				<button class="btn btn-warning active" data-calendar-view="month">Month</button>
				<button class="btn btn-warning" data-calendar-view="week">Week</button>
				<button class="btn btn-warning" data-calendar-view="day">Day</button>
			</div>
		</div>

		<h3></h3>
		<small>To see example with events navigate to march 2013</small>
	</div>

	<div class="row">
		<div class="col-md-9">
			<div id="calendar"></div>
		</div>
		<div class="col-md-3">
			<div class="row">
				<select id="first_day" class="form-control">
					<option value="" selected="selected">First day of week language-dependant</option>
					<option value="2">First day of week is Sunday</option>
					<option value="1">First day of week is Monday</option>
				</select>
				<select id="language" class="form-control">
					<option value="">Select Language (default: en-US)</option>
					<option value="bg-BG">Bulgarian</option>
					<option value="nl-NL">Dutch</option>
					<option value="fr-FR">French</option>
					<option value="de-DE">German</option>
					<option value="el-GR">Greek</option>
					<option value="hu-HU">Hungarian</option>
					<option value="id-ID">Bahasa Indonesia</option>
					<option value="it-IT">Italian</option>
					<option value="pl-PL">Polish</option>
					<option value="pt-BR">Portuguese (Brazil)</option>
					<option value="ro-RO">Romania</option>
					<option value="es-CO">Spanish (Colombia)</option>
					<option value="es-MX">Spanish (Mexico)</option>
					<option value="es-ES">Spanish (Spain)</option>
					<option value="ru-RU">Russian</option>
					<option value="sk-SR">Slovak</option>
					<option value="sv-SE">Swedish</option>
					<option value="ko-KR">Korean</option>
					<option value="zh-TW">繁體中文</option>
				</select>
				<label class="checkbox">
					<input type="checkbox" value="#events-modal" id="events-in-modal"> Open events in modal window
				</label>
			</div>

			<h4>Events</h4>
			<small>This list is populated with events dynamically</small>
			<ul id="eventlist" class="nav nav-list"></ul>
		</div>
	</div>

	<div class="clearfix"></div>
	<br><br>
	<div id="disqus_thread"></div>
	<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>

	<div class="modal fade" id="events-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3 class="modal-title">Event</h3>
				</div>
				<div class="modal-body" style="height: 400px">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="${ctx }/resources/calendar/components/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/components/underscore/underscore-min.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/components/bootstrap3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/components/jstimezonedetect/jstz.min.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/js/language/bg-BG.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/js/language/nl-NL.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/js/language/fr-FR.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/js/language/de-DE.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/js/language/el-GR.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/js/language/it-IT.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/js/language/hu-HU.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/js/language/pl-PL.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/js/language/pt-BR.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/js/language/ro-RO.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/js/language/es-CO.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/js/language/es-MX.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/js/language/es-ES.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/js/language/ru-RU.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/js/language/sk-SR.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/js/language/sv-SE.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/js/language/zh-TW.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/js/language/cs-CZ.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/js/language/ko-KR.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/js/language/id-ID.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/js/calendar.js"></script>
	<script type="text/javascript" src="${ctx }/resources/calendar/js/app.js"></script>

	<script type="text/javascript">
		var disqus_shortname = 'bootstrapcalendar'; // required: replace example with your forum shortname
		(function() {
			var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
			dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
			(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
		})();
	</script>
</div>
</body>
</html>
