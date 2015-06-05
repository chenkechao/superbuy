<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>配置管理</title>
<%@include file="/common/meta.jsp"%>
   <style>
  	body{
  		padding-top: 0px;
  	}
  </style>
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
				<button tkey="createDfForm" type="button" class="btn btn-primary handle">新建</button>
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
								<td>配置名称</td>
								<td>显示名称</td>
								<td>操作</td>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${page.result}" var="dictionary">
							<tr>
								<td>
									${dictionary.name}&nbsp;</td>
								<td>
									${dictionary.cnName}&nbsp;</td>
								<td><c:choose>
										<c:when test="${empty lookup}">
											<a href="${ctx}/config/dictionary/delete/${dictionary.id }"
												class="btnDel" title="删除">删除</a>
											<a href="${ctx}/config/dictionary/update/${dictionary.id }"
												class="btnEdit" title="编辑">编辑</a>
											<a href="${ctx}/config/dictionary/view/${dictionary.id }"
												class="btnView" title="查看">查看</a>
										</c:when>
										<c:otherwise>
											<a href="javascript:void(0)" class="btnSelect" title="选择"
												onclick="bringback('${dictionary.id}','${dictionary.name }')">选择</a>
										</c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>
						</tbody>
						<frame:page curPage="${page.pageNo}" totalPages="${page.totalPages }"
							totalRecords="${page.totalCount }" lookup="${lookup }" />
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
