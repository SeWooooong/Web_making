<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <title>login페이지</title>
        <style>
            p{
                font-size: large;
            }
            span{
                margin: 20px 0px 0px 160px;
                color:gray;
            }
            span:hover{
                color:aliceblue;
            }
            input{
                font-size:20px;
                width: 300px;
                height :30px
            }
            .login{
                color:white;
                position: absolute;
                left:37%;
                top:30%;
                text-align: center;
            }  
        img{
            position: absolute;
            background-size: cover;
        }
        div{
            width: 500px;
            background-color: rgb(41, 40, 40);
        }
        </style>
    </head>
    <body>
               <%
                 String id = request.getParameter("id");
                 String psw = request.getParameter("psw");
               %>
        <img src="자동차2.jpg" width="100%" height="100%">
        <div class="login">
            <br>
            <form method="post" action="GameController" >
            당신의 ID <p class="id"><input type="text" value=<%=id%>  ></p>
            당신의 비밀번호 <p class="pw"><input type="text" value=<%=psw%>></p>
            
           </form>
        </div>
    </body>
</html>