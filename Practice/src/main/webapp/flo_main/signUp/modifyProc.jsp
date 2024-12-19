<%@page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.flo.model.*"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dao" class="com.flo.model.MemberDAO"/>
<jsp:useBean id="mvo" class="com.flo.model.MemberVO">
<jsp:setProperty name="svo" property="*"/></jsp:useBean>

<%
	String loginID = (String)session.getAttribute("loginID");
	mvo.setId(loginID);
	dao.updateMember(mvo);
%>

<!DOCTYPE html>
<html>
<head>
<title>Update Process</title>
<link rel="stylesheet" href="../style.css">
</head>
<!-- <meta http-equiv="Refresh" content="3;url=login.jsp"> -->
<div class="menu">
        <ul class="menu_contents_left">
            <li><a href="main.jsp" class="logo">FLO</a></li>    <!--폰트 스타일 적용하기.-->
            <li><a href="Flo_Main.html">둘러보기</a></li>
            <li><a href="Flo_Main.html">보관함</a></li>
            <li><a href="Flo_Main.html">이용권</a></li>
        </ul>
        
        <ul class="menu_contents_center">
            <li><i class="fa-solid fa-magnifying-glass"></i><input type="text" name="search" id="search" placeholder="검색어를 입력하세요."></li>
        </ul>

        <ul class="menu_contents_right">
            <li><a href="signIn.jsp">로그인</a></li>
            
            
            <li><a href="/Practice/flo_main/signUp/signUp.jsp">회원가입</a></li>
        </ul>
    </div>
<body>
	<main>
		<h2> 회원정보 수정이 완료되었습니다.</h2>
		<br></br>
		<a href="signIn.jsp">이전으로</a>
		<!-- 	<font size="5" face="바탕체"> 입력하신 내용대로
		<b>회원정보가 수정 되었습니다.</b>
		<br></br>
			3초후에 Logon Page로 이동합니다
		</font> -->
	</main>
	<div id="fixed_icons">
        <i class="fa-solid fa-play fa-2x" id="play_button" style="color: #333333;"></i>
        <!-- <a href="main.html"><span id=up_fixed><i class="fa-solid fa-arrow-up fa-2x"></i></span></a>
        <a href="main.html"><span id=settings_fixed><i class="fa-solid fa-gear fa-2x"></i></span></a> -->
    </div>
</body>
</html>