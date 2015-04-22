<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/fileinput/css/fileinput.css" rel="stylesheet">
<script src="<%=request.getContextPath() %>/resources/js/jquery.form.js"></script> <!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/fileinput/js/fileinput.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script> <!-- Bootstrap -->
</head>
<body>
<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">x</button>
		<h4 class="modal-title">Modal title</h4>
	</div>
	<div class="modal-body">
			<form id="uploadForm" enctype="multipart/form-data">
                <input id="file" name="file" type="file" class="file" multiple data-overwrite-initial="false" data-min-file-count="1">
                <br>
                <button type="submit" class="btn btn-primary">Submit</button>
                <button type="reset" class="btn btn-default">Reset</button>
            </form>
            <div id="test"></div>
	</div>
	<div class="modal-footer handle-footer"></div>
</body>
</html>