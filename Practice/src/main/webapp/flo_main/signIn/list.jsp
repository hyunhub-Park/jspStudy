<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.flo.model.BoardDAO"%>
<%@ page import="com.flo.model.BoardVO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%-- <%!
	// 전역변수.
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%> --%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	// 수정 <1> 1. [페이징 기법]페이지 사이즈 : 1페이지당 10개 출력.
	int pageSize = 20;
	
	// 2. [페이징 기법]페이지 번호 선택. (default : 1page)
	/* request.setCharacterEncoding("UTF-8"); -> 한글일때만 의미 있기 때문에.*/
	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null)
	{
		pageNum="1";
	}
	
	// 3. 현재 페이지 설정, start and end.
	int currentPage = Integer.parseInt(pageNum);
	int start = (currentPage-1)*pageSize + 1;	// (시작)4page의 경우 31~40이니까 (4-1)*10 + 1 => 31
	int end = (currentPage)*pageSize;	// (끝)4*10 => 40
%>
<%
	// 4. 해당된 페이지 10개를 가져옴.
	int number = 0;
	
	ArrayList<BoardVO> boardList = null;
	
	BoardDAO bdao = BoardDAO.getInstance();
	
	// 전체 글의 갯수.
	int count = bdao.selectCountDB();

	if (count > 0)
	{
		// 현재 페이지 내용 10개 출력(글의 목록을 num으로 desc)).
	
		boardList = bdao.selectStartEndDB(start, end);
	}
	
	// 5. 4페이지 출력 시, (31~40번)num은 40이 세팅되어야 함. 40-39-38-37-36
	// 전체 갯수 100페이지라면, 1페이지에 (100~91).
	number = count - (currentPage-1)*pageSize;	// 0으로 초기화.
	
	// 6. depth값에 따라 5배수를 증가시켜 화면에 출력해야 함.
	// ex) depth가 1이면 => 길이5, 2= >10.
/* 	int wid = 0;
	if (data.getDepth() > 0)
	{
		wid = 5 * data.getDepth();
	} */
		
	
%>

<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
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
<script language="javascript" src="script.js?timestamp=<%= System.currentTimeMillis() %>"></script>
<script language="javascript" src="Bscript.js?timestamp=<%= System.currentTimeMillis() %>"></script>

</head>
<body id="listBody">
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
		<b>글목록(전체 글:<%=count%>)
		</b>
		<table width="700">
			<tr>
				<td align="right">
					<a href="writeForm.jsp">글쓰기</a>
				</td>
			</tr>
		</table>
<%
		if (count == 0)
		{	// 보여줄 게시글 없음.
%>
		<table width="700" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">게시판에 저장된 글이 없습니다.</td>
		</table>
<%
		} else
		{
%>
		<table id="bt" border="1" width="700" cellpadding="0" cellspacing="0" align="center">
			<tr height="30">
				<td align="center" width="50">번 호</td>
				<td align="center" width="250">제 목</td>
				<td align="center" width="100">작성자</td>
				<td align="center" width="150">작성일</td>
				<td align="center" width="50">조 회</td>
				<td align="center" width="100">IP</td>
			</tr>
<%
/* 			for (int i = 0; i < articleList.size(); i++) {
				BoardVO article = (BoardVO) articleList.get(i); */
				
/* 				for (BoardVO article : boardList)
				{
					// 6. depth값에 따라 5배수를 증가시켜 화면에 출력해야 함.
					// ex) depth가 1이면 => 길이5, 2= >10.
					int wid = 0;
					if (article.getDepth() > 0)
					{
						wid = 5 * article.getDepth();
					}  */
					
			for (BoardVO article : boardList)
			{
					
%>
			<tr height="30">								<!-- 50, 49, 48 ...  -->
				<td align="center" width="50"><%=number--%></td>
				<td width="250">
				<a href="content.jsp?num=<%=article.getNum()%>&pageNum=1"> <%-- <%=article.getSubject()%> </a> --%>

<%
				//6. depth값에 따라 5배수를 증가시켜 화면에 출력해야 함.
				// ex) depth가 1이면 => 길이5, 2= >10.
				/* int wid=0;  */
				if(article.getDepth()>0)
				{
					/* wid=5*(article.getDepth()); */
%>
				<img src="images/level.gif" width="5px" height="5px">
				<img src="images/re.gif">
<%
				} else
				{
%>
			 	<img src="images/level.gif" width="5px" height="5px">
<%
				}
%>


<%=article.getSubject() %></a>

<%
				if (article.getReadcount() >= 20)
				{
 %>
 					<img src="images/hot.gif" border="0" height="16">
 <%} %></td>
				<td align="center" width="100">
				<a href="mailto:<%=article.getEmail()%>"> <%=article.getWriter()%></a>
				</td>
				<td align="center" width="150"><%=sdf.format(article.getRegdate())%></td>
				<td align="center" width="50"><%=article.getReadcount()%></td>
				<td align="center" width="100"><%=article.getIp()%></td>
			</tr>
<%
			}
%>
<%
		}
%>
		</table>

	<br>
<div align="center">		
<%
 if (count > 0)
 {
	 int pageBlock = 3;
	 int imsi = count % pageSize == 0 ? 0 : 1;
	 int pageCount = count / pageSize + imsi;
	 int startPage = (int)((currentPage-1)/pageBlock)*pageBlock + 1;
	 int endPage = startPage + pageBlock - 1;
	if (endPage > pageCount) endPage = pageCount; 
 	if (startPage > pageBlock)
 {
 %>
		<a href="list.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
		<%
 }
 for (int i = startPage ; i <= endPage ; i++) 
{
	 
		if (currentPage == i) 
		{
			%>
			<a href="list.jsp?pageNum=<%= i %>">[[<%= i %>]] </a>
		<% } else
		{%>
		<a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
	<% }%>	
<%
 }
 if (endPage < pageCount) { %>
		<a href="list.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
		<%
 }
 }
%>
</div>

<div id="fixed_icons_bar"></div>
    
    <div id="fixed_icons">
        <i class="fa-solid fa-play fa-2x" id="play_button" style="color: #333333;"></i>
        <i class="fa-solid fa-forward-step fa-2x" id="forward_button" style="color: #333333;"></i>
        <i class="fa-solid fa-backward-step fa-2x" id="backward_button" style="color: #333333;"></i>
        <!-- <a href="main.html"><span id=up_fixed><i class="fa-solid fa-arrow-up fa-2x"></i></span></a>
        <a href="main.html"><span id=settings_fixed><i class="fa-solid fa-gear fa-2x"></i></span></a> -->
    </div>
    
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