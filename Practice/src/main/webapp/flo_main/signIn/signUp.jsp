<%@page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>[FLO]REGISTER PAGE</title>
<link href="../style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../style.css">
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../script.js?timestamp=<%= System.currentTimeMillis() %>"></script>
<script src="https://kit.fontawesome.com/b551008ea2.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="signUp.css">
    <link rel="stylesheet" href="../style.css">
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
</head>

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
    
<form method="post" action="signUpProc.jsp" name="signUpForm">
	<div class="SignUp">
		<span id="title">회원 가입 정보 입력</span>
        <div class="specification">
            <ul>
                <li>
                    <span>아이디</span>
                    <input type="text" name="id" id="underId">
					&nbsp;
                    <input id="checkId" type="button" value="중복확인" onClick="idCheck()" />
					<br>
                    <span>비밀번호</span>
                    <input type="password" name="pwd">
					<br>
                    <span>비밀번호 확인</span>
                    <input type="password" name="repass">
					<br>
					<span>이름</span>
					<input type="text" name="name">
					<br>
					<span>전화번호</span>
					<select name="phone1">
						<option value="02">02</option>
						<option value="010">010</option>
					</select> - <input type="text" name="phone2" size="5" /> - <input type="text" name="phone3" size="5" />
					<br>
					<span>이메일</span>
					<input type="text" name="email" />
					<br>
					<span>우편번호</span>
					<input type="text" name="zipCode" />
					<input id="findZip" type="button" value="찾기" onClick="zipCheck()" />
					<br>
					<span>주소1</span>
					<input type="text" name="address1" size="40" />
					<br>
					<span>주소2</span>
					<input type="text" name="address2" size="30" />
					<br>
					<input id="signIn" type="button" value="회원가입" onClick="inputCheck()" />	<!-- 전송 전, 웹브라우저에서 정보를 점검 후 전송. -->
					&nbsp;&nbsp;
					<input id="reInput" type="reset" value="다시입력" />
				</li>
			</ul>
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
</html>