<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.util.List"%>
<%@ page import="com.park.model.Board" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>자유게시판</title>
<style>
   #select{
                width:100%;
                height: 50px;
                outline: 1px;
                background-color: black;
            }
            *{
                margin: 0;
                padding: 0;
            }
            a{
                text-decoration: none;
                color:white
            }
            li{
                list-style: none;
            }
            #menu1{
                width:500px;
                height:50px;
                outline: 1px;
            }
            #menu2{
                width:500px;
                height:50px;
                outline: 1px;
            }
            #menu3{
                width:500px;
                height:50px;
                outline: 1px;
            }
            #menu1 ul li{
                float:left;
                width: 25%;
                height:100%;
                line-height: 50px;
                text-align: center;
                background: black;
                display: block;
            }
            #menu2 ul li{
                float: right;
                width: 25%;
                height:100%;
                line-height: 50px;
                text-align: center;
                background: black;
                margin-right: auto;
            }
            #menu3 ul li{
                float: right;
                width: 25%;
                height:100%;
                line-height: 50px;
                text-align: center;
                background: black;
                margin-right: auto;
            }
            #menu1 ul li a{
              display: block;
            }
            #menu1 ul li a:hover{
              background:gray;
              color:black
            }
            #menu2 ul li a{
                display: block;
            }
            #menu2 ul li a:hover{
              background:gray;
              color:black
            }
            #menu3 ul li a{
                display: block;
            }
            #menu3 ul li a:hover{
              background:gray;
              color:black
            }
            .dropdown-menu{
                color:white;
                font-size: 16px;
                cursor:pointer;
            }
            .dropdown-content{
              position: absolute;
              background-color: rgb(46, 46, 46);
              min-width: 160px;
              box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
              display:none;
            }
            .dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;}   
            .dropdown:hover .dropdown-content {
    
                display: block;
            }
            .dropdown-content a:hover{
            background-color: #f1f1f1;
            }
   table{
       position:relative;
       width:50%;
       height:50%;
   } 
</style>
</head>
<body>
       <% String id = (String)request.getSession().getAttribute("memberID");%>	
         <div id="main">
        <div style="float:center; width:100%; text-align:center; color:white; background-color: black;"><font size="20"><a href="GameSite.jsp">레이싱 게임</a></font> </div>
        </div>
        <div id="select">
        <div id="menu1" style="float:left; width:33%">
            <ul>
                <li><a href='ScoreController'>랭킹</a></li>
                <li><a href='BoardController'>자유게시판</a></li> 
            </ul>
             </div>
        <div id="menu3" style="float:left; width:19%; color:white">
            <ul>
            <li><a href="Game.jsp">게임시작</a></li>
            </ul>
            </div>     
        <div id="menu2" style="float:right; width:33%">
            <ul>
               <%if(id==null){ %>
                <li><a href="login.jsp">로그인</a></li>
                <%}else{ %> 
                 <li style="color:white "><font size="2"><% out.print(id+"님이 로그인중입니다."); %></font> </li>
                <li><a href="logout.jsp">로그아웃</a>
                <%if(id.equals("abcd")){ %>
                <li class="dropdown">
                    <div class="dropdown-menu"><a href="GameManager">관리자게시판</a></div>
                    <div class="dropdown-content">
                    <a href="GameManager">유저관리</a>
                    <a href="BoardManager">게시판관리</a>
                    </div>
                </li>
                <%}} %>
                <li><a href="signup.jsp">회원가입</a></li>    
            </ul>
            </div>
        </div>
   <div>
   <br><br>
   <% List<Board> boardList = (List)request.getAttribute("boardList"); %>
    <h2 style="text-align:center">자유게시판</h2>
    <br>
   </div>
	<div class="container" >
		<div class="row" >
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; margin:auto;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<% for(int i=0; i<boardList.size(); i++){ %>
					<tr>
					   <td><%=boardList.get(i).getNum()%></td>
                       <td><a style="color:blue" href="BoardController?action=Content&id=<%=boardList.get(i).getID()%>&num=<%=boardList.get(i).getNum()%>" ><%=boardList.get(i).getTitle()%></a></td>
                    <td><%=boardList.get(i).getID() %></td>
                    <td><%=boardList.get(i).getDate() %></td>
                    <td><%=boardList.get(i).getHit() %></td>
					</tr>
					<%} %>
				</tbody>
			</table>
			<p style="position: absolute;left:80%  ;top:70%;" ><a style="color:blue"  href="write.jsp">글쓰기</a>
		</div>
	</div>	
	
</body>
</html>