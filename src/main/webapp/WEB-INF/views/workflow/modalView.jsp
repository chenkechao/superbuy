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
</head>
<body>
<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">x</button>
		<h4 class="modal-title">Modal title</h4>
	</div>
	<div class="modal-body" id="tetette">
	</div>
	<div class="modal-footer handle-footer"></div>
</body>
</html>