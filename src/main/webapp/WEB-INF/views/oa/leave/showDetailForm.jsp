<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">x</button>
		<h4 class="modal-title">Modal title</h4>
	</div>
	<div class="modal-body">
		<table id="view-info"
			class="table table-striped table-bordered table-hover">
			<tr>
				<td width="100">shengqingren:</td>
				<td name="userId"></td>
			</tr>
			<tr>
				<td>jiazhong:</td>
				<td name="leaveType"></td>
			</tr>
			<tr>
				<td>shengqingshijian:</td>
				<td name="applyTime"></td>
			</tr>
			<tr>
				<td>qingjia<font color="red">kaishi</font>shijian:
				</td>
				<td name="startTime"></td>
			</tr>
			<tr>
				<td>qingjia<font color="red">jieshu</font>shijian:
				</td>
				<td name="endTime"></td>
			</tr>
			<tr>
				<td>qingjiashiyou:</td>
				<td name="reason"></td>
			</tr>
		</table>
	</div>
	<div class="modal-footer handle-footer"></div>
</body>
</html>