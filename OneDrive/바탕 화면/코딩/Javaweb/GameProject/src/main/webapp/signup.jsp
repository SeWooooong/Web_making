<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <title>회원가입 페이지</title>
        <style>
            input{
                font-size:15px;
                width: 300px;
                height :30px
            }
            .singup{
                color:white;
                position: absolute;
                left:37%;
                top:25%;
                text-align: center;
            }  
        img{
            position: absolute;
            background-size: cover;
        }
        div{
            width:500px;
            background-color: rgb(41, 40, 40);
        }
        </style>
    </head>
    <body>
        <img src="자동차2.jpg" width="100%" height="100%">
        <div class="singup">
            <form name="signinForm" action="GameSign" method="post">
            <h1>회원가입 페이지</h1>
            <br>
            <p ><input type="text" placeholder="계정이름" name="id" ></p>
            <p ><input type="password" placeholder="비밀번호" name="pwd"></p>
            <p ><input type="password" placeholder="비밀번호 재확인" name="pwdcheck"></p>
            <p ><input type="email" placeholder="E-mail" name="email" ></p>
            <p ><input type="tel" placeholder="전화번호" name="phone" ></p>
            <p ><input type="text" placeholder="닉네임" name="name" ></p>
            <p> <input type="submit" value="회원가입" style="width: 100px;"></p>
          </form>
        </div>
    </body>
</html>