package co.kh.board.action;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.kh.board.control.ActionForward;
import co.kh.board.model.BoardDAO;
import co.kh.board.model.BoardVO;

public class ListAction implements CommandAction
{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		request.setCharacterEncoding("UTF-8");
		String pageNum = request.getParameter("pageNum");// 페이지번호

		if (pageNum == null) {
			pageNum = "1";
		}
		int pageSize = 5;// 한 페이지의 글의 개수
		int currentPage = Integer.parseInt(pageNum);
		// 한 페이지의 시작글 번호
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;// 한 페이지의 마지막 글번호
		int count = 0;
		int number = 0;
		List<BoardVO> articleList = null;
		BoardDAO dbPro = BoardDAO.getInstance();// DB연동
		count = dbPro.selectCountDB();
		if (count > 0) {// 현재 페이지에 해당하는 글 목록
			articleList = dbPro.selectStartEndDB(startRow, endRow);
		} else {
			articleList = Collections.emptyList();
		}

		number = count - (currentPage - 1) * pageSize;// 글목록에 표시할 글번호

		// 해당 뷰에서 사용할 속성 new Integer(currentPage) deprecated
		// new Integer(currentPage) => currentPage 적어도 된다.
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", startRow);
		request.setAttribute("endRow", endRow);
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("number", number);
		request.setAttribute("articleList", articleList);

		return new ActionForward("/board/list.jsp", false);
	}
}
//
//	<%@page import="java.text.SimpleDateFormat"%>
//	<%@page import="com.kh.edu.board.model.BoardVO"%>
//	<%@page import="java.util.List"%>
//	<%@ page contentType="text/html; charset=UTF-8" %>
//	<%@ include file="view/color.jsp"%>
//	<%
//	int currentPage = (Integer)request.getAttribute("currentPage");
//	int startRow = (Integer)request.getAttribute("startRow");
//	int endRow= (Integer)request.getAttribute("endRow");
//	int count = (Integer)request.getAttribute("count");
//	int pageSize= (Integer)request.getAttribute("pageSize");
//	int number = (Integer)request.getAttribute("number");
//	List<BoardVO> articleList =(List<BoardVO>)request.getAttribute("articleList");
//	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//	%>
//	<!DOCTYPE html>
//	<html>
//	<head>
//	<title>게시판</title>
//	<link href="style.css" rel="stylesheet" type="text/css">
//	</head>
//	<body bgcolor="<%=bodyback_c%>">
//	<main>
//		<b>글목록(전체 글:<%=count%>)</b>
//	<table width="700">
//	  <tr>
//	    <td align="right" bgcolor="<%=value_c%>">
//	    <a href="writeForm.jsp">글쓰기</a>
//	    </td>
//	  </tr>
//	</table>
//	<%
//	    if (count == 0) {
//	%>
//	<table width="700" border="1" cellpadding="0" cellspacing="0">
//	<tr>
//	    <td align="center">
//	    게시판에 저장된 글이 없습니다.
//	    </td>
//	</table>
//	<%  } else {    %>
//	<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
//	    <tr height="30" bgcolor="<%=value_c%>"> 
//	      <td align="center"  width="50"  >번 호</td> 
//	      <td align="center"  width="250" >제   목</td> 
//	      <td align="center"  width="100" >작성자</td>
//	      <td align="center"  width="150" >작성일</td> 
//	      <td align="center"  width="50" >조 회</td> 
//	      <td align="center"  width="100" >IP</td>    
//	    </tr>
//	<%  
//	    for ( BoardVO article : articleList) {
//	%>
//	   <tr height="30">
//	    <td align="center"  width="50" > <%= number--%></td>
//	    <td  width="250" >
//	    <!-- 수정 <5> -->
//	    <a href="content.jsp?num=<%=article.getNum()%>&pageNum=1">
//		 <!-- 수정<6> -->
//	<%
//				//6. depth 값에 따라서 5배수 증가를 해서 화면에 보여줘야된다.
//				//depth : 1 => 길이 : 5, 2 => 10
//	      int wid=0; 
//	      if(article.getDepth()>0){
//	        wid=5*(article.getDepth());
//	%>
//	       <img src="images/level.gif" width="<%=wid%>" height="16">
//	       <img src="images/re.gif">
//	<%    }else{%>
//	       <img src="images/level.gif" width="<%=wid%>" height="16">
//	<%}%>
//	          <%=article.getSubject()%></a> 
//	          <% if(article.getReadcount()>=20){%>
//	         <img src="images/hot.gif" border="0"  height="16"><%}%> </td>
//	    <td align="center"  width="100"> 
//	       <a href="mailto:<%=article.getEmail()%>">
//			<%=article.getWriter()%></a></td>
//	    <td align="center"  width="150">
//			<%= sdf.format(article.getRegdate())%></td>
//	    <td align="center"  width="50"><%=article.getReadcount()%></td>
//	    <td align="center" width="100" ><%=article.getIp()%></td>
//	  </tr>
//	     <%}%>
//	<%}%>
//	</table>
//	</main>
//	<br><br>
//	<!-- 수정 <7> -->
//	<div align="center">
//	<%    if (count > 0) {
//	      int pageBlock = 3;    //보여줄페이지
//	      int imsi = count % pageSize == 0 ? 0 : 1;
//	      int pageCount = count / pageSize + imsi;
//	      int startPage = (int)((currentPage-1)/pageBlock)*pageBlock + 1;
//	      int endPage = startPage + pageBlock - 1;
//	      if (endPage > pageCount) endPage = pageCount;  
//	      if (startPage > pageBlock) {    %>
//	      <a href="list.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
//	
//	<%    }
//	      for (int i = startPage ; i <= endPage ; i++) {
//	    	  if(currentPage == i){
//	%>
//	    		  <a href="list.jsp?pageNum=<%= i %>">[{<%= i %>}]</a>
//	<%    	}else{ %>
//	    		   <a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
//	<%  	  } %>
//	       
//	<%
//	      }
//	      if (endPage < pageCount) {  %>
//	      <a href="list.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
//	<%
//	        }
//	    }
//	%>
//	</div>
//	</body>
//	</html><%@page import="java.text.SimpleDateFormat"%>
//	<%@page import="com.kh.edu.board.model.BoardVO"%>
//	<%@page import="java.util.List"%>
//	<%@ page contentType="text/html; charset=UTF-8" %>
//	<%@ include file="view/color.jsp"%>
//	<%
//	int currentPage = (Integer)request.getAttribute("currentPage");
//	int startRow = (Integer)request.getAttribute("startRow");
//	int endRow= (Integer)request.getAttribute("endRow");
//	int count = (Integer)request.getAttribute("count");
//	int pageSize= (Integer)request.getAttribute("pageSize");
//	int number = (Integer)request.getAttribute("number");
//	List<BoardVO> articleList =(List<BoardVO>)request.getAttribute("articleList");
//	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//	%>
//	<!DOCTYPE html>
//	<html>
//	<head>
//	<title>게시판</title>
//	<link href="style.css" rel="stylesheet" type="text/css">
//	</head>
//	<body bgcolor="<%=bodyback_c%>">
//	<main>
//		<b>글목록(전체 글:<%=count%>)</b>
//	<table width="700">
//	  <tr>
//	    <td align="right" bgcolor="<%=value_c%>">
//	    <a href="writeForm.jsp">글쓰기</a>
//	    </td>
//	  </tr>
//	</table>
//	<%
//	    if (count == 0) {
//	%>
//	<table width="700" border="1" cellpadding="0" cellspacing="0">
//	<tr>
//	    <td align="center">
//	    게시판에 저장된 글이 없습니다.
//	    </td>
//	</table>
//	<%  } else {    %>
//	<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
//	    <tr height="30" bgcolor="<%=value_c%>"> 
//	      <td align="center"  width="50"  >번 호</td> 
//	      <td align="center"  width="250" >제   목</td> 
//	      <td align="center"  width="100" >작성자</td>
//	      <td align="center"  width="150" >작성일</td> 
//	      <td align="center"  width="50" >조 회</td> 
//	      <td align="center"  width="100" >IP</td>    
//	    </tr>
//	<%  
//	    for ( BoardVO article : articleList) {
//	%>
//	   <tr height="30">
//	    <td align="center"  width="50" > <%= number--%></td>
//	    <td  width="250" >
//	    <!-- 수정 <5> -->
//	    <a href="content.jsp?num=<%=article.getNum()%>&pageNum=1">
//		 <!-- 수정<6> -->
//	<%
//				//6. depth 값에 따라서 5배수 증가를 해서 화면에 보여줘야된다.
//				//depth : 1 => 길이 : 5, 2 => 10
//	      int wid=0; 
//	      if(article.getDepth()>0){
//	        wid=5*(article.getDepth());
//	%>
//	       <img src="images/level.gif" width="<%=wid%>" height="16">
//	       <img src="images/re.gif">
//	<%    }else{%>
//	       <img src="images/level.gif" width="<%=wid%>" height="16">
//	<%}%>
//	          <%=article.getSubject()%></a> 
//	          <% if(article.getReadcount()>=20){%>
//	         <img src="images/hot.gif" border="0"  height="16"><%}%> </td>
//	    <td align="center"  width="100"> 
//	       <a href="mailto:<%=article.getEmail()%>">
//			<%=article.getWriter()%></a></td>
//	    <td align="center"  width="150">
//			<%= sdf.format(article.getRegdate())%></td>
//	    <td align="center"  width="50"><%=article.getReadcount()%></td>
//	    <td align="center" width="100" ><%=article.getIp()%></td>
//	  </tr>
//	     <%}%>
//	<%}%>
//	</table>
//	</main>
//	<br><br>
//	<!-- 수정 <7> -->
//	<div align="center">
//	<%    if (count > 0) {
//	      int pageBlock = 3;    //보여줄페이지
//	      int imsi = count % pageSize == 0 ? 0 : 1;
//	      int pageCount = count / pageSize + imsi;
//	      int startPage = (int)((currentPage-1)/pageBlock)*pageBlock + 1;
//	      int endPage = startPage + pageBlock - 1;
//	      if (endPage > pageCount) endPage = pageCount;  
//	      if (startPage > pageBlock) {    %>
//	      <a href="list.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
//
//	<%    }
//	      for (int i = startPage ; i <= endPage ; i++) {
//	    	  if(currentPage == i){
//	%>
//	    		  <a href="list.jsp?pageNum=<%= i %>">[{<%= i %>}]</a>
//	<%    	}else{ %>
//	    		   <a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
//	<%  	  } %>
//	       
//	<%
//	      }
//	      if (endPage < pageCount) {  %>
//	      <a href="list.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
//	<%
//	        }
//	    }
//	%>
//	</div>
//	</body>
//	</html>
//}