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
	$("#file").fileinput({
		  uploadUrl: '${ctx }/workflow/deploy',
	      allowedFileExtensions : ['xml','bar'],
	      overwriteInitial: false,
	      maxFileSize: 1000,
	      maxFilesNum: 10,
	      //allowedFileTypes: ['image', 'video', 'flash'],
	      slugCallback: function(filename) {
	          return filename.replace('(', '_').replace(']', '_');
	      }
		}).on("fileloaded",function(event, file, previewId, index){
		});
	          
		 var options = {  
		    	target:'#test',
		    	url:'${ctx }/workflow/deploy',
		    	type:'post',
		        beforeSubmit:  showRequest,  //提交前处理 
		        success:       showResponse,  //处理完成 
		        dataType:'html',
		        resetForm: true,  
		    }; 
		 
		$('#uploadForm').on("submit",function(){
			$('#uploadForm',parent.window.$(parent.document)).ajaxSubmit(options);  
		        return false;
		});
});
</script>
</head>
<body>
<form id="uploadForm" enctype="multipart/form-data">
	<input id="file" name="file" type="file" class="file" multiple data-overwrite-initial="false" data-min-file-count="1">
	<br>
	<button type="submit" class="btn btn-primary">Submit</button>
	<button type="reset" class="btn btn-default">Reset</button>
</form>
</body>
</html>