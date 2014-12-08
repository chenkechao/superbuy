<!DOCTYPE html>
<html>
<head>
    <title>Welcome!</title>
    <%@include file="/common/include.jsp"%>
</head>
<body>
	<%@include file="/common/header.jsp"%>
	<div class="container">
	    <!-- /* Handle the flash message */-->
	    <th:block th:if="${message != null}">
	        <!-- /* The message code is returned from the @Controller */ -->
	        <div th:replace="fragments/alert :: alert (type=${#strings.toLowerCase(message.type)}, message=#{${message.message}(${#authentication.name})})">&nbsp;</div>
	    </th:block>
	    <p>
	        Welcome to the Spring MVC Quickstart application!
	    </p>
	</div>
</body>
</html>