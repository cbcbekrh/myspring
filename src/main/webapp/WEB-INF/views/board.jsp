<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<c:set var="loginId" value="${sessionScope.id}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'Logout'}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>myspring</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: "Noto Sans KR", sans-serif;
        }
        .container {
            width : 50%;
            margin : auto;
        }
        .writing-header {
            position: relative;
            margin: 20px 0 0 0;
            padding-bottom: 10px;
            border-bottom: 1px solid #323232;
        }
        input {
            width: 100%;
            height: 35px;
            margin: 5px 0px 10px 0px;
            border: 1px solid #e9e8e8;
            padding: 8px;
            background: #f8f8f8;
            outline-color: #e6e6e6;
        }
        textarea {
            width: 100%;
            background: #f8f8f8;
            margin: 5px 0px 10px 0px;
            border: 1px solid #e9e8e8;
            resize: none;
            padding: 8px;
            outline-color: #e6e6e6;
        }
        .frm {
            width:100%;
        }
        .btn {
            background-color: rgb(236, 236, 236); /* Blue background */
            border: none; /* Remove borders */
            color: black; /* White text */
            padding: 6px 12px; /* Some padding */
            font-size: 16px; /* Set a font size */
            cursor: pointer; /* Mouse pointer on hover */
            border-radius: 5px;
        }
        .btn:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div id="menu">
    <ul>
        <li id="logo">MySpring</li>
        <li><a href="<c:url value='/'/>">Home</a></li>
        <li><a href="<c:url value='/board/list'/>">Board</a></li>
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
        <li><a href=""><i class="fas fa-search small"></i></a></li>
    </ul>
</div>
<script>
    let msg =${msg}
    if(msg=="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.");
    if(msg=="DEL_ERR") alert("게시물 삭제에 실패하였습니다. 다시 시도해 주세요.");
    if(msg=="UPD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
</script>
<div class="container">
    <h2 class="writing-header">${mode=="new" ? "게시물 쓰기" : "게시물 읽기"}</h2>
    <form action="" class="frm" id="form" method="post">
        <input type="hidden" name="bno" value="${boardDto.bno}">
        <input type="text" name="title" value="${boardDto.title}" ${mode=="new" ? "" : "readonly='readonly'"}>
        <textarea name="content" id="" cols="30" rows="10" ${mode=="new" ? "" : "readonly='readonly'"}>${boardDto.content}</textarea>

        <c:if test="${mode eq 'new'}">
            <button type="button" id="writeBtn" class="btn btn-write"><i class="fa fa-pencil"></i>등록</button>
        </c:if>
        <c:if test="${mode ne 'new'}">
            <button type="button" id="writeNewBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 글쓰기</button>
        </c:if>

        <c:if test="${boardDto.writer eq loginId}">
            <button type="button" id="modifyBtn" class="btn btn-modify"><i class="fa fa-edit"></i>수정</button>
            <button type="button" id="deleteBtn" class="btn btn-delete"><i class="fa fa-trash"></i>삭제</button>
        </c:if>
        <button type="button" id="listBtn" class="btn"><i class="fa fa-bars"></i>목록</button>
    </form>
</div>
<script>
    $(document).ready(function(){
        let formCheck = function(){
            let form = document.getElementById("form");
            if(form.title.value==""){
                alert("제목을 입력해 주세요.");
                form.title.focus();
                return false;
            }
            if(form.content.value==""){
                alert("내용을 입력해 주세요.");
                form.content.focus();
                return false;
            }
            return true;
        }

        $("#modifyBtn").on("click", function(){
            let form = $("#form");
            let isReadOnly = $("input[name=title]").attr('readonly');

            if(isReadOnly=='readonly'){
                $("input[name=title]").attr('readonly', false);
                $("textarea").attr('readonly',false);
                $("#modifyBtn").html("등록");
                $("h2").html("게시물 수정");
                return;
            }
            form.attr("action", "<c:url value='/board/update'/>?page=${page}&pageSize=${pageSize}");
            form.attr("method", "post");
            form.submit();
        });

        $("#writeNewBtn").on("click", function(){
            location.href="<c:url value='/board/write'/>";
        });


        $('#listBtn').on("click", function(){
            location.href = "<c:url value='/board/list'/>?page=${page}&pageSize=${pageSize}";
        });


        $("#writeBtn").on("click", function(){
            let form = $("#form");
            form.attr("action", "<c:url value='/board/write'/>");
            form.attr("method", "post");
            if(formCheck())
                form.submit();

        });

        $("#deleteBtn").on("click", function(){
            if(!confirm('정말로 삭제하시겠습니까?')) return;
            let form = $("#form");
            form.attr("action", "<c:url value='/board/delete'/>?page=${page}&pageSize=${pageSize}");
            form.attr("method", "post");
            form.submit();
        });
    });
</script>
</body>
</html>