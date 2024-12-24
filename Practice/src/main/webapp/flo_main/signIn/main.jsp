<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.*" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="javax.*" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/b551008ea2.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    
    
    <title>가볍게, 나답게 FLO</title>

    <script src="https://kit.fontawesome.com/b551008ea2.js" crossorigin="anonymous"></script>
    <script src="../carousel.js"></script>
    <link rel="stylesheet" href="../style.css">
        <link rel="stylesheet" href="style.css">

</head>
<body onload="carousel();">
    <div class="menu">
        <ul class="menu_contents_left">
            <li><a href="main.jsp" class="logo">FLO</a></li>    <!--폰트 스타일 적용하기.-->
            <li><a href="board.jsp">게시판</a></li>
            <li><a href="main.jsp">보관함</a></li>
            <li><a href="main.jsp">이용권</a></li>
        </ul>
        
        <ul class="menu_contents_center">
            <li><i class="fa-solid fa-magnifying-glass"></i><input type="text" name="search" id="search" placeholder="       검색어를 입력하세요."></li>
        </ul>

        <ul class="menu_contents_right">
            <li><a href="signIn.jsp">로그인</a></li>
            
            
            <li><a href="signUp.jsp">회원가입</a></li>
        </ul>
    </div>

    <!-- 회전목마 구간. -->
    <div class="slideShow">
        <!-- slideShow안에 3명의 자식. -->
         <!-- onmouseenter="" 안씀. -->
        <div class="slideShow_slides">
            <a href="#"><img src="../img/1.png" alt="slide-1"></a>
            <a href="#"><img src="../img/2.png" alt="slide-2"></a>
            <a href="#"><img src="../img/1.png" alt="slide-1"></a>
            <a href="#"><img src="../img/2.png" alt="slide-2"></a>
        </div>

        <!-- 아이콘. -->
        <div class="slideShow_nav">
            <a href="#" class="pre"><i class="fa-solid fa-chevron-left fa-2xs"></i></i></a>
            <a href="#" class="next"><i class="fa-solid fa-chevron-right fa-2xs"></i></i></a>
        </div>

        <div class="slideShow_indicator">
            <a href="#" class="active"><i class="fa-solid fa-circle fa-2xs"></i></i></a>
            <a href="#"><i class="fa-solid fa-circle fa-2xs"></i></a>
            <a href="#"><i class="fa-solid fa-circle fa-2xs"></i></a>
            <a href="#"><i class="fa-solid fa-circle fa-2xs"></i></a>
        </div>
    </div>
    
    <br>
    <br>
    
        <div id="testing"><img src="../img/main.png" alt="main" id="ip"></div>
        
        
    <div id="fixed_icons_bar"></div>

    <div id="fixed_icons">
        <i class="fa-solid fa-play fa-2x" id="play_button" style="color: #333333;"></i>
        <i class="fa-solid fa-forward-step fa-2x" id="forward_button" style="color: #333333;"></i>
        <i class="fa-solid fa-backward-step fa-2x" id="backward_button" style="color: #333333;"></i>
        <!-- <a href="main.html"><span id=up_fixed><i class="fa-solid fa-arrow-up fa-2x"></i></span></a>
        <a href="main.html"><span id=settings_fixed><i class="fa-solid fa-gear fa-2x"></i></span></a> -->
    </div>
    
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
</body>
</html>