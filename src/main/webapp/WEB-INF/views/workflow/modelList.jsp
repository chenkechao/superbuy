<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<<html lang="en">
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
    <!-- Main stylesheet -->
    <link href="<%=request.getContextPath() %>/resources/style/style.css" rel="stylesheet">
</head>
<body>
	    <!-- Matter -->

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
							<th>ID</th>
							<th>KEY</th>
							<th>Name</th>
							<th>Version</th>
							<th>创建时间</th>
							<th>最后更新时间</th>
							<th>元数据</th>
							<th>操作</th>
                      	</tr>
                      </thead>
                      <tbody>
                          <c:forEach items="${modelList }" var="model">
                              <tr>
                                  <td>${model.id }</td>
                                  <td>${model.key }</td>
                                  <td>${model.name }</td>
                                  <td>${model.version }</td>
                                  <td>${model.createTime }</td>
                                  <td>${model.lastUpdateTime }</td>
                                  <td>${model.metaInfo }</td>
                                  <td>
                                      <a href="<%=request.getContextPath() %>/service/editor?id=${model.id}" target="_blank">编辑</a>
									  <a href="<%=request.getContextPath() %>/workflow/model/deploy/${model.id}">部署</a>
									  <a href="<%=request.getContextPath() %>/workflow/model/export/${model.id}" target="_blank">导出</a>
			                          <a href="<%=request.getContextPath() %>/workflow/model/delete/${model.id}">删除</a>
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

</body>
</html>