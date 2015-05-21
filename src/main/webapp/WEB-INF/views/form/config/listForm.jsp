<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/include.jsp"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>listForm</title> 
  <%@include file="/common/meta.jsp"%>
  <!-- Main stylesheet -->
  <link href="<%=request.getContextPath() %>/resources/style/style.css" rel="stylesheet">
  
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script> <!-- Bootstrap -->
<script src="<%=request.getContextPath() %>/resources/js/jquery-ui-1.9.2.custom.min.js"></script> <!-- jQuery UI -->

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
<script src="<%=request.getContextPath() %>/resources/js/filter.js"></script> <!-- Filter for support page -->
<script src="<%=request.getContextPath() %>/resources/js/custom.js"></script> <!-- Custom codes -->
<script src="<%=request.getContextPath() %>/resources/js/charts.js"></script> <!-- Charts & Graphs -->
  
  <!-- HTML5 Support for IE -->
  <!--[if lt IE 9]>
  <script src="js/html5shim.js"></script>
  <![endif]-->

  <!-- Favicon -->
  <link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/img/favicon/favicon.png">
   <style>
  	body{
  		padding-top: 0px;
  	}
  </style>
  <script type="text/javascript">
  $(function(){
	  $(".handle").on("click",handle);
  });
  
  var handleOpts ={
		  creacreateform:{
			  width:300,
			  height:300,
			  url:"<%=request.getContextPath()%>/form/config/showCreateFormModal",
			  open:function(){
				  var modal = parent.window.$(parent.document);
				  var options = {  
		 			    	url:'<%=request.getContextPath()%>/form/config/create',
		 			    	type:'post',
		 			        beforeSubmit:  showRequest,  //æäº¤åå¤ç 
		 			        success:       showResponse,  //å¤çå®æ 
		 			        dataType:'html',
		 			        resetForm: true,  
		 			    }; 
		  			 
		  			$('#modalform',modal).on("submit",function(){
		  				$('#modalform',modal).ajaxSubmit(options);  
					        return false;
		  			});
			  },
			  savebtn:[{
				  text:'chuangjian',
				  css:'btn btn-primary',
				  click:function(){
					  var modal = parent.window.$(parent.document);
					  $('#modalform',modal).submit();
				  }
			  },{
				  text:'quxiao',
				  css:'btn btn-default',
				  click:function(){
					  $("#myModal",parent.window.$(parent.document)).modal("hide");
				  }
			  }]
		  }
  };
  
  function showRequest(formData,jqForm,options){
  }  

function showResponse(responseText,statusText) {
  	if(responseText == "success") {
  		alert("success");
  		$("#myModal",parent.window.$(parent.document)).modal("hide");
  		location.reload();
  	}else{
  		alert("error");
  	}
  }
  
  function handle(){
	  var tkey = $(this).attr("tkey");
	var modal = parent.window.$(parent.document);
	modal.find("#myModal")
		.modal({remote:handleOpts[tkey].url})
		.on("shown.bs.modal",function(){
			if($(".handle-footer input",modal).length==0){
			$.each(handleOpts[tkey].savebtn,function(){
				$("<input>", {
				  type: "button",
				  val: this.text,
				  class:this.css,
				  click: this.click,
				}).appendTo($(".handle-footer",modal));
			});
			handleOpts[tkey].open.call(this);
			}
		}).on("hide.bs.modal",function(){
			modal.find("#myModal").removeData("bs.modal");
			$(".handle-footer input",modal).remove();
			modal.find("#myModal").off("shown.bs.modal");
		});
  }
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

		<div>
				<button tkey="creacreateform" type="button" class="btn btn-primary handle">xinjian</button>
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
							<th>è¡¨ååç§°</th>
							<th>æ¾ç¤ºåç§°</th>
							<th>åå»ºäºº</th>
							<th>åå»ºæ¶é´</th>
							<th>ç±»å«</th>
							<th>æä½</th>
                      	</tr>
                      </thead>
                      <tbody>
                          <c:forEach items="${formList }" var="form">
                              <tr>
                                  <td>${form.name }</td>
                                  <td>${form.displayName }</td>
                                  <td>${form.creator }</td>
                                  <td>${form.createTime }</td>
                                  <td>${form.type }</td>
                                  <td>${model.metaInfo }</td>
                                  <td>
									  <a href="<%=request.getContextPath() %>/form/config/designer/${form.id}" target="_blank">sheji</a>
									  <a href="<%=request.getContextPath() %>/form/config/view/${form.id}">chakan</a>
			                          <a href="<%=request.getContextPath() %>/form/config/use/${form.id}">lurushuju</a>
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
</div>

   

</body>
</html>