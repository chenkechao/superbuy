<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>runningManager</title> 
  <%@include file="/common/meta.jsp"%>
  <script type="text/javascript">
      
  </script>
</head>

<body>



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
							<th>zhixingIDssss</th>
							<th>liuchengshiliID</th>
							<th>liuchengdingyiID</th>
							<th>dangqianjiedian</th>
							<th>shifoguaqi</th>
							<th>caozuo</th>
                      	</tr>
                      </thead>
                      <tbody>
                      	<c:forEach items="${result}" var="pi">
                      		<c:set var="pdid" value="${p.processDefinitionId }"/>
                      		<c:set var="activityId" value="${p.activityId }"/>
                      		<tr id="tr_"+${pi.id }>
									<td>${pi.id }</td>
									<td>${pi.processInstanceId }</td>
									<td>${pi.processDefinitionId }</td>
									<td><a class="trace" href='#' pid="${pi.id }" pdid="${p.processDefinitionId}" title="点击查看流程图">liuchengtu</a></td>
									<td>${pi.suspended }</td>
									<td>
										<c:if test="${p.suspended }">
											<a href="update/active/${p.processInstanceId}">jihuo</a>
										</c:if>
										<c:if test="${!p.suspended }">
											<a href="update/suspend/${p.processInstanceId}">guaqi</a>
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


   

</body>
</html>