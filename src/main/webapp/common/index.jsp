 <%@ taglib prefix ="s" uri="/struts-tags"%>
 <%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dashboard Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath() %>/resources/css/dashboard.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="<%=request.getContextPath() %>/resources/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Super Buy</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Help</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </div>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
	        <li class="block">
	          <input type="checkbox" name="item" id="item1" />
	          <label for="item1"><i aria-hidden="true" class="icon-users"></i><s:text name="main.menu.tasks"/><span>124</span></label>
	          <ul class="options">
				<li><a href="#"><i aria-hidden="true" class="icon-search"></i><s:text name="task.menu.tasks"/></a></li>
				<li><a href="#"><i aria-hidden="true" class="icon-point-right"></i><s:text name="task.menu.inbox"/></a></li>
				<li><a href="#"><i aria-hidden="true" class="icon-fire"></i><s:text name="task.menu.queued"/></a></li>
				<li><a href="#"><i aria-hidden="true" class="icon-fire"></i><s:text name="task.menu.involved"/></a></li>
				<li><a href="#"><i aria-hidden="true" class="icon-fire"></i><s:text name="task.menu.archived"/></a></li>
			  </ul>
	        </li>
	        <li class="block">
	          <input type="checkbox" name="item" id="item2" />
	          <label for="item2"><i aria-hidden="true" class="icon-film"></i><s:text name="main.menu.process"/><span>1,034</span></label>
	          <ul class="options">
				<li><a href="#"><i aria-hidden="true" class="icon-movie"></i><s:text name="process.menu.my.instances"/><span>7</span></a></li>
				<li><a href="#"><i aria-hidden="true" class="icon-download"></i><s:text name="process.menu.deployed.definitions"/><span>3</span></a></li>
				<li><a href="#"><i aria-hidden="true" class="icon-warning"></i><s:text name="process.menu.editor.definitions"/><span>1,024</span></a></li>
			  </ul>
	        </li>
	        <li class="block">
	          <input type="checkbox" name="item" id="item3" />
	          <label for="item3"><i aria-hidden="true" class="icon-images"></i><s:text name="main.menu.reports"/><span>4</span></label>
	          <ul class="options">
				<li><a href="#" target="_blank"><i aria-hidden="true" class="icon-deviantart"></i><s:text name="reporting.menu.run.reports"/></a></li>
				<li><a href="#" target="_blank"><i aria-hidden="true" class="icon-dribbble"></i><s:text name="reporting.menu.saved.reports"/></a></li>
			  </ul>
	        </li>
	        <li class="block">
	          <input type="checkbox" name="item" id="item4" />
	          <label for="item4"><i aria-hidden="true" class="icon-microphone"></i><s:text name="main.menu.management"/><span>1</span></label>
	          <ul class="options">
				<li><a href="#" target="_blank"><i aria-hidden="true" class="icon-music"></i><s:text name="management.menu.database"/></a></li>
				<li><a href="#" target="_blank"><i aria-hidden="true" class="icon-music"></i><s:text name="management.menu.deployments"/></a></li>
				<li><a href="#" target="_blank"><i aria-hidden="true" class="icon-music"></i><s:text name="management.menu.deployments.upload"/></a></li>
				<li><a href="#" target="_blank"><i aria-hidden="true" class="icon-music"></i><s:text name="management.menu.active.processdefinitions"/></a></li>
				<li><a href="#" target="_blank"><i aria-hidden="true" class="icon-music"></i><s:text name="management.menu.suspended.processdefinitions"/></a></li>
				<li><a href="#" target="_blank"><i aria-hidden="true" class="icon-music"></i><s:text name="management.menu.jobs"/></a></li>
				<li><a href="#" target="_blank"><i aria-hidden="true" class="icon-music"></i><s:text name="management.menu.users"/></a></li>
				<li><a href="#" target="_blank"><i aria-hidden="true" class="icon-music"></i><s:text name="management.menu.groups"/></a></li>
				<li><a href="#" target="_blank"><i aria-hidden="true" class="icon-music"></i><s:text name="management.menu.admin"/></a></li>
			  </ul>
	        </li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">Dashboard</h1>

          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
          </div>

          <h2 class="sub-header">Section title</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Header</th>
                  <th>Header</th>
                  <th>Header</th>
                  <th>Header</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1,001</td>
                  <td>Lorem</td>
                  <td>ipsum</td>
                  <td>dolor</td>
                  <td>sit</td>
                </tr>
                <tr>
                  <td>1,002</td>
                  <td>amet</td>
                  <td>consectetur</td>
                  <td>adipiscing</td>
                  <td>elit</td>
                </tr>
                <tr>
                  <td>1,003</td>
                  <td>Integer</td>
                  <td>nec</td>
                  <td>odio</td>
                  <td>Praesent</td>
                </tr>
                <tr>
                  <td>1,003</td>
                  <td>libero</td>
                  <td>Sed</td>
                  <td>cursus</td>
                  <td>ante</td>
                </tr>
                <tr>
                  <td>1,004</td>
                  <td>dapibus</td>
                  <td>diam</td>
                  <td>Sed</td>
                  <td>nisi</td>
                </tr>
                <tr>
                  <td>1,005</td>
                  <td>Nulla</td>
                  <td>quis</td>
                  <td>sem</td>
                  <td>at</td>
                </tr>
                <tr>
                  <td>1,006</td>
                  <td>nibh</td>
                  <td>elementum</td>
                  <td>imperdiet</td>
                  <td>Duis</td>
                </tr>
                <tr>
                  <td>1,007</td>
                  <td>sagittis</td>
                  <td>ipsum</td>
                  <td>Praesent</td>
                  <td>mauris</td>
                </tr>
                <tr>
                  <td>1,008</td>
                  <td>Fusce</td>
                  <td>nec</td>
                  <td>tellus</td>
                  <td>sed</td>
                </tr>
                <tr>
                  <td>1,009</td>
                  <td>augue</td>
                  <td>semper</td>
                  <td>porta</td>
                  <td>Mauris</td>
                </tr>
                <tr>
                  <td>1,010</td>
                  <td>massa</td>
                  <td>Vestibulum</td>
                  <td>lacinia</td>
                  <td>arcu</td>
                </tr>
                <tr>
                  <td>1,011</td>
                  <td>eget</td>
                  <td>nulla</td>
                  <td>Class</td>
                  <td>aptent</td>
                </tr>
                <tr>
                  <td>1,012</td>
                  <td>taciti</td>
                  <td>sociosqu</td>
                  <td>ad</td>
                  <td>litora</td>
                </tr>
                <tr>
                  <td>1,013</td>
                  <td>torquent</td>
                  <td>per</td>
                  <td>conubia</td>
                  <td>nostra</td>
                </tr>
                <tr>
                  <td>1,014</td>
                  <td>per</td>
                  <td>inceptos</td>
                  <td>himenaeos</td>
                  <td>Curabitur</td>
                </tr>
                <tr>
                  <td>1,015</td>
                  <td>sodales</td>
                  <td>ligula</td>
                  <td>in</td>
                  <td>libero</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<%=request.getContextPath() %>/resources/js/jquery-1.11.1.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="<%=request.getContextPath() %>/resources/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
