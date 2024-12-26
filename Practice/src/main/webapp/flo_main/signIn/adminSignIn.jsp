<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.*" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="javax.*" %>

<%
	response.setContentType("text/html;charset=UTF-8");
	// String loginID = (String)session.getAttribute("loginID");
	String id = (String)session.getAttribute("id");
%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    
<script src="https://kit.fontawesome.com/b551008ea2.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="signIn.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가볍게, 나답게 FLO</title>
 
    <script src="https://kit.fontawesome.com/b551008ea2.js" crossorigin="anonymous"></script>
		<script src="../carousel.js"></script>
    <link rel="stylesheet" href="../style.css">
</head>
<body onload="carousel();">
    <div class="menu">
        <ul class="menu_contents_left">
            <li><a href="main.jsp" class="logo">FLO</a></li>    <!--폰트 스타일 적용하기.-->
            <li><a href="writeForm.jsp">게시판</a></li>
            <li><a href="Flo_Main.html">보관함</a></li>
            <li><a href="Flo_Main.html">이용권</a></li>
        </ul>
        
        <ul class="menu_contents_center">
            <li><i class="fa-solid fa-magnifying-glass"></i><input type="text" name="search" id="search" placeholder="       검색어를 입력하세요."></li>
        </ul>

        <ul class="menu_contents_right">
            <li><a href="signIn.jsp">로그인</a></li>
            
            
            <li><a href="signUp.jsp">회원가입</a></li>
        </ul>
    </div>
    
    <br>
		<br>
    
<%
	if (id != null)
	{
%>
	<div id="welcome" align="center">
            <h3><%=id%>님 환영합니다.</h3>
            <br>
            <br>
            <ul align="center">
                <li><a href="modifyForm.jsp">정보수정</a></li>
                <li><a href="deleteForm.jsp">회원탈퇴</a></li>
                <li><a href="logout.jsp">로그아웃</a></li>
            </ul>
        </div>
        
        <br>
        <br>
				<br>
				
				    <div id="fixed_icons_bar"></div>
	
	    <div id="fixed_icons">
        <i class="fa-solid fa-play fa-2x" id="play_button" style="color: #333333;"></i>
        <i class="fa-solid fa-forward-step fa-2x" id="forward_button" style="color: #333333;"></i>
        <i class="fa-solid fa-backward-step fa-2x" id="backward_button" style="color: #333333;"></i>
        <!-- <a href="main.html"><span id=up_fixed><i class="fa-solid fa-arrow-up fa-2x"></i></span></a>
        <a href="main.html"><span id=settings_fixed><i class="fa-solid fa-gear fa-2x"></i></span></a> -->
    </div>
<%
	} else
	{
%>
	<!-- 기존의 login.jsp 페이지의 내용 -->
<form method="post" action="signInProc.jsp">
        <div class="signIn" align="center">
            <div class="form-id inner-row v2">
                <input id="id" type="text" name="id" placeholder="아이디(이메일)" tabindex="0" autocomplete="on" autocorrect="off" spellcheck="false" class="inputTxt">
                <hr id="underLine">
                <br>
                <input id="pwd" name="pwd" type="password" placeholder="비밀번호" autocomplete="off" autocorrect="off" spellcheck="false" class="inputTxt">
                <hr id="underLine">
                <br>
                <span><input data-v-3b9efe22="" id="signinSavedId" type="checkbox">&nbsp;&nbsp;아이디 저장</span>
            </div>

            <!-- 소셜로그인시 넘어가는 링크까지는 넣어주기
            T ID - https://auth.skt-id.co.kr/v2/login?transaction_id=a3e23e28-0d01-4c52-8a7e-20508de0df25&state=193e2ae51f02d333137322d64&authenticator_type=SESSION&api_version=0 -->
            <br>
            <div class="signInBtn" align="center">
                <input id="signIn" type="submit" value="로그인">
            </div>

            <div class="findInfo">
                <ul>
                    <li>
                        <a href="#">아이디 찾기</a>
                    </li>
                    <p>｜　</p>
                    <li>
                        <a href="#">비밀번호 찾기</a>
                    </li>
                </ul>
            </div>

            <div class="howToSignIn" align="center">
                <ul>
                    <li id="tSignIn">
                        <a href="#">T 아이디로 로그인</a>
                    </li>
                    <li id="phoneSignIn">
                        <a href="#">휴대폰 번호로 로그인</a>
                    </li>
                </ul>
                <span>이 사이트는 reCAPTCHA로 보호되며 Google 개인정보처리방침 및 서비스 약관이 적용됩니다.</span>
            </div>
        </div>
    <div id="fixed_icons_bar"></div>
        
    <div id="fixed_icons">
        <i class="fa-solid fa-play fa-2x" id="play_button" style="color: #333333;"></i>
        <i class="fa-solid fa-forward-step fa-2x" id="forward_button" style="color: #333333;"></i>
        <i class="fa-solid fa-backward-step fa-2x" id="backward_button" style="color: #333333;"></i>
        <!-- <a href="main.html"><span id=up_fixed><i class="fa-solid fa-arrow-up fa-2x"></i></span></a>
        <a href="main.html"><span id=settings_fixed><i class="fa-solid fa-gear fa-2x"></i></span></a> -->
    </div>
	</form>
<%
	}
%>
         <br>
         <br>
     <hr id="footer_top">

    <footer>
        <div id="first">
            <ul id="first_ul">
                <li>　　　　　　　　　　　고객센터</li>
                <li>　　　　　　　　　　　공지사항</li>
                <li>　　　　　　　　　　　</li>
                <li>　　　　　　　　　　　</li>
            </ul>
        </div>

        <div id="second">
            <ul id="second_ul">
                <li>FLO 서비스</li>
                <li>FLO 크리에이터 스튜디오</li>
                <li>FLO 플레이어 다운로드</li>
                <li>서비스 소개</li>
            </ul>
        </div>

        <div id="third">
            <ul id="third_ul">
                <li>기업 정보</li>
                <li>회사소개</li>
                <li>인재 채용</li>
                <li>　</li>
            </ul>
        </div>

        <div id="fourth">
            <ul id="fourth_ul">
                <li>문의</li>
                <li>마케팅・광고・제휴 문의</li>
                <li>서비스 이용 문의</li>
                <li>음원 유통 문의</li>
            </ul>
        </div>
    </footer>