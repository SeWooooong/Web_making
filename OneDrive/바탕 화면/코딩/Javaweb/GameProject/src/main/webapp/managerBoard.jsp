<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.util.List"%>
<%@ page import="com.park.model.Board" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
  
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <title>Game</title>
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
            margin : auto;
              text-align:center;
              width:80%;
            }
        </style>
          
    </head>
    <body>
    <% String id = (String)request.getSession().getAttribute("memberID");%>	
         <div id="main">
        <div style="float:center; width:100%; text-align:center; color:white; background-color: black;"><font size="20"><a href="GameSite.jsp">���̽� ����</a></font> </div>
        </div>
        <div id="select">
        <div id="menu1" style="float:left; width:33%">
            <ul>
                <li><a href='ScoreController'>��ŷ</a></li>
                <li><a href='BoardController'>�����Խ���</a></li> 
            </ul>
             </div>
        <div id="menu3" style="float:left; width:19%; color:white">
            <ul>
            <li><a href="Game.jsp">���ӽ���</a></li>
            </ul>
            </div>     
        <div id="menu2" style="float:right; width:33%">
            <ul>
               <%if(id==null){ %>
                <li><a href="login.jsp">�α���</a></li>
                <%}else{ %> 
                 <li style="color:white "><font size="2"><% out.print(id+"���� �α������Դϴ�."); %></font> </li>
                <li><a href="logout.jsp">�α׾ƿ�</a>
                <%if(id.equals("abcd")){ %>
                <li class="dropdown">
                    <div class="dropdown-menu"><a href="GameManager">�����ڰԽ���</a></div>
                    <div class="dropdown-content">
                    <a href="GameManager">��������</a>
                    <a href="BoardManager">�Խ��ǰ���</a>
                    </div>
                </li>
                <%}} %>
                <li><a href="signup.jsp">ȸ������</a></li>    
            </ul>
            </div>
        </div>
          <br><br>
          <h1 style="text-align:center">�Խ��ǰ���</h1>
 
         <form method="post" action="GameManager" >
      <% List<Board> boardList = (List)request.getAttribute("boardList"); %>
       </form>
       <table class="table table-striped">
        <thead style="background:gray">
            <tr>
                <th>Number</th>
                <th>Id</th>
                <th>Title</th>
                <th>Hit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <% for(int i=0; i<boardList.size(); i++){ %>
                <tr>
                    <td><%=boardList.get(i).getNum()%></td>
                    <td><%=boardList.get(i).getID()  %></td>
                    <td><%=boardList.get(i).getTitle() %></td>
                    <td><%=boardList.get(i).getHit() %></td>
                    <td><a style="color:red" href="BoardManager?action=delete&ID=<%=boardList.get(i).getID()%>&num=<%=boardList.get(i).getNum()%>">Delete</a></td>
                </tr>
           <%} %>
        </tbody>
    </table>  
            
            
    </body>
</html>