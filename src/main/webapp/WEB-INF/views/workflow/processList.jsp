<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>processList</title> 
  <%@include file="/common/meta.jsp"%>
  <style>
  	body{
  		padding-top: 0px;
  	}
  </style>
  
  <script type="text/javascript">
      function processDefinitionList(processType){
    	  $('#mainIframe',parent.document).attr("src",'${ctx }/workflow/processList/'+processType);
      }
      
      var handleOpts = {
    		  deploy:  {
      	        width: 300,
      		    height: 300,
      		    url:"${ctx }/workflow/showUploadModal",
      	    	open:function() {
      	    		$("#file",parent.window.$(parent.document)).fileinput({
      	  			  uploadUrl: '${ctx }/workflow/deploy',
      	  		      allowedFileExtensions : ['xml','bar'],
      	  		      overwriteInitial: false,
      	  		      maxFileSize: 1000,
      	  		      maxFilesNum: 10,
      	  		      //allowedFileTypes: ['image', 'video', 'flash'],
      	  		      slugCallback: function(filename) {
      	  		          return filename.replace('(', '_').replace(']', '_');
      	  		      }
      	  			}).on("fileloaded",function(event, file, previewId, index){
      	  			});
      	  		          
      	  			 var options = {  
      	 			    	target:'#test',
      	 			    	url:'${ctx }/workflow/deploy',
      	 			    	type:'post',
      	 			        beforeSubmit:  showRequest,  //提交前处理 
      	 			        success:       showResponse,  //处理完成 
      	 			        dataType:'html',
      	 			        resetForm: true,  
      	 			    }; 
      	  			 
      	  			$('#uploadForm',parent.window.$(parent.document)).on("submit",function(){
      	  				$('#uploadForm',parent.window.$(parent.document)).ajaxSubmit(options);  
      				        return false;
      	  			});
      	    	},
      	    	savebtn:[]
              },
    		  startup:  {
    	        width: 300,
    		    height: 300,
    		    url:"${ctx }/form/formkey/start/showStartForm/",
    	    	open:function(url,processDefinitionId) {
    	    		$(".modal-body",parent.window.$(parent.document)).load(url+processDefinitionId);
    	    	},
    	    	savebtn:[{
    	    		text:'qidongliucheng',
    	    		css:'btn btn-primary',
    	    		click:function(){
    	    			//$(".form-horizontal",parent.window.$(parent.document)).submit();
    	    		}
    	    	}
    	    	,{
    	    		text:'quxiao',
    	    		css:'btn btn-default',
    	    		click:function(){
    	    			$("#myModal",modal).modal("hide");
    	    		}
    	    	}]
          	}
      }
      
      function readForm(processDefinitionId){
      }
      
      function convertToModel(processDefinitionId){
      	 $.ajax({
      		 url:"${ctx }/workflow/process/convertToModel/"+processDefinitionId,
      		 success:function(){
      			 alert("da");
      		 },
      		 error:function(){
      		 	alert("error1f");
      		 }
      	 });
      }
      
      function deleteProcessDefinition(processDefinitionId,deploymentId){
      	$.ajax({
      		url:"${ctx }/workflow/process/deleteProcessDefinition/"+deploymentId,
      		cache : false,
      		success:function(){
      			location.reload();
      		},
      		error:function(){
      			alert("error");
      		}
      	});
      }
      
      function reDeployAll(){
      		$.ajax({
      			url:"${ctx }/workflow/redeploy/all",
      			cache: false,
      			success:function(){
      				alert("redeploy success");
      			}
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

		<div class="btn-group" id="processType">
			<button type="button" class="btn btn-default">All</button>
			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"> 
				<span class="caret"></span>
				<span class="sr-only"></span>
			</button>
			<ul class="dropdown-menu">
				<li><a href="#" onclick="processDefinitionList('all')">All</a></li>
				<li><a href="#" onclick="processDefinitionList('dynamicForm')">DynamicForm</a></li>
				<li><a href="#">Something else here</a></li>
				<li class="divider"></li>
				<li><a href="#">Separated link</a></li>
			</ul>
		</div>
		
		<button type="button" class="btn btn-default handle" tkey="deploy">deploy</button>
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
							<th>ProcessDefinitionId</th>
							<th>DeploymentId</th>
							<th>名称</th>
							<th>KEY</th>
							<th>版本号</th>
							<th>XML</th>
							<th>图片</th>
							<th>部署时间</th>
							<th>是否挂起</th>
							<th>操作</th>	
                      	</tr>
                      </thead>
                      <tbody>
                      	<c:forEach items="${processList}" var="object">
                      		<c:set var="process" value="${object[0] }"/>
                      		<c:set var="deployment" value="${object[1]}"/>
                      		<tr id="${process.id }">
									<td>${process.id }</td>
									<td>${process.deploymentId }</td>
									<td>${process.name }</td>
									<td>${process.key }</td>
									<td>${process.version }</td>
									<td><a target="_blank" href='${ctx }/workflow/resource/read?processDefinitionId=${process.id}&resourceType=xml'>xml</a></td>
									<td><a target="_blank" href='${ctx }/workflow/resource/read?processDefinitionId=${process.id}&resourceType=image'>image</a></td>
									<td>${deployment.deploymentTime }</td>
									<td>${process.suspended} |
										<c:if test="${process.suspended }">
											<a href="processdefinition/update/active/${process.id}">jihuo</a>
										</c:if>
										<c:if test="${!process.suspended }">
											<a href="processdefinition/update/suspend/${process.id}">guaqi</a>
										</c:if>
									</td>
									<td>
				                        <a href='#' onclick="deleteProcessDefinition('${process.id}','${process.deploymentId }')">Delete</a><br/>
				                        <a href='#' id="convertButton" onClick="convertToModel('${process.id}')">Convert to Model</a>
				                        <a href="#" id="startupProcess" tkey="startup" tid="${process.id }" class="handle">qidong</a>
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