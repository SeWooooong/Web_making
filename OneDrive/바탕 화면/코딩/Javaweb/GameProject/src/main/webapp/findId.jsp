<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <title>login������</title>
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
            .Find{
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
                 String id = (String)request.getSession().getAttribute("memberID");
               %>
        <img src="�ڵ���2.jpg" width="100%" height="100%">
        <div class="Find">
            <h1>���̵� ��й�ȣ ã��</h1>
            <br>
            <form method="post" action="UserFind" >
            <p class="mail"><input type="text" placeholder="E-mail" name="e-mail"></p>
            <p class="tel"><input type="password" placeholder="��ȭ��ȣ" name="tel"></p>
            <p class="button"><input type="submit" value="ã��" style="width: 100px;"></p>
           </form>
        </div>
    </body>
</html>