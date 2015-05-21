<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@include file="/common/include.jsp"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Insert title here</title>
<%@include file="/common/meta.jsp"%>
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<script src="<%=request.getContextPath() %>/resources/js/jquery.form.js"></script> <!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script> <!-- Bootstrap -->
</head>
<script type="text/javascript">
</script>
<body>
<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">x</button>
		<h4 class="modal-title">Modal title</h4>
	</div>
	<div class="modal-body">
			<iframe id="traceframe" scrolling="no" frameborder="0" style="width:100%;height:100%;"></iframe>
	</div>
	<div class="modal-footer handle-footer"></div>
</body>
</html>