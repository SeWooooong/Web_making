<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ȸ������ ������</title>
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
        <img src="�ڵ���2.jpg" width="100%" height="100%">
        <div class="singup">
            <form name="signinForm" action="GameSign" method="post">
            <h1>ȸ������ ������</h1>
            <br>
            <p ><input type="text" placeholder="�����̸�" name="id" ></p>
            <p ><input type="password" placeholder="��й�ȣ" name="pwd"></p>
            <p ><input type="password" placeholder="��й�ȣ ��Ȯ��" name="pwdcheck"></p>
            <p ><input type="email" placeholder="E-mail" name="email" ></p>
            <p ><input type="tel" placeholder="��ȭ��ȣ" name="phone" ></p>
            <p ><input type="text" placeholder="�г���" name="name" ></p>
            <p> <input type="submit" value="ȸ������" style="width: 100px;"></p>
          </form>
        </div>
    </body>
</html>