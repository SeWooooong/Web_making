<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body> 
<%
   session.setAttribute("memberID", request.getParameter("first"));
%>
     	 <script>
             alert("ȯ���մϴ�.");
            location.href="GameSite.jsp";
           </script>
 
      
</body>
</html>