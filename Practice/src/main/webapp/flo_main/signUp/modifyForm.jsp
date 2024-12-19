<%@page import="com.flo.model.MemberVO"%>
<%@page import="com.flo.model.MemberDAO"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.flo.model.*"%>

<jsp:useBean id="dao" class="com.flo.model.MemberDAO" />

<!DOCTYPE html>
<html>
<head>
<title>Update Form</title>
<link rel="stylesheet" href="../style.css">
<script language="javascript" src="script.js?timestamp=<%= System.currentTimeMillis() %>"></script>
<%-- <script language="javascript" src="script.js" <% System.currentTimeMillis(); %>></script> --%>
</head>
<%
	/* String loginID = (String) session.getAttribute("loginID");
	StudentVO svo = dao.getMember(loginID); */
	
	String id = (String) session.getAttribute("id");
	MemberVO mvo = dao.getMember(id);
	
/* 	String id = (String) session.getAttribute("id");
	String pass = (String) session.getAttribute("pass");
	StudentVO svo = new StudentVO();
	svo.setId(id);
	StudentDAO sdao = new StudentDAO ();
	svo = sdao.getMember(svo); */
%>

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
		<form name="regForm" method="post" action="modifyProc.jsp">
			<table border="1" align="center">
				<tr>
					<td colspan="2" align="center">회원 수정 정보 입력</td>
				</tr>
				<tr>
					<td align="right">아이디 :</td>
					<td><%=mvo.getId()%></td>
				</tr>
				<tr>
					<td align="right">패스워드 :</td>
					<td><input type="password" name="pass"
						value="<%=mvo.getPwd()%>" /></td>
				</tr>
				<tr>
					<td align="right">패스워드 확인:</td>
					<td><input type="password" name="repass"
						value="<%=mvo.getPwd()%>" /></td>
				</tr>
				<tr>
					<td align="right">이름 :</td>
					<td><%=mvo.getName()%></td>
				</tr>
				<tr>
					<td align="right">전화번호 :</td>
					<td><input type="text" name="phone1" size="4"
						value="<%=mvo.getPhone1()%>" /> - <input type="text" name="phone2"
						size="5" value="<%=mvo.getPhone2()%>" /> - <input type="text"
						name="phone3" size="5" value="<%=mvo.getPhone3()%>" /></td>
				</tr>
				<tr>
					<td align="right">이메일 :</td>
					<td><input type="text" name="email" value="<%=mvo.getEmail()%>" /></td>
				</tr>
				<tr>
					<td align="right">우편번호 :</td>
					<td><input type="text" name="zipcode"
						value="<%=mvo.getZipCode()%>" /> <input type="button" value="찾기"
						onClick="zipCheck()" /></td>
				</tr>
				<tr>
					<td align="right">주소1 :</td>
					<td><input type="text" name="address1" size="50"
						value="<%=mvo.getAddress1()%>" /></td>
				</tr>
				<tr>
					<td align="right">주소2 :</td>
					<td><input type="text" name="address2" size="30"
						value="<%=mvo.getAddress2()%>" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="button"value="정보수정" onClick="updateCheck()" />
						&nbsp;&nbsp;
					<input type="button" value="취소" 	onClick="javascript:window.location='signIn.jsp'" />
					</td>
				</tr>
			</table>
		</form>
		
		<div id="fixed_icons">
        <i class="fa-solid fa-play fa-2x" id="play_button" style="color: #333333;"></i>
        <!-- <a href="main.html"><span id=up_fixed><i class="fa-solid fa-arrow-up fa-2x"></i></span></a>
        <a href="main.html"><span id=settings_fixed><i class="fa-solid fa-gear fa-2x"></i></span></a> -->
    </div>
</body>
</html>