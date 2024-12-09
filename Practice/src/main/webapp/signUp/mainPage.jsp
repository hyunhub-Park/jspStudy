<%@page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
    <style>
        body
        {
            padding-top: 20px;
            height: 100vh;
        }

        form
        {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid gray;
        }

        form label
        {
            display: inline-block;
            width: 100px;
        }
        
        form #signUp, #signIn
        {
            width: 100%;
            padding: 8px;
            display: block;
            background-color: aquamarine;
        }
        
        form input
        {
            display: inline-block;
            width: 285px;
            border: none;
            border-bottom: 1px dotted black;
            outline: none;
        }

        form p
        {
            font-size: 8px;
            margin-left: 105px;
        }
    </style>
</head>
<body>
<form action="/Practice/mainPage" method="post">
        <label for="id">아이디</label>
        <input type="text" name="id" id="id"><p id="idText"></p>
        <label for="pwd" method="post">패스워드</label>
        <input type="password" name="pwd" id="pwd"><p id="idPwd"></p>
        <br>
        <input type="submit" value="회원가입" id="signUp"></input>
        <input type="submit" value="로그인" id="signIn"></input>
    </form>
</body>
</html>