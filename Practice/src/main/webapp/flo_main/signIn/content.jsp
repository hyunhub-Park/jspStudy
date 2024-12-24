<%@page import="com.flo.model.BoardDAO"%>
<%@page import="com.flo.model.BoardVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 1.사용자정보를 가져온다  -->
<%
request.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
BoardVO vo = new BoardVO();
vo.setNum(num);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<!-- 2.curd  -->
<%
try {
	BoardDAO bdao = BoardDAO.getInstance();
	BoardVO bvo = bdao.selectBoardDB(vo);
	int _num = vo.getNum();
	int ref = bvo.getRef();
	int step = bvo.getStep();
	int depth = bvo.getDepth();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="Bscript.js?timestamp=<%= System.currentTimeMillis() %>"></script>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
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
		<form>
			<table width="500" border="1" cellspacing="0" cellpadding="0" id="ct">
				<tr height="30">
					<td align="center" width="125">글번호</td>
					<td align="center" width="125" align="center"><%=bvo.getNum()%></td>
					<td align="center" width="125" >조회수</td>
					<td align="center" width="125" align="center"><%=bvo.getReadcount()%></td>
				</tr>
				<tr height="30">
					<td align="center" width="125" >작성자</td>
					<td align="center" width="125" align="center"><%=bvo.getWriter()%></td>
					<td align="center" width="125" >작성일</td>
					<td align="center" width="125" align="center"><%=sdf.format(bvo.getRegdate())%></td>
				</tr>
				<tr height="30">
					<td align="center" width="125" >글제목</td>
					<td align="center" width="375" align="center" colspan="3"><%=bvo.getSubject()%></td>
				</tr>
				<tr>
					<td align="center" width="125" >글내용</td>
					<td align="left" width="375" colspan="3"><pre><%=bvo.getContent()%></pre></td>
				</tr>
				<tr height="30">
					<td colspan="4"  align="right"><input
						type="button" value="글수정"
						onclick="document.location.href='updateForm.jsp?num=<%=_num%>&pageNum=<%=pageNum%>'">
						&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="글삭제"
						onclick="document.location.href='BdeleteForm.jsp?num=<%=_num%>&pageNum=<%=pageNum%>'">
						&nbsp;&nbsp;&nbsp;&nbsp; 
						<!-- 수정<1> -->
						<input type="button" value="답글쓰기" 
						  onclick="document.location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&step=<%=step%>&depth=<%=depth%>'">
             &nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="button" value="글목록"	
						onclick="document.location.href='board.jsp?pageNum=<%=pageNum%>'">
						
						
						
<%-- 						<input type="button" value="글수정" onclick="document.location.href='updateForm.jsp?num=<%=_num%>&pageNum=<%=pageNum%>'">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="글삭제" onclick="document.location.href='deleteForm.jsp?num=<%=_num%>&pageNum=<%=pageNum%>'">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<!-- 수정<1> -->
						 <input type="button" value="답글쓰기" onclick="document.location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&step=<%=step%>&depth=<%=depth%>'">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="글목록" onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'"> --%>
			
					</td>
				</tr>
			</table>
				<div id="fixed_icons_bar"></div>
    
    <div id="fixed_icons">
        <i class="fa-solid fa-play fa-2x" id="play_button" style="color: #333333;"></i>
        <i class="fa-solid fa-forward-step fa-2x" id="forward_button" style="color: #333333;"></i>
        <i class="fa-solid fa-backward-step fa-2x" id="backward_button" style="color: #333333;"></i>
        <!-- <a href="main.html"><span id=up_fixed><i class="fa-solid fa-arrow-up fa-2x"></i></span></a>
        <a href="main.html"><span id=settings_fixed><i class="fa-solid fa-gear fa-2x"></i></span></a> -->
    </div>
			<%
			} catch (Exception e) {
			}
			%>
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
</body>
</html>