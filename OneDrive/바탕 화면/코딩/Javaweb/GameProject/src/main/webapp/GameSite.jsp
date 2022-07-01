<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
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
        </style>
         <script>
              var imgs = new Array();
              imgs[0]="�ڵ���1.jpg";
              imgs[1]="�ڵ���2.jpg";
              imgs[2]="�ڵ���3.jpg";
            var next=0;
            function changeImg(){
                var img=document.getElementById("img");
                img.src=imgs[next];
                next++;
                next %= imgs.length;
                setTimeout("changeImg()",5000);
            }
            
        </script>
    </head>
    <body onload="changeImg()">
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
        <img id="img" width="100%" height="100%">
    </body>
</html>