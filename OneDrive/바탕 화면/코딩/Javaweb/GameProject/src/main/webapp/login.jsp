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
                 String id = (String)request.getSession().getAttribute("memberID");
               %>
        <img src="�ڵ���2.jpg" width="100%" height="100%">
        <div class="login">
            <h1>�α��� ������</h1>
            <br>
            <form method="post" action="GameController" >
            <p class="id"><input type="text" placeholder="�����̸�" name="id"></p>
            <p class="pw"><input type="password" placeholder="��й�ȣ" name="pwd"></p>
            <a href="findId.jsp"><span>���̵� / ��й�ȣ ã��</span></a>
            <p class="button"><input type="submit" value="�α���" style="width: 100px;"></p>
           </form>
        </div>
    </body>
</html>