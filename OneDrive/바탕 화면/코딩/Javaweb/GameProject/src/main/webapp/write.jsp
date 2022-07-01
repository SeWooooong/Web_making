<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script></head>
<title>글추가</title>
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
            
           <script>
            var now = new Date();
            var  str= now.get
            document.getElementById("date").value;
           
           </script>
        </div>
    
        <div class="container">
        <h2>게시판 글쓰기</h2>
         <form method="post" action="BoardPlus">
         <div class="form-group">
           <label for="title">제목</label>
         <input type="text" class="form-control" id="title" name="title" placeholder="제목 입력(4~50)" maxlength="50">
          </div>
          <div class="form-group">
          <label for="content">내용</label>
         <textarea class="form-control" name="content"  rows="5" id="content" placeholder="내용 작성"></textarea>
         </div>
         <div class="form-group">
         <label for="writer">작성자</label>
         <input type="text" class="form-control" id="writer" placeholder="id입력" name="id" value=<%=id%> readonly>
         </div>
         <div class="form-group">
          <label for="writer">작성날짜</label>
          <input type="text" class="form-control" id="date" name="date" readonly>
         </div>
         <script>
            var now = new Date();
            var month = now.getMonth()+1;
            var str=  now.getFullYear() + "-" + month + "-" + now.getDate() ;
            document.getElementById("date").value = str; 
           </script>
         <button type="submit" class="btn btn-default">제출</button>
         </form>
         </div>
</body>
</html>