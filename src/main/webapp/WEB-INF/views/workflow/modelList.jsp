<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/include.jsp"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>modelList</title> 
  <%@include file="/common/meta.jsp"%>
  
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script> <!-- Bootstrap -->
<script src="<%=request.getContextPath() %>/resources/js/jquery-ui-1.9.2.custom.min.js"></script> <!-- jQuery UI -->

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
    		  createmodel:{
    			  width:300,
    			  height:300,
    			  url:"<%=request.getContextPath()%>/workflow/model/showCreateModelModal",
    			  open:function(){
    				  var modal = parent.window.$(parent.document);
    				  var options = {  
    		 			    	url:'<%=request.getContextPath()%>/workflow/model/create',
    		 			    	type:'post',
    		 			        beforeSubmit:  showRequest,  //提交前处理 
    		 			        success:       showResponse,  //处理完成 
    		 			        dataType:'html',
    		 			        resetForm: true,  
    		 			    }; 
    		  			 
    		  			$('#createModelForm',modal).on("submit",function(){
    		  				$('#createModelForm',modal).ajaxSubmit(options);  
    					        return false;
    		  			});
    			  },
    			  savebtn:[{
    				  text:'chuangjian',
    				  css:'btn btn-primary',
    				  click:function(){
    					  var modal = parent.window.$(parent.document);
    					  $('#createModelForm',modal).submit();
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
				<button tkey="createmodel" type="button" class="btn btn-primary handle">chuangjian</button>
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
							<th>ID</th>
							<th>KEY</th>
							<th>Name</th>
							<th>Version</th>
							<th>chuangjianshijian</th>
							<th>zuihougengxinshijian</th>
							<th>yuanshuju</th>
							<th>caozuo</th>
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
                                      <a href="<%=request.getContextPath() %>/service/editor?id=${model.id}" target="_blank">bianji</a>
									  <a href="<%=request.getContextPath() %>/workflow/model/deploy/${model.id}">bushu</a>
									  <a href="<%=request.getContextPath() %>/workflow/model/export/${model.id}" target="_blank">daochu</a>
			                          <a href="<%=request.getContextPath() %>/workflow/model/delete/${model.id}">shanchu</a>
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