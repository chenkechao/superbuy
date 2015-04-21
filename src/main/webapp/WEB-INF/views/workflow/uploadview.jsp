<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/fileinput/css/fileinput.css" rel="stylesheet">
<script src="<%=request.getContextPath() %>/resources/js/jquery.js"></script> <!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/fileinput/js/fileinput.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.js"></script> <!-- Bootstrap -->
<style>
  	input{
  		min-width: 30px;
  	}
  </style>
  <script type="text/javascript">
  $("#file").fileinput({
	  uploadUrl: '<%=request.getContextPath()%>/workflow/deploy',
      allowedFileExtensions : ['xml'],
      overwriteInitial: false,
      maxFileSize: 1000,
      maxFilesNum: 10,
      //allowedFileTypes: ['image', 'video', 'flash'],
      slugCallback: function(filename) {
          return filename.replace('(', '_').replace(']', '_');
      }
	}).on("fileloaded",function(event, file, previewId, index){
		alert(file);
	});
  </script>
</head>
<body>
<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">x</button>
		<h4 class="modal-title">Modal title</h4>
	</div>
	<div class="modal-body">
			<form enctype="multipart/form-data" action="<%=request.getContextPath()%>/workflow/deploy" method="post">
                <input id="file" name="file" type="file" class="file" multiple data-overwrite-initial="false" data-min-file-count="1">
                <br>
                <button type="submit" class="btn btn-primary">Submit</button>
                <button type="reset" class="btn btn-default">Reset</button>
            </form>
	</div>
	<div class="modal-footer handle-footer"></div>
</body>
</html>