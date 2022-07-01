<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>Racing Game</title>
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
    <style>
        canvas {
            background: #eee;
            display: block;
            margin: 0 auto;
        }
        div{
            color:red;
        }
         #btnSubmit{
        width:100px;
        margin:auto;
        display:block;
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
 
    <input  type="button" value="시작" id="btnSubmit" onclick="start()" style="width:100pt;height:60pt;">
  <canvas id="myCanvas" width="1000" height="500"></canvas>
  <script>
     var canvas = document.getElementById("myCanvas");
     var ctx = canvas.getContext("2d");
     var score=0;
     //car크기
     var carWidth = 30;
     var carHeight = 20;
     
     //car위치
     var carX = 0;
     var carY = (canvas.height-carHeight)/2;

     var upPressed = false;
     var downPressed = false;
     var rightPressed = false;
     var leftPressed = false;
     
    document.addEventListener("keydown", keyDownHandler, false);
    document.addEventListener("keyup", keyUpHandler, false);

     function keyDownHandler(e) {
	 if(e.key == 37 || e.key == "ArrowRight") {
		rightPressed = true;
    	}
	  else if(e.key == 39 || e.key == "ArrowLeft") {
	    leftPressed = true;
      }
      else if(e.key == 38 || e.key == "ArrowUp") {
	  upPressed = true;
      }
      else if(e.key == 40 || e.key == "ArrowDown") {
	  downPressed = true;
     }
    }

   function keyUpHandler(e) {
	if(e.key == 37 || e.key == "ArrowRight") {
	  rightPressed = false;
    }
    else if(e.key == 39 || e.key == "ArrowLeft") {
	  leftPressed = false;
    }
    else if(e.key == 38 || e.key == "ArrowUp") {
	  upPressed = false;
    }
     else if(e.key == 40 || e.key == "ArrowDown") {
	  downPressed = false;
    }
     } 
 
    function drawCar(){
     ctx.beginPath();
     ctx.rect(carX, carY, carWidth, carHeight);
     ctx.fillStyle= "lightgreen";
     ctx.fill();
     ctx.closePath();
    }

    function drawBackground() {
        ctx.beginPath();
        ctx.rect(canvas.width-5, (canvas.height-50)/2 , 5, 50);
        ctx.fillStyle="black";
        ctx.fill();
        ctx.closePath();
    }

    var arBall = new Array();
    var NUM = 10;
    var oldTime;
    var x = canvas.width/2;
    var y = canvas.height/2;
    window.onload = function(){
    var arColor = ["blue", "yellow", "black", "lightgray"];
    for (var i = 0; i < NUM; i++) {
     arBall.push({ x:20+i*50, y:20+i*10,  dx:1, dy:1, vx:Math.random() * 150 + 20,
          vy:Math.random() * 150 + 20,r:20 + 5,
          color:arColor[Math.floor(Math.random() * 4)]
     });}}
     

     function start(){
    	 oldTime = getTime();
         setInterval(draw, 30);
    }
    

     function getTime() {
         var date = new Date();
         var time = date.getTime();
         delete date;
         return time;
        }

     function drawBall(){
        var ellapse = getTime() -oldTime;
         oldTime = getTime();
        for (var i = 0; i < NUM; i++) {
          var b = arBall[i];
        ctx.beginPath(); 
        ctx.fillStyle=b.color;
        ctx.arc(b.x, b.y , b.r , 0,2 * Math.PI, true);
        ctx.fill(); ctx.stroke();
        if (b.x < b.r) b.dx = 1;
        if (b.x + b.r > canvas.width) b.dx = -1;
        if (b.y < b.r) b.dy = 1;
        if (b.y + b.r > canvas.height) b.dy = -1;
        var mx = b.vx * ellapse / 1000;
        var my = b.vy * ellapse / 1000;
        b.x += mx * b.dx;
        b.y += my * b.dy;
       }
     }  
     var old = new Date().getTime();
     function setClock(){
     var now = new Date().getTime();
     var sec_gap = (now-old) /1000;
     document.getElementById("score").innerHTML = "<font size='10'>경과시간 = " +sec_gap 
     +"</font>";
     score=sec_gap;
     setTimeout('setClock()',1000);
   }


     function calculate(){
      if((carX >= canvas.width-30) &&(carX <= canvas.width-5) && (carY >= 200) && (carY<=250)){
    	  document.getElementById("sco1").value = score;
    	  document.getElementById("sco2").value = score;
    	  alert("Game성공" + score);
          carX =canvas.width;  carY=canvas.height;
      }
     }

     function collide(){
      for (var i = 0; i < NUM; i++) {
        var b = arBall[i];
        if(carX >= (b.x-b.r-5) && carX <=(b.x+b.r-5) && carY >= (b.y-b.r-5) && carY <=(b.y+b.r-5)){
          alert("Gameover");
          document.location.reload();
        }
      }
     }

     function move(){
      if(rightPressed && carX < canvas.width - carWidth ) {
	      carX += 3;
         }
      else if(leftPressed && carX > 0) {
	     carX -= 3;
         }
      else if(downPressed && carY < canvas.height - carHeight) {
 	      carY += 3;
         }
      else if(upPressed && carY > 0) {
	       carY -= 3;
         }
      }
    function draw(){
     ctx.clearRect(0,0, canvas.width, canvas.height);
     drawBackground();
     drawCar();
     drawBall();
     move();
     calculate();
     collide();
     setClock();
     }   
  </script>
   
   <div id="score"><font size="10">경과시간 = 0</font></div>
   <strong>처음 게임을 플레이 했을 경우</strong>
   <form method="post" action="ScoreAdd" >
   자신의 아이디 : <input  type="text" id="id" name="id" value=<%=id%> size="20">
   자신의 닉네임 : <input  type="text" id="id" name="name" size="20">
   자신의 점수 : <input  type="text" id="sco1" name="score" size="20">
   <br>
   <input type="submit" value="추가" style="width:50pt;height:30pt;">
   <br>
   </form>
   <strong>게임을 여러번 이용 했을 경우</strong>
   <form method="post" action="ScoreController" >
   자신의 아이디 : <input  type="text" id="id" name="id" value=<%=id%> size="20">
   자신의 점수 : <input  type="text" id="sco2" name="score" size="20">
   <br>
   <input type="submit" value="업데이트" style="width:50pt;height:30pt;">
   </form>
  

</body>
</html>