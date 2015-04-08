$(function(){
	$('.claim').button({
		icons: {
			primary:'ui-icon-person'
		}
	});
	
	$('.handle').button({
		icons: {
			primary:'ui-icon-comment'
		}
	}).click(handle);
	
	$('.trace').click(graphTrace);
});

var detail = {};

function loadDetail(id,withVars,callback) {
	var dialog = this;
//	 $.getJSON(ctx + '/oa/leave/detail/' + id, function(data) {
//	        detail = data;
//	        $.each(data, function(k, v) {
//				
//				// 格式化日期
//				if (k == 'applyTime' || k == 'startTime' || k == 'endTime') {
//					$('.view-info td[name=' + k + ']', dialog).text(new Date(v).format('yyyy-MM-dd hh:mm'));
//				} else {
//		            $('.view-info td[name=' + k + ']', dialog).text(v);
//				}
//				
//	        });
//			if ($.isFunction(callback)) {
//				callback(data);
//			}
//	    });
}

function complete(taskId,variables){
	
}

var handleOpts = {
		deptLeaderAudit:{
			width:300,
			height:300,
			open:function(id) {
				loadDetail.call(this,id);
			},
			btns:[{
				text:'同意',
				click:function() {
					var taskId = $(this).data('taskId');
					
					complete(taskId,[{
						key:'deptLeaderPass',
						value:true,
						type:'B'
					}]);
				}
			},
			{
				text:'驳回',
				click:function() {
					var taskId = $(this).data('taskId');
					
				}
			}]

		},
		hrAudit:{
			
		},
		modifyApply:{
			
		},
		reportBack:{
			
		}
};

function handle() {
	var tkey = $(this).attr('tkey');
	var tname = $(this).attr('tname');
	var rowId = $(this).parents('tr').attr('id');
	var taskId = $(this).parents('tr').attr('tid');
	$('#'+tkey).data({
		taskId:taskId
	}).dialog({
		title:'流程办理['+tname+']',
		modal:true,
		width:handleOpts[tkey].width,
		height:hanleOpts[tkey].height,
		open:function(){
			handleOpts[tkey].open.call();
		},
		buttons:handleOpts[tkey].btns
	});
}