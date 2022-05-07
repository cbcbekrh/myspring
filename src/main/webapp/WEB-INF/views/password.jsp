<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<html>
<head>
    <title>Title</title>
    <style>
        * { box-sizing:border-box; }
        a { text-decoration: none; }
        form{
            width:400px;
            height:400px;
            display:flex;
            flex-direction:column;
            align-items:center;
            position : absolute;
            top:50%;
            left:50%;
            transform: translate(-50%, -50%) ;
            border: 1px solid rgb(89,117,196);
            border-radius: 10px;
        }
        .title{
            font-size:30px;
            margin:25px 0 15px 0;
        }
        .msg{
            height:25px;
            text-align:center;
            font-size:17px;
            color:red;
            margin-bottom: 10px;
        }
        label {
            width:300px;
            height:30px;
            margin-top :4px;
        }
        input {
            width: 300px;
            height: 40px;
            border : 1px solid rgb(89,117,196);
            border-radius:5px;
            padding: 0 10px;
            margin-bottom: 10px;
        }
        button {
            background-color: rgb(89,117,196);
            color : white;
            width:300px;
            height:50px;
            font-size: 17px;
            border : none;
            border-radius: 5px;
            margin : 20px 0 14px 0;
        }
    </style>
</head>
<body>
<form name="form" method="post">
    <div class="title">비밀번호 찾기</div>
    <div class="msg">
        ${URLDecoder.decode(param.msg)}
    </div>
    <label for="">ID</label>
    <input type="text" name="id" placeholder="아이디를 입력해주세요">
    <label for="">E-mail</label>
    <input type="text" name="email" placeholder="이메일을 입력해주세요">
    <button>비밀번호 찾기</button>
    <div>
        <a href="<c:url value='/'/>">홈으로</a> |
        <a href="<c:url value='/login/login'/>">로그인</a> |
        <a href="<c:url value='/register/add'/>">회원가입</a>
    </div>
</form>
</body>
</html>
