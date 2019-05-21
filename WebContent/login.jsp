<%@page import="pack_dao.login_check"%>
<%@page import="pack_servlets.login"%>
<%@ page import="java.util.List"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>

      <link rel="stylesheet" href="style.css">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<style>
   /* Remove the navbar's default margin-bottom and rounded borders */ 
   body{
    background-image: url("image5.png");
    }
   
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
     .box{
        position: relative;
        display: inline-block; /* Make the width of box same as image */
    }
    .box .text{
        position: absolute;
        z-index: 999;
        margin: 30 auto;
        left: 1000px;
        right: 50px;
        top: 50px; /* Adjust this value to move the positioned div up and down */
        text-align: center;
        width: 60%; /* Set the width of the positioned div */
    }
    
  </style>

</head>
<body >

 
  <% if(session.getAttribute("username")!=null)
  { response.sendRedirect("done.jsp"); }	  %>
  
         
         
         <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Logo</a> 
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Projects</a></li>
        <li><a href="#">Contact</a></li>
         
      </ul>
      
    </div>
  </div>
</nav>

 <div class="box">
       
        <div class="text">
        
      

	<form name="login" action="login" method="post">
	<span>	Username:</span> <input type="text" name="username">  </span>
		<br><br>
	<span>	 Password:</span> <input type="password" name="password"> 
	<br><br><br>
		  <input type="submit" name="start" value="login">
	</form><br>
	<a href="Register.jsp"><input type="submit"  value="Registeration"></a>

	<%    int r;
	if(session.getAttribute("response") == null) r = 3;
	else
     r= (int)session.getAttribute("response");
  
        %>
        
      <%--   <script type="text/javascript">alert("<%=r%>")</script>  --%>
        <%
         if(r==0 )
     { %>  <p> invalid username or password</p> 
           
     <% 
     }
         %>
           
        </div>
    </div>



 


</body>
</html>