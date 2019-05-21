<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
 <%@page import="pack_dao.Data_handle"%>
 <%@page import ="javax.servlet.http.HttpServletRequest"%>
 <%@page import ="java.time.format.DateTimeFormatter"%>
<%@page import ="java.time.LocalDateTime"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>

      <link rel="stylesheet" href="style.css">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      <p> shubhees productions </p>
      background-color: #f2f2f2;
      padding: 25px;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
  </style>
</head>
<body>
<%   

/*    ********************** inserting session here ****************     */

     if(session.getAttribute("username")==null)
     { response.sendRedirect("login.jsp"); }	 
  %>
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
      <ul class="nav navbar-nav navbar-right">
        <li><a href="index.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox" >
      <div class="item active">
        <img src="image1.png" alt="Image" style="height : 200px;">
        <div class="carousel-caption">
          <h3>Sell $</h3>
          <p>Money Money.</p>
        </div>      
      </div>

      <div class="item">
        <img src="image2.png" alt="Image" style="height : 200px;">
        <div class="carousel-caption">
          <h3>Enjoy and Remember</h3>
          <p>Welcome</p>
        </div>      
      </div>
      
      <div class="item">
        <img src="image3.png" alt="Image" style="height : 200px;">
        <div class="carousel-caption">
          <h3>ZORO</h3>
          <p>Welcome</p>
        </div>      
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
  

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>


<form name="add&delete" action= "serv_net"  method="post">
 <!--  action contains address of servlet -->
<script>
add_by_name : <input type="text" name="val1">
delete_by_name:<input type="text" name="val1">
<input type="submit" name="shubh" value="add&delete">

</script>
 
 
   
 
<!--
Todays tasks <input type="text" name="val1"><br>
<input type="submit" value="ok">
-->
</form>

<form name="v_n_m" action= "web.jsp"  method="post">

select task: <input type="text" value="" name="val2">
<input type="submit" value="v_n_m">

<%
String nm = request.getParameter("name");
if(nm !=null)
{
ArrayList<ArrayList<String>> arl = Data_handle.view_by_name(nm);
   %>

 <table border=1>
 
   <% 
    for(ArrayList<String> obj:arl){ // iterate 
            %>
             <tr> 
             <td>  <p><%=obj.get(0) %></p></td>
             <td>  <p><%=obj.get(1) %></p></td>
             <td>  <p><%=obj.get(2) %></p></td>
             </tr>
             </table>
              <%
         }
 }   

//while (.next()) { 
 //   out.println(rs.getStrin g("name") + rs.getString("date") + rs.getString("complete"));
%>
</form>


<form name="v_b_d" action= "web.jsp"  method="post">

<div class="container">
   <div class="row">
    <h3>Multi Select Date Picker</h3>
    <input type=" text" class="date" autocomplete="off" placeholder="Pick the multiple dates" name="dates">
    <input type = "submit"  value= "v_b_d">
</div>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js'></script>
   <script  src="index.js"></script>


<%
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
LocalDateTime now = LocalDateTime.now();  
 //System.out.println(dtf.format(now));  
%><p><%=dtf.format(now) %>
<% 

String prm = request.getParameter("dates");
 if(prm ==null) prm = dtf.format(now);

	 ArrayList<ArrayList<String>> arrayList = Data_handle.view_by_date(prm);

	%>
 <%--    <p><%=arrayList[i] %></p> --%>
  <%-- <%=arrayList.get(0).get(0) %> --%>
  <table border=1>
  
	<% 
	 for(ArrayList<String> obj:arrayList){ // iterate 
        // for(String value:obj){
          // System.out.println(value);
        	 %>
        	  <tr> 
        	  <td>  <p><%=obj.get(0) %></p></td>
        	  <td>  <p><%=obj.get(1) %></p></td>
        	  <td>  <p><%=obj.get(2) %></p></td>
        	  </tr>
        	  </table>
        	   <%//}
         }

%>
</form>
      <!--  login form-->  
<form>
      



</form>



</body>
</html>