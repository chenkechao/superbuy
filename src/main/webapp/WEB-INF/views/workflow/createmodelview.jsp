<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/include.jsp"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Insert title here</title>
<%@include file="/common/meta.jsp"%>
<link
	href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/resources/js/jquery.form.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.js"></script>
<!-- Bootstrap -->
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">x</button>
		<h4 class="modal-title">Modal title</h4>
	</div>
	<div class="modal-body">
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
	</div>
	<div class="modal-footer handle-footer"></div>
</body>
</html>