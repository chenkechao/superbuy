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
	    
	   $('#name').editable('option','validate',function(v){
		   if(!v) return 'not null';
	   });
	    
	    $('#cnName').editable({
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
	  var url = '${ctx}/config/dictionary/view/json/'+${dictionary.id};
	  loadDetail1(url);
  });
  
  function actionFormatter(value, row, index) {
	  var string = '';
	  if(row.temp=='1'){
		  string = '<a href="#" class="save" title="保存">保存</a>'
		  			+ '<a href="#" class="cancel" title="取消">取消</a>';
	  }else{
		  string ='<a href="${ctx}/security/user/delete/'+row.id+'" class="btnDel" title="删除" onclick="return confirmDel();">删除</a>'
          + '<a href="#" class="edit" title="编辑">编辑</a>';
	  }
      return [string].join('');
  }

  window.actionEvents = {
      'click .edit': function (e, value, row, index) {
    	  //$("#table-methods-table > tbody tr:eq("+index+")").replaceWith("");
    	  $("#table-methods-table").bootstrapTable('updateRow', {
              index: index,
              row: {
                  orderby: "<input id='orderby_"+row.id+"' value='"+row.orderby+"'>",
                  code: "<input id='code_"+row.id+"' value='"+row.code+"'>",
                  name: "<input id='name_"+row.id+"' value='"+row.name+"'>",
                  temp:"1"
              }
          });
      },
  	'click .save':function(e, value, row, index){
  		alert(JSON.stringify(row));
  	},
  	'click .cancel':function(e, value, row, index){
  		$("#table-methods-table").bootstrapTable('updateRow', {
            index: index,
            row: {
                orderby: $(row.orderby).attr('value'),
                code: $(row.code).attr('value'),
                name: $(row.name).attr('value'),
                temp:"0"
            }
        });
  	}
  };
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
		                        <td width="35%">配置名称</td>
		                        <td width="65%">
		                        <a href="#" id="id" class="myeditable" style="display:none" data-type="text" data-value="${dictionary.id }"></a>
		                        <a href="#" id="name" class="myeditable" data-type="text" data-title="Enter name"></a></td>
		                    </tr>
		                    <tr>         
		                        <td>显示名称</td>
		                        <td><a href="#" id="cnName" class="myeditable" data-type="text" data-placement="right" data-placeholder="Required" data-title="Enter cnName"></a></td>
		                    </tr>  
	                	</tbody>
	            	</table>
	            	
					<label>添加选项：</label>
					<button id="append-data" type="button" class="btn btn-default" data-method="append">添加选项</button>
						 
					<br><br>
					<table class="table table-striped table-bordered table-hover"
						id="table-methods-table" data-toggle="table"
						data-url="${ctx }/config/dictionary/dictionaryItem/list/json/${dictionary.name}"
						data-height="200"
						data-responseHandler="handle">
						<thead>
							<tr>
								<th data-field="state" data-checkbox="true"></th>
								<th data-field="orderby">序号</th>
								<th data-field="code">编号</th>
								<th data-field="name">名称</th>
								<th data-field="action"  data-formatter="actionFormatter" data-events="actionEvents">操作</th>
							</tr>
						</thead>
					</table>
					
					<br><br>
					<div>
						<button type="button" id="savebtn" class="btn btn-primary">Submit</button>
						<button type="button" id="cancelbtn" class="btn btn-default">Cancel</button>
					</div>
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