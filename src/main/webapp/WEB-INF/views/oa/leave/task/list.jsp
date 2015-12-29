<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>taskList</title>
<%@include file="/common/meta.jsp"%>
<style>
body {
	padding-top: 0px;
}
</style>
<script type="text/javascript">
  	
  	$(function() {
	    // 办理
	    $('.handle').click(handle);
	    $('.trace').click(graphTrace);
	});
  	
  	$.fn.coffee = function(obj){
	  for(var eName in obj)
	    for(var selector in obj[eName])
	      $(this).on(eName, selector, obj[eName][selector]);
	}
  	
  	function actionFormatter(value, row, index) {
  		var assignee = row.assignee;
  		var actionString = '';
  		if(assignee == null) {
  			actionString = '<a href="#" class="btn btn-info claim">签收</a>';
  		}else{
  			actionString = '<a href="#" tkey="'+row.taskDefinitionKey
  				+'" tid="'+row.id+"/"+row.taskId+'" class="btn btn-info handle">办理</a>';
  		}
		return [actionString].join('');
	}

	window.actionEvents = {
		'click .claim' : function(e, value, row, index) {
			claim(row.taskId);
		},
		'click .handle' : function(e, value, row, index) {
			var data = {taskId:row.taskId,id:row.id};
			handle.call(this,data);
		},
		
	};
  	
      function claim(taskId){
      	 $.ajax({
    		  url:'${ctx}/oa/leave/task/claim/'+taskId,
    		  cache:false,
    		  success:function(resp){
    			 if (resp == 'success') {
		            location.reload();
		        } else {
		            alert('error');
		        }
    		  }
    	  });
      }
      
      var handleOpts = {
      	  deptLeaderAudit:  {
	        width: 300,
		    height: 300,
		    url:"${ctx }/oa/leave/detail/showDetailForm",
	    	open:function(url, id) {
	    		$(".modal-body", parent.window.$(parent.document)).load(url);
				if(id != null){
					var detailurl = '${ctx }/oa/leave/detail/' + id;
					loadDetail1.call(this, detailurl);
				}
	    	},
	    	savebtn:[{
	    		text:'tongyi',
	    		css:'btn btn-primary',
	    		click:function(){
	    			var taskId = $(this).data('taskId');
	    			alert(taskId);
	    			complete(taskId,[{
	    				key:'deptLeaderPass',
	    				value:true,
	    				type:'B'
	    			}]);
	    		}
	    	}
	    	,{
	    		text:'bohui',
	    		css:'btn btn-danger',
	    		click:function(){
	    			var taskId = $(this).data('taskId');
	    			$("#myModal2",parent.window.$(parent.document))
	    			.on("show.bs.modal",function(){
	    				if($(".reason-footer input",parent.window.$(parent.document)).length==0){
	    					$("<input>", {
							  type: "button",
							  val: "bohui",
							  class:"btn btn-danger",
							  click: function(){
							  	var leaderBackReason = $('#backReason',parent.window.$(parent.document)).val();
								if (leaderBackReason == '') {
									alert('请输入驳回理由！');
									return;
								}
								
								// 设置流程变量
								complete(taskId, [{
				    				key:'deptLeaderPass',
				    				value:false,
				    				type:'B'
				    			},{
				    				key:'leaderBackReason',
				    				value:leaderBackReason,
				    				type:'S'
				    			}]);
							  }
							}).appendTo($(".reason-footer",parent.window.$(parent.document)));
							$("<input>",{
								type:"button",
								val:"quxiao",
								class:"btn btn-default",
								click:function(){
									$("#myModal2",parent.window.$(parent.document)).modal("hide");
								}
							}).appendTo($(".reason-footer",parent.window.$(parent.document)));
	    				}
	    			}).modal();
	    		}
	    	}
	    	,{
	    		text:'Close',
	    		css:'btn btn-default',
	    		click:function(){
	    			$("#myModal",parent.window.$(parent.document)).modal("hide");
	    		}
	    	}]
      	},
      	hrAudit: {
      		width : 300,
      		height :300,
      		url:"${ctx }/oa/leave/detail/showDetailForm",
      		open:function(id,taskId) {
      			loadDetail.call(this,id,taskId);
      		},
      		savebtn:[{
      			text:"tongyi",
      			css:"btn btn-primary",
      			click:function(taskId){
      				var taskId = $(this).data('taskId');
      				complete(taskId,[{
      					key: 'hrPass',
						value: true,
						type: 'B'
      				}]);
      			}
      		},{
      			text:'bohui',
	    		css:'btn btn-danger',
	    		click:function(){
	    			var taskId = $(this).data('taskId');
	    			$("#myModal2",parent.window.$(parent.document))
	    			.on("show.bs.modal",function(){
	    				if($(".reason-footer input",parent.window.$(parent.document)).length==0){
	    					$("<input>", {
							  type: "button",
							  val: "bohui",
							  class:"btn btn-danger",
							  click: function(){
							  	var hrBackReason = $('#backReason',parent.window.$(parent.document)).val();
								if (hrBackReason == '') {
									alert('请输入驳回理由！');
									return;
								}
								
								// 设置流程变量
								complete(taskId, [{
				    				key:'hrPass',
				    				value:false,
				    				type:'B'
				    			},{
				    				key:'hrBackReason',
				    				value:hrBackReason,
				    				type:'S'
				    			}]);
							  }
							}).appendTo($(".reason-footer",parent.window.$(parent.document)));
							$("<input>",{
								type:"button",
								val:"quxiao",
								class:"btn btn-default",
								click:function(){
									$("#myModal2",parent.window.$(parent.document)).modal("hide");
								}
							}).appendTo($(".reason-footer",parent.window.$(parent.document)));
	    				}
	    			}).modal();
	    		}
      		}
      		,{
	    		text:'Close',
	    		css:'btn btn-default',
	    		click:function(){
	    			$("#myModal",parent.window.$(parent.document)).modal("hide");
	    		}
	    	}]
      	},
      	modifyApply:{
      		width:300,
      		height:300,
      		url:"${ctx }/oa/leave/detail/showModifyApply",
      		open:function(id,taskId){
      			loadDetail.call(this,id,taskId,function(data){
      				var dialog = parent.window.$(parent.document);
      				var backReason = "";
      				$.each(data, function(k, v) {
						// 格式化日期
						if (k == 'applyTime' || k == 'startTime' || k == 'endTime') {
							if(v != null){
								$('#' + k, dialog).val(new Date(v).format('yyyy-MM-dd hh:mm'));
							}
						} else if(k == 'variables'){
							$.each(v, function(k1, v1) {
							    if(k1 =='leaderBackReason')	{
							    	backReason += "<b>领导：</b>" + v1;
							    }else if(k1 == 'hrBackReason') {
							    	backReason += "<br/><b>HR:</b>" + v1;
							    }
							});
							$("#backReason",dialog).html(backReason);
						}else {
				            $('#' + k, dialog).val(v);
						}
		       		});
		       		
		       		var reApply = true;
		       		$("#myTab",dialog).data("activeTab",reApply);
		       		
		       		$("#myTab",dialog).on("shown.bs.tab",function(e){
		       			reApply = $(e.target).attr("value");
		       			$("#myTab",dialog).data("activeTab",reApply);
		       		});
		       		
		       		$('.form_datetime',dialog).datetimepicker({
		    	        //language:  'fr',
		    	        weekStart: 1,
		    	        todayBtn:  1,
		    			autoclose: 1,
		    			todayHighlight: 1,
		    			startView: 2,
		    			forceParse: 0,
		    	        showMeridian: 1
		    	    }).on("hide.bs.modal",function(e){
		    	    	return false;
		    	    });
      			});
      		},
      		savebtn:[{
      			text:'tijiao',
	    		css:'btn btn-primary',
	    		click:function(){
	    			var dialog = parent.window.$(parent.document);
	    			var taskId = $(this).data('taskId');
	    			var reApply = $("#myTab",dialog).data("activeTab");
	    			complete(taskId,[{
		       				key:'reApply',
		       				value:reApply,
		       				type:'B'
		       			},
		       			{
		       				key:'leaveType',
		       				value:$("#leaveType",dialog).val(),
		       				type:'S'
		       			},
		       			{
		       				key:'startTime',
		       				value:$("#startTime",dialog).val(),
		       				type:'D'	
		       			},
		       			{
		       				key:'endTime',
		       				value:$("#endTime",dialog).val(),
		       				type:'D'
		       			},
		       			{
		       				key:'reason',
		       				value:$("#reason",dialog).val(),
		       				type:'S'
		       			}]);
	    		}
      		},
      		{
      			text:'quxiao',
	    		css:'btn btn-default',
	    		click:function(){
	    			$("#myModal",parent.window.$(parent.document)).modal("hide");
	    		}
      		}]
      	},
      	reportBack:{
      		width:300,
      		height:300,
      		url:"${ctx }/oa/leave/detail/showReportBack",
      		open:function(id,taskId){
      			loadDetail.call(this, id, taskId);
      			$('.form_datetime',parent.window.$(parent.document)).datetimepicker({
	    	        //language:  'fr',
	    	        weekStart: 1,
	    	        todayBtn:  1,
	    			autoclose: 1,
	    			todayHighlight: 1,
	    			startView: 2,
	    			forceParse: 0,
	    	        showMeridian: 1
	    	    }).on("hide.bs.modal",function(e){
	    	    	return false;
	    	    });
      		},
      		savebtn:[{
      			text:'tijiao',
	    		css:'btn btn-primary',
	    		click:function(){
	    			var dialog = parent.window.$(parent.document);
	    			var taskId = $(this).data('taskId');
	    			var realityStartTime = $("#realityStartTime",dialog).val();
	    			var realityEndTime = $("#realityEndTime",dialog).val();
	    			if(realityStartTime == ''){
	    				alert('请选择实际开始时间！');
	    				return;
	    			}
	    			if(realityEndTime ==''){
	    				alert('请选择实际结束时间!');
	    				return;
	    			}
	    			complete(taskId,[{
	    				key:'realityStartTime',
	    				value:realityStartTime,
	    				type:'D'
	    			},{
	    				key:'realityEndTime',
	    				value:realityEndTime,
	    				type:'D'
	    			}]);
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
      
      function complete(taskId,variables) {
    	  alert(variables);
      	  var keys="",values="",types="";
      	  if(variables) {
      	  	$.each(variables,function(){
      	  		if(keys!="") {
      	  			keys +=",";
      	  			values +=",";
      	  			types +=",";
      	  		}
      	  		keys += this.key;
      	  		values += this.value;
      	  		types +=this.type;
      	  	});
      	  }
		// 发送任务完成请求
	    $.post('<%=request.getContextPath()%>/oa/leave/complete/' + taskId, {
	        keys: keys,
	        values: values,
	        types: types
	    }, function(resp) {
	        if (resp == 'success') {
	            parent.window.$(parent.document).find("#myModal").modal("hide");
	            parent.window.$(parent.document).find("#myModal2").modal("hide");
	            location.reload();
	        } else {
	            alert('error');
	        }
	    });
      }
      
      function graphTrace(){
    	  var modal = parent.window.$(parent.document);
  		var pid = $(this).attr("pid");
  		var pdid = $(this).attr("pdid");
  		var url = "<%=request.getContextPath()%>/workflow/showTraceModalView";
  		modal.find("#myModal")
		.modal({remote:url})
		.on("shown.bs.modal",function(){
			var traceframeurl = "${ctx }/diagram-viewer/index.html?processDefinitionId="+pdid+"&processInstanceId="+pid;
			$(".modal-body",modal).children().attr("src",traceframeurl);
			$(".modal-dialog",modal).css({"width":"60%"});
			$(".modal-body",modal).css("height","500px");
		}).on("hide.bs.modal",function(){
			modal.find("#myModal").removeData("bs.modal");
			modal.find("#myModal").off("shown.bs.modal");
		});
      }
      
      function loadDetail(id,taskId,callback) {
      	var dialog = parent.window.$(parent.document);
		$.ajax({
			  url:"<%=request.getContextPath()%>/oa/leave/detail/" + id
							+ "/" + taskId,
					cache : false,
					dataType : "json",//
					success : function(data) {
						if (callback != null) {
							if ($.isFunction(callback)) {
								callback(data);
							}
						} else {
							$
									.each(
											data,
											function(k, v) {
												// 格式化日期
												if (k == 'applyTime'
														|| k == 'startTime'
														|| k == 'endTime') {
													if (v != null) {
														$(
																'#view-info td[name='
																		+ k
																		+ ']',
																dialog)
																.text(
																		new Date(
																				v)
																				.format('yyyy-MM-dd hh:mm'));
													}
												} else {
													$(
															'#view-info td[name='
																	+ k + ']',
															dialog).text(v);
												}

											});
						}
					}
				});
	}

	Date.prototype.format = function(format) {
		var o = {
			"M+" : this.getMonth() + 1, //month 
			"d+" : this.getDate(), //day 
			"h+" : this.getHours(), //hour 
			"m+" : this.getMinutes(), //minute 
			"s+" : this.getSeconds(), //second 
			"q+" : Math.floor((this.getMonth() + 3) / 3), //quarter 
			"S" : this.getMilliseconds()
		//millisecond 
		}
		if (/(y+)/.test(format))
			format = format.replace(RegExp.$1, (this.getFullYear() + "")
					.substr(4 - RegExp.$1.length));
		for ( var k in o)
			if (new RegExp("(" + k + ")").test(format))
				format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
						: ("00" + o[k]).substr(("" + o[k]).length));
		return format;
	}
</script>
</head>

<body>


	<!-- Main bar -->
	<div class="mainbar">
		<!-- Page heading -->
		<div class="page-head">
			<h2 class="pull-left">
				<i class="icon-table"></i> Tables
			</h2>

			<!-- Breadcrumb -->
			<div class="bread-crumb pull-right">
				<a href="index.html"><i class="icon-home"></i> Home</a>
				<!-- Divider -->
				<span class="divider">/</span> <a href="#" class="bread-current">Dashboard</a>
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
						<table class="table table-striped table-bordered table-hover"
							id="table" data-toggle="table"
							data-url="${ctx }/oa/leave/task/list/json"
							data-row-style="rowStyle" data-query-params="queryParams"
							data-cache="false" data-click-to-select="true"
							data-toolbar="#toolbar" data-pagination="true" data-search="true"
							data-height="600">
							<thead>
								<tr>
									<th data-field="state" data-checkbox="true"></th>
									<th data-field="leaveType">假种</th>
									<th data-field="userId">申请人</th>
									<th data-field="applyTime">申请时间</th>
									<th data-field="startTime">开始时间</th>
									<th data-field="endTime">结束时间</th>
									<th data-field="processDefinitionId">当前节点</th>
									<th data-field="createTime">任务完成时间</th>
									<th data-field="suspended">流程状态</th>
									<th data-field="action" data-formatter="actionFormatter"
										data-events="actionEvents">操作</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- con-md-12 ends -->
				</div>
				<!-- row ends -->
			</div>
			<!-- Container ends -->
		</div>
		<!-- Matter ends -->
	</div>
</body>
</html>