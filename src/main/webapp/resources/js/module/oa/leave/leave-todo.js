$(function() {

  // $(".handle").click(handle);
    
});

function handle(){
	// 当前节点的英文名称
	var tkey = $(this).attr("tkey");
	
	// 当前节点的中文名称
	var tname = $(this).attr("tname");
	
	// 请假记录ID
	var rowId = $(this).parents("tr").attr("id");
	
	// 任务ID
	var taskId = $(this).parents("tr").attr("tid");
	parent.window.$(parent.document).find("#myModal")
	.on("show.bs.modal",function(){
		//loadDetail(rowId);
	})
	.modal();
}
