<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Insert title here</title>
<%@include file="/common/meta.jsp"%>
<link href="${ctx }/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<script src="${ctx }/resources/js/jquery.form.js"></script> <!-- jQuery -->
<script src="${ctx }/resources/bootstrap/js/bootstrap.js"></script> <!-- Bootstrap -->
<script type="text/javascript">
$(function(){
	var modal = parent.window.$(parent.document);
	var options = {
		url : '${ctx }/process/model/create',
		type : 'post',
		beforeSubmit : showRequest, //提交前处理 
		success : showResponse, //处理完成 
		dataType : 'html',
		resetForm : true,
	};

	$('#createModelForm', modal).on("submit", function() {
		alert('fda');
		$('#createModelForm', modal).ajaxSubmit(options);
		return false;
	});

});
</script>
</head>
<body>
<form id="createModelForm" class="form-horizontal" role="form" action="">
	<div class="form-group">
		<label class="col-lg-4 control-label">mingcheng:</label>
		<div class="col-lg-8">
			<input class="form-control" id="name" name="name" type="text"/>
		</div>
	</div>
	<div class="form-group">
		<label class="col-lg-4 control-label">Key:</label>
		<div class="col-lg-8">
			<input class="form-control" id="key" name="key" type="text"/>
		</div>
	</div>
	<div class="form-group">
		<label class="col-lg-4 control-label">Key:</label>
		<div class="col-lg-8">
			<textarea class="form-control"  rows="4" id="description" name="description"></textarea>
		</div>
	</div>
</form>
</body>
</html>