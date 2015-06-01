<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>formuse</title> 
  <%@include file="/common/meta.jsp"%>
   <style>
  	body{
  		padding-top: 0px;
  	}
  </style>
  <script type="text/javascript">
	$(function(){
		$("#submit").click(function(){
			$("#inputForm").submit();
		});
	});
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
				<form id="inputForm" action="${ctx }/form/config/submit" method="post"  target="mainFrame">
					<input type="hidden" id="formId" name="formId" value="${dfForm.id }"/>
					<input type="hidden" id="processId" name="processId" value="${processId }"/>
					<input type="hidden" id="orderId" name="orderId" value="${orderId }"/>
					<input type="hidden" id="taskId" name="taskId" value="${taskId }"/>
					${dfForm.parseHtml }
				</form>
            </div><!-- row ends -->
			<div class="row">
				<p style="text-align: left;">
					<button type="submit" id="submit" value="save" class="btn btn-success">quedingbaocun</button>
				</p>
			</div>
        </div><!-- Container ends -->
		  </div><!-- Matter ends -->
</div>

   

</body>
</html>