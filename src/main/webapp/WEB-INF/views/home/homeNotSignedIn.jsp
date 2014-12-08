<!DOCTYPE html>
<html>
    <head>
        <title>Welcome to the Spring MVC Quickstart application! Get started quickly by signing up!</title>
        <%@include file="/common/include.jsp"%>
    </head>
    <script type="text/javascript">
    	function singup(){
    		window.locaion.href = "<%=request.getContextPath() %>/signup";
    	}
    </script>
    <body>
    	<%@include file="/common/header.jsp"%>
        <div class="container"> 
		    <div class="text-center"> 
		        <h1>Test</h1> 
		        <p class="lead"> 
		            Welcome to the Spring MVC Quickstart application! 
		            Get started quickly by signing up. 
		        </p> 
		        <p> 
		            <a href="signup" class="btn btn-success btn-lg">Sign up</a> 
		        </p> 
		    </div> 
		    <%@include file="/common/footer.jsp"%>
		</div> 
    </body>
</html>