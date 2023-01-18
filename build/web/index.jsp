<%-- 
    Document   : index
    Created on : Oct 6, 2022, 6:53:49 PM
    Author     : kausar
--%>

<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
      <head>
            <link rel="stylesheet" href="https://cdn.tailgrids.com/tailgrids-fallback.css" />
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link  rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
            <!-- Material Icons Link -->
            <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
            <!-- Font Awesome Link -->
            <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
            <!-- stylesheet -->
            <link href="https://unpkg.com/@material-tailwind/html@latest/styles/material-tailwind.css" rel="stylesheet"/>
            <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
            <link href="Css/style1.css" rel="stylesheet" type="text/css"/>
               <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
        integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
            <title>JSP Page</title>
      </head>
      <body>
             <!--Navbar-->
             <%@include file="navbar.jsp" %>
             <%@include file="heroPart.jsp" %>
             <%@include file="blog.jsp" %>
             <%@include file="footer.jsp" %>
             <%@include file="scrollUp.jsp" %>
             <%--<%@include file="sharebutton.jsp" %>--%>
            <!--JavaScript .....Code-->
            <script src="https://cdn.tailwindcss.com"></script>
            <script src="https://unpkg.com/@material-tailwind/html@latest/scripts/ripple.js"></script>
            <script src="https://unpkg.com/@material-tailwind/html@latest/scripts/script-name.js"></script>
            <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
            <script src="javaScript/myJavaScript.js" type="text/javascript"></script>
            <script src="javaScript/script.js" type="text/javascript"></script>
      </body>
</html>
