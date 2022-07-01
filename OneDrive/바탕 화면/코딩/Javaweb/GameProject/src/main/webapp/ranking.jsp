
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.util.List"%>
<%@ page import="com.park.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ŷ</title>
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
  img{
         position:absolute;
         background-size: cover;
          opacity: 0.8;
       } 
  table{
     border-collapse:collapse;
     position :relative;
     text-algin:center;
     width:50%;
     margin : auto;
     text-align: center;
     color:rgb(252, 252, 249);;
  }
  td{
    height: 100px;
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
   <%List<User> scoreList = (List)request.getAttribute("scoreList"); %>
   <img src="Ʈ����.jpg" width="100%" height="100%">
   <br><br><br><br><br><br><br><br><br><br><br><br>
   <table>
   <tr style=" font-size: 30pt;">
    <th>����</th>
   <th>ID</th>
   <th>�г���</th>
   <th>score</th>
   </tr>
    <%for(int i=0; i<3; ++i){ %>
     <tr style=" font-size: 20pt;">
     <td> <% out.print(i+1); %>  </td>
      <td><%=scoreList.get(i).getUserid()%> </td>
      <td><%=scoreList.get(i).getnickname() %> </td>
      <td><strong><%=scoreList.get(i).getScore() %></strong></td>
     </tr>
   
      <%} %>
   
   
   
   
   </table>

</body>
</html>