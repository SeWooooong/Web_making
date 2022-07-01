<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="com.park.model.Board" %>
<%@ page import="com.park.model.comment" %>
<%@page import="java.util.List"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script></head>
    
<html>
    <head>
        <title>Content</title>
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
        </style>
        </head>
    <body onload="changeImg()">
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
        <Br><br><br>
        <%Board board = (Board)request.getAttribute("content");%>
      
        <div class="container">
        <div class="form-group">
        <label for="title"><font size="18px">제목</font></label>
         <input type="text" style="font-size:20px;" class="form-control" value=<%=board.getTitle() %> readonly>
        </div>
         <div class="form-group">
          <label for="content"><font size="18px">내용</font></label>
         <textarea class="form-control" style="font-size:20px;" readonly><%=board.getContent()%></textarea>
         </div>
           <div class="form-group">
         <label for="writer"><font size="18px">작성자</font></label>
         <input type="text" class="form-control" style="font-size:20px;" value=<%=board.getID()%> readonly>
         </div>
         
         
 
         <% List<comment> cont = (List)request.getAttribute("comlist"); %>
         <%if(cont != null){%>
          <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; margin:auto;">
           <tr> <th style="background-color: #eeeeee; text-align: center;">번호</th> <th style="background-color: #eeeeee; text-align: center;">작성자</th>  <th style="background-color: #eeeeee; text-align: center;">내용</th> </tr>
           <%for(int i=0; i<cont.size(); ++i){ %>
           <tr> <td><%=i+1%></td> <td><%=cont.get(i).getID()%></td> <td><%=cont.get(i).getComment() %></td> </tr>        
          <%}%>
         </table>
          <%}%>
         
         <br><br>
         <div class="form-group">
         <label for="content"><font size="5px">댓글쓰기</font></label>
         <form method="post" action="CommentController" >
         <input type="hidden" value=<%=board.getNum()%> name="num">
         <input type="hidden" value=<%=id %> name ="id">
         <textarea class="form-control" style="font-size:20px;" name="comment" ></textarea>
         <input type="submit" value="제출">
         </form>
         </div>
         </div>
        
</body>
</html>