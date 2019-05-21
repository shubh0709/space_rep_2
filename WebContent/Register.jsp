<%@page import="pack_dao.login_check"%>
 <%@page import="pack_servlets.login"%>
 <%@ page import="java.util.List"%>
 <%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">
    <!-- JSP connection here -->
     <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
     
    <!-- Title Page-->
    <title>Au Register Forms by Colorlib</title>
<style>
     .box{
        position: relative;
        display: inline-block; /* Make the width of box same as image */
    }
    .box .text{
        position: absolute;
        z-index: 999;
        margin: 0 auto;
        left: 450px;
       
        top: 10%; /* Adjust this value to move the positioned div up and down */
       
        width: 60%; /* Set the width of the positioned div */
    }
</style>

    <!-- Icons font CSS-->
    <link href="Registration_bootstrap_2/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="Registration_bootstrap_2/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  
    <!-- Vendor CSS-->
    <link href="Registration_bootstrap_2/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="Registration_bootstrap_2/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="Registration_bootstrap_2/css/main.css" rel="stylesheet" media="all">
</head>

<body>




<!--    *********        java coding   part      ************************      -->

     <% if(session.getAttribute("username")!=null)
  { response.sendRedirect("done.jsp"); }	  %>



       <%
       int r;
	if(session.getAttribute("response") == null) r = 3;
	else
     r= (int)session.getAttribute("response");
  
        %>
        
      <%--   <script type="text/javascript">alert("<%=r%>")</script>  --%>
        <%
         if(r==0 )
     { %>  <p> invalid username</p>  <% }
  
         if(r==1)
         { %>  <p> registration successful </p>  <% 
           session.removeAttribute("response"); %>
         
     <script type="text/javascript">
     setTimeout(function(){
     location.href='login.jsp';
     },3000);
     </script> 
        <% 
         }  
   %>
   
   
   
    <div class="page-wrapper bg-gra-01  font-poppins">
        <div class="wrapper wrapper--w780" width="100px">
            <div class="card card-3 box" >
                
                
                    <img src = "Registration_bootstrap_2/images/img8.gif" alt= "THEEK kar" width="400px" height="600px">
                   <div class="text">
                    <h2 class="title">Registration Info</h2>
                    
      
                 <form action="Register" method="post">
                 <div float="left">
                        <div class="input-group">
                            <input class="input--style-3" type="text" placeholder="Name" name="username">
                        </div>
                        <div class="input-group">
                            <input class="input--style-3 js-datepicker" type="text" placeholder="Birthdate" name="birthday">
                            <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                        </div>
                        <div class="input-group">
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="gender">
                                    <option disabled="disabled" selected="selected">Gender</option>
                                    <option>Male</option>
                                    <option>Female</option>
                                    <option>Other</option>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                        </div>
                        <div float="right">
                        <div class="input-group">
                            <input class="input--style-3" type="email" placeholder="Email" name="email_id">
                        </div>
                        <div class="input-group">
                            <input class="input--style-3" type="text" placeholder="Phone" name="phone">
                        </div>
                         <div class="input-group">
                            <input class="input--style-3" type="password" placeholder="password" name="password">
                        </div>
                        </div>
                        <div class="p-t-10">
                            <button class="btn btn--pill btn--green" type="submit" >Submit</button>
                        </div>
                       </div>
                       
                    </form>
                </div>
            </div>
        </div>
    </div> 

    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>

 
    <!--  ********** MY jsp code   ***************************
        <form name="Register" action="login" method="post">
     Username: <input type = "text" name="username">
       Password: <input type= "password" name="password">
       email id: <input type= "text" name= "email_id">
      <input type="submit" name="start" value="Register">
      
      -->
 
</body>
</html> 
