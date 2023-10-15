<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
회원가입 페이지
<div><label> User Name : <input type="text" name="id"/> </label></div>
<div><label> Password : <input type="password" name="passwd"/> </label></div>
<div><label> name : <input type="name" name="name"/> </label></div>
<div>
        <input type="radio" name="role" value="ROLE_MEMBER">
        <label for="email">유저</label>
 
        <input type="radio" name="role" value="ROLE_ADMIN">
        <label for="phone">관리자</label>
 
        <input type="radio" name="role" value="ROLE_HOSPITAL">
        <label for="mail">병원 관계자</label>
    </div>
<button id="join">join</button>
</body>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>

//첨부파일 선택 이벤트 처리
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

$("#join").click(function (){
    var id = $('input[name=id]').val();
    var passwd = $('input[name=passwd]').val();
    var name = $('input[name=name]').val();
    var role = $("input[type=radio][name=role]:checked").val();

    $.ajax({
        type : 'post',
        url : '/join',
        dataType : 'text',
        data : JSON.stringify({
            "id": id,
            "pw": passwd,
            "name": name,
            "role": role
        }),
        beforeSend : function(xhr){
       	 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
        },
        contentType : 'application/json; charset=utf-8',
        success : function(result) {
            console.log(result);
        }
    })
})
</script>
</html>