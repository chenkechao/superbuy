<!DOCTYPE html>
<html>
<head>
    <title>Signup</title>
    <%@include file="/common/include.jsp"%>
</head>
<body>
	<form class="form-narrow form-horizontal" method="post" action="<%=request.getContextPath() %>/signup">
		<fieldset>
			<legend>Please Sign Up</legend>
			<div class="form-group">
			    <label for="email" class="col-lg-2 control-label">Email</label>
			    <div class="col-lg-10">
			        <input type="text" class="form-control" id="email" placeholder="Email address"/>
			    </div>
			</div>
			<div class="form-group">
			    <label for="password" class="col-lg-2 control-label">Password</label>
			    <div class="col-lg-10">
			        <input type="password" class="form-control" id="password" placeholder="Password"/>
			    </div>
			</div>
			<div  class="form-group">
			    <div class="col-lg-offset-2 col-lg-10">
			        <button type="submit" class="btn btn-default">Sign up</button>
			    </div>
			</div>
			<div class="form-group">
			    <div class="col-lg-offset-2 col-lg-10">
			        <p>Already have an account? <a href="signin">Sign In</a></p>
			    </div>
			</div>
		</fieldset>
	</form>
</body>
</html>