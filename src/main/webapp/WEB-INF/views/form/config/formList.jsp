<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>listForm</title> 
  <%@include file="/common/meta.jsp"%>
   <style>
  	body{
  		padding-top: 0px;
  	}
  </style>
  <script type="text/javascript">
  var handleOpts ={
		  createDfForm:{
			  width:300,
			  height:300,
			  url:"${ctx }/form/config/showCreateForm",
			  open:function(url){
				  $(".modal-body",parent.window.$(parent.document)).load(url);
			  },
			  savebtn:[{
				  text:'chuangjian',
				  css:'btn btn-primary',
				  click:function(){
					  var modal = parent.window.$(parent.document);
					  var options = {  
			 			    	url:'${ctx }/form/config/create',
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
					  $('#modalform',modal).submit();
				  }
			  },{
				  text:'quxiao',
				  css:'btn btn-default',
				  click:function(){
					  var modal = parent.window.$(parent.document);
					  modal.find("#myModal").modal("hide");
					 // $("#myModal",parent.window.$(parent.document)).modal("hide");
				  }
			  }]
		  },
		  showDfForm:{
			  width:300,
			  height:300,
			  url:"${ctx }/form/config/showCreateForm",
			  open:function(url,id){
				  $(".modal-body",parent.window.$(parent.document)).load(url);
				  var detailurl = '${ctx }/form/config/detail/'+id;
				  alert(detailurl);
				  loadDetail.call(this,detailurl);
			  },
			  savebtn:[{
				  text:'chuangjian',
				  css:'btn btn-primary',
				  click:function(){
					  var modal = parent.window.$(parent.document);
					  var options = {  
			 			    	url:'${ctx }/form/config/create',
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
					  $('#modalform',modal).submit();
				  }
			  },{
				  text:'quxiao',
				  css:'btn btn-default',
				  click:function(){
					  var modal = parent.window.$(parent.document);
					  modal.find("#myModal").modal("hide");
					 // $("#myModal",parent.window.$(parent.document)).modal("hide");
				  }
			  }]
		  }
  };
  
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
							<th>表单名称</th>
							<th>显示名称</th>
							<th>创建人</th>
							<th>创建时间</th>
							<th>类别</th>
							<th>操作</th>
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
                                  <td>
                                  	  <a href="${ctx }/form/config/delete/${form.id}">删除</a>
                                  	  <a>编辑</a>
									  <a href="${ctx }/form/config/designer/${form.id}" target="_blank">设计</a>
									  <a href="#" tkey="showDfForm" tid="${form.id}" class="btn btn-info handle">查看</a>
			                          <a href="${ctx }/form/config/use/${form.id}">录入数据</a>
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