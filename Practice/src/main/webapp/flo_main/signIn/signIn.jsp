<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.*" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="javax.*" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가볍게, 나답게 FLO</title>
    
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

    <script src="https://kit.fontawesome.com/b551008ea2.js" crossorigin="anonymous"></script>
    <script src="../carousel.js"></script>
    <link rel="stylesheet" href="../style.css">

</head>
<body onload="carousel();">
    <div class="menu">
        <ul class="menu_contents_left">
            <li><a href="Flo_Main.html">FLO</a></li>    <!--폰트 스타일 적용하기.-->
            <li><a href="Flo_Main.html">둘러보기</a></li>
            <li><a href="Flo_Main.html">보관함</a></li>
            <li><a href="Flo_Main.html">이용권</a></li>
        </ul>
        
        <ul class="menu_contents_center">
            <li><i class="fa-solid fa-magnifying-glass"></i><input type="text" name="search" id="search" placeholder="검색어를 입력하세요."></li>
        </ul>

        <ul class="menu_contents_right">
            <li><a href="signsignUp.jspUp">로그인</a></li>
            
            
            <li><a href="Flo_Main.html">회원가입</a></li>
        </ul>
    </div>

    <!-- 회전목마 구간. -->
    <div class="slideShow">
        <!-- slideShow안에 3명의 자식. -->
         <!-- onmouseenter="" 안씀. -->
        <div class="slideShow_slides">
            <a href="#"><img src="../img/flo1.png" alt="slide-1"></a>
            <a href="#"><img src="../img/flo2.png" alt="slide-2"></a>
            <a href="#"><img src="../img/flo3.png" alt="slide-3"></a>
            <a href="#"><img src="../img/flo4.png" alt="slide-4"></a>
        </div>

        <!-- 아이콘. -->
        <div class="slideShow_nav">
            <a href="#" class="pre"><i class="fa-solid fa-circle-chevron-left"></i></a>
            <a href="#" class="next"><i class="fa-solid fa-circle-chevron-right"></i></a>
        </div>

        <div class="slideShow_indicator">
            <a href="#" class="active"><i class="fa-solid fa-circle-dot"></i></a>
            <a href="#"><i class="fa-solid fa-circle-dot"></i></a>
            <a href="#"><i class="fa-solid fa-circle-dot"></i></a>
            <a href="#"><i class="fa-solid fa-circle-dot"></i></a>
        </div>
    </div>

    <div id="testing">
    <form action="/Practice/mainPage" method="post">
        <label for="id">아이디</label>
        <input type="text" name="id" id="id"><p id="idText"></p>
        <label for="pwd" method="post">패스워드</label>
        <input type="password" name="pwd" id="pwd"><p id="idPwd"></p>
        <br>
        <input type="submit" value="로그인" id="signIn"></input>
    </form>
    
    
    </div>

    <div id="fixed_icons">
        <i class="fa-solid fa-play fa-2x" id="play_button" style="color: #333333;"></i>
        <!-- <a href="main.html"><span id=up_fixed><i class="fa-solid fa-arrow-up fa-2x"></i></span></a>
        <a href="main.html"><span id=settings_fixed><i class="fa-solid fa-gear fa-2x"></i></span></a> -->
    </div>
</body>
</html>




<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="java.*" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="javax.*" %>



<%
	response.setContentType("text/html;charset=UTF-8");
	// String loginID = (String)session.getAttribute("loginID");
	String id = (String)session.getAttribute("id");
%>
<html>
<head>
<title>Log in</title>
<link href="style.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<main>
	<%
	if (id != null)
	{
	%>
	<table border="1" width="300">
		<tr>
			<td colspan="3" align="center"><%=id%>님 환영합니다.</td>
		</tr>
		<tr>
			<td align="center" width="100"><a href="modifyForm.jsp">정보수정</a></td>
			<td align="center" width="100"><a href="deleteForm.jsp">회원탈퇴</a></td>
			<td align="center" width="100"><a href="logout.jsp">로그아웃</a></td>
		</tr>
	</table>
	<%
	} else
	{
	%>
	<!-- 기존의 login.jsp 페이지의 내용 -->
	<form method="post" action="loginProc.jsp">
		<table width="300" border="1">
			<tr>
				<td colspan="2" align="center">회원 로그인</td>
			</tr>
			<tr>
				<td align="right" width="100">아이디 :</td>
				<td width="200">
				&nbsp;&nbsp;
				<input type="text" name="id" size="20" /></td>
			</tr>
			<tr>
				<td align="right" width="100">비밀번호 :</td>
				<td width="200">&nbsp;&nbsp; <input type="password" name="pass"
					size="20" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="로그인" />
					&nbsp;&nbsp;
					<input type="button" value="회원가입" onClick="javascript:window.location='regForm.jsp'" />
				</td>
			</tr>
		</table>
	</form>
	</main>
</body>
</html>
	<%
	}
	%>


