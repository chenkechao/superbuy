<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>leaveApply</title> 
  <%@include file="/common/meta.jsp"%>
  <style>
  	body{
  		padding-top: 0px;
  	}
  </style>
  <script type="text/javascript">
  $(function(){
	  
	   //defaults
	   //$.fn.editable.defaults.url = '${ctx}/security/user/update';
	   $.fn.editable.defaults.mode = 'inline';
	   
	   $('.myeditable').editable();	   
	   
	   $('.myeditable').on('save.newuser',function(){
		   var that = this;
 		    setTimeout(function() {
		        $(that).closest('tr').next().find('.myeditable').editable('show');
		    }, 200);
	   });
	    
	   $('#username').editable('option','validate',function(v){
		   if(!v) return 'not null';
	   });
	    
	    $('#fullname').editable({
	        validate: function(value) {
	           if($.trim(value) == '') return 'This field is required';
	        }
	    });
	    
	    $('#savebtn').click(function() {
	    	   $('.myeditable').editable('submit', { 
	    		   url:'${ctx}/security/user/update',
	    	       ajaxOptions: {
	    	    	   cache:false,
	    	           dataType: 'text' //assuming json response
	    	       },           
	    	       success: function() {
	    	    	   alert('11');
	    	       },
	    	       error: function(errors) {
	    	    	   alert('22');
	    	           var msg = '';
	    	       }
	    	   });
	    	});
	    
	    $('#cancelbtn').click(function() {
	        $('.myeditable').editable('setValue', null)  //clear values
	            .editable('option', 'pk', null)          //clear pk
	            .removeClass('editable-unsaved');        //remove bold css
	                       
	        $('#save-btn').show();
	        $('#msg').hide();                
	    });
	    
	});
  
  $(function(){
	  var url = '${ctx}/security/user/view/json/'+${userId};
	  loadDetail1(url);
  });
  </script>
</head>

<body>


<!-- Main bar -->
  	<div class="mainbar">
      <!-- Page heading -->
	    <div class="page-head">
        <!-- Page heading -->
	      <h2 class="pull-left">Forms 
          <!-- page meta -->
          <span class="page-meta">Something Goes Here</span>
        </h2>


        <!-- Breadcrumb -->
        <div class="bread-crumb pull-right">
          <a href="index.html"><i class="icon-home"></i> Home</a> 
          <!-- Divider -->
          <span class="divider">/</span> 
          <a href="#" class="bread-current">Forms</a>
        </div>

        <div class="clearfix"></div>

	    </div>
	    <!-- Page heading ends -->



	    <!-- Matter -->

	    <div class="matter">
        <div class="container">

          <div class="row">

            <div class="col-md-12">


              <div class="widget wgreen">
                
                <div class="widget-head">
                  <div class="pull-left">Forms</div>
                  <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a> 
                    <a href="#" class="wclose"><i class="icon-remove"></i></a>
                  </div>
                  <div class="clearfix"></div>
                </div>

                <div class="widget-content">
                  <div class="padd">

                    <h6>Input Boxs</h6>
                    <hr />
                    <!-- Form starts.  -->
	                <table class="table table-striped table-bordered table-hover">
	                	<thead>
	                		<tr>
	                			<th>name</th>
	                			<th>value</th>
							</tr>
	                	</thead>
	                	<tbody> 
		                    <tr>         
		                        <td width="35%">账号</td>
		                        <td width="65%">
		                        <a href="#" id="id" class="myeditable" style="display:none" data-type="text" data-value="${userId }"></a>
		                        <a href="#" id="username" class="myeditable" data-type="text" data-title="Enter username"></a></td>
		                    </tr>
		                    <tr>         
		                        <td>姓名</td>
		                        <td><a href="#" id="fullname" class="myeditable" data-type="text" data-placement="right" data-placeholder="Required" data-title="Enter your fullname"></a></td>
		                    </tr>  
		                    <tr>         
		                        <td>邮箱</td>
		                        <td><a href="#" id="email" class="myeditable" data-type="text" data-title="Select email"></a></td>
		                    </tr>
		                    <tr>         
		                        <td>部门</td>
		                        <td><a href="#" id="org.name" class="myeditable" data-type="select" data-source="${ctx}/security/user/getOrgs" data-title="Select group"></a></td>
		                    </tr> 
		                    <tr>         
		                        <td>角色</td>
		                        <td><a href="#" id="roleIndexs" class="myeditable"  data-type="checklist" data-source="${ctx}/security/user/getRoles" data-title="Select roles"></a></td>
		                    </tr>  
	                	</tbody>
	            	</table>
	            	<div>
						<button type="button" id="savebtn" class="btn btn-primary">Submit</button>
						<button type="button" id="cancelbtn" class="btn btn-default">Cancel</button>
					</div>
                  </div>
                </div>
                  <div class="widget-foot">
                    <!-- Footer goes here -->
                  </div>
              </div>  

            </div>

          </div><!-- row ends -->

        </div><!-- container -->
		  </div><!-- matter -->
	</div>

</body>
</html>