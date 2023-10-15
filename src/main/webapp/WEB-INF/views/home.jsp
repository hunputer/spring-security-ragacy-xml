<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
hello world!
<sec:authorize access="hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')">
  <div>
    사용자님 안녕하세요
  </div>  
</sec:authorize>
<sec:authorize access="hasRole('ROLE_ADMIN')">
  <div>
    관리자님 안녕하세요
  </div>
</sec:authorize>
<sec:authorize access="isAnonymous()">
	<div>
	    로그인을 해주세요!
	    <button id="goLogin">login</button>
	    <button id="goJoinPage">join</button>
	</div>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
	<div>
	    <span><sec:authentication property="principal.username"/></span>
	    <span>님 환영합니다!</span>
	    <!-- security적용할 땐 action을 무조건! /login으로 해야 함, username, Password도 무조건! -->
        <form role="form"  action="/customLogout" method="post">
            <fieldset>
                <!-- Change this to a button or input when using this as a form -->
                <input type="submit" value="Logout" class="btn btn-lg btn-success btn-block">
            </fieldset>
            <input type="hidden" name="${_csrf.parameterName }"   value="${_csrf.token }"><!-- 서버에서 들어오는 정보 -->
            <!-- 서버에서 _csrf의 내용을 받아오면서 침입인 건지 아닌지를 판별함 -->
        </form>
	</div>
</sec:authorize>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
    $("#goLogin").click(function(){
        window.location = "http://localhost:8090/customLogin"
    });
    
    $("#goJoinPage").click(function(){
        window.location = "http://localhost:8090/join"
    });
</script>
</body>
</html>
