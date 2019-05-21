<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@page import="pack_dao.Data_handle"%>
<%@page import ="javax.servlet.http.HttpServletRequest"%>
<%@page import ="java.time.format.DateTimeFormatter"%>
<%@page import ="java.time.LocalDate"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<!--===============================================================================================-->
	<!--=========================== link to tables ============================= -->

	<link rel="stylesheet" href="vendor/bootstrap/css/AdminLTE.min.css">
	<link rel="stylesheet" href="vendor/bootstrap/css/_all-skins.min.css">
	
	<title>Insert title here</title>
	<!-- <link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'> -->

	<link rel="stylesheet" href="style.css">

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js'></script>
	<script src="index.js"></script>

	<style>
		/* Remove the navbar's default margin-bottom and rounded borders */
		.navbar {
			margin-bottom: 0;
			border-radius: 0;
		}

		/* Add a gray background color and some padding to the footer */
		footer {
			background-color: #f2f2f2;
			padding: 25px;
		}

		.carousel-inner img {
			width: 100%;
			/* Set width to 100% */
			margin: auto;
			min-height: 200px;
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



	<!--    ********************** inserting session here ****************    -->
	<%  
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

			</div>
		</div>
	</nav>




	<div class="container-contact100">

		<div class="wrap-contact100">

			

				<span class="contact100-form-title">
					Insert Tasks!
				</span>
               <form action="done" name="insert" method="post">
				<div class="wrap-input100 validate-input" data-validate="Task Name is required">
					<span class="label-input100">Task Name</span>
					<input class="input100" type="text" name="name" placeholder="Enter Task name">
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 input100-select">
					
					<div>
						<select class="selection-2" name="service" onchange="chng(this.value)">
							<option value="sequence">Scientific Dates</option>
							<option value="random">Random Dates</option>
						</select>
					</div>
					<span class="focus-input100"></span>
					</div>
				<!-- ======================== TASK UPDATION MESSAGE   ================================== -->

				<%-- <%  int r;
		if(request.getAttribute("sourcing")==null)  {r=-8;  %><p> Technical fault </p><%}
		
		r= (int)request.getAttribute("sourcing");
		if(r==0)
			{%><p> Updation Unsuccessful </p><%}
	
			
	     if(r>0)
	     { %><p> Congrats successful !!! </p>
				<% 
           session.removeAttribute("response"); %>

				<script type="text/javascript">
					setTimeout(function () {
						location.href = 'done.jsp';
					}, 3000);
				</script>
				<% 
         }  
   %>
				--%>




			<div class="container">
   <div class="row mdp" style="display:none">
    <input type="text" class="date" autocomplete="off" placeholder="Pick the multiple dates" name="dates">
    <!-- <input type = "submit" value= "v_b_d"> -->
</div>
</div>
<script>

function chng(val) {
				
 if(val == 'random'){
	 $(".mdp").css("display","block");
	 
 }
 else 
	 $(".mdp").css("display","none");

}

</script>		
			
				<div class="wrap-input100 validate-input" data-validate="Message is required">
					<span class="label-input100">Message</span>
					<textarea class="input100" name="message" placeholder="Your message here..."></textarea>
					<span class="focus-input100"></span>
				</div>

				<div class="container-contact100-form-btn">
					<div class="wrap-contact100-form-btn">
						<div class="contact100-form-bgbtn"></div>
						<button type="submit" class="contact100-form-btn" name="form1" value= "insert">
							<span>
								Submit
								<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
							</span>
						</button>
					</div>
				</div>
			</form>
		</div>
			<div class="wrap-contact200">
				<section class="content">
					<div class="row">
						<div class="col-xs-12">
							<div class="box">
								<div class="box-header">
									<h3 class="box-title">Responsive Hover Table</h3>

									<div class="box-tools">
									<form type="text/html" action= "done"  method="post" id="form_id">
										<div class="input-group input-group-sm" >
										    <div class="col-md-6">
											<input type="text" class="form-control pull-right" placeholder="Search">
                                           </div>
                                           <div class="col-md-6">
                                           <button type="submit" class="btn btn-primary" value="view" name="form2"><i class="fa fa-search"></i></button>
										  </div>
										  </div>
										</form>
									</div>
								</div>
								<!-- /.box-header -->
								<div class="box-body table-responsive no-padding">
									<table class="table table-hover">
										<tbody>
											<tr>
												<th>ID</th>
												<th>Task</th>
												<th>Date</th>
												<th>Status</th>

											</tr>


										<!-- ==================================Printing the view here =========================== -->

										<% 
  
   LocalDate date = LocalDate.now();
   String dt = date.toString();
     if(request.getParameter("date") !=null){
    	 dt = request.getParameter("date");
     }
     ArrayList<ArrayList<String>> arl ;   
     try{
    	 dt=dt.replace("-","");
    	  int s = Integer.parseInt(dt);
    	  arl = Data_handle.view_by_date(dt);
    	  // is an integer!
    	} catch (Exception e) {
    	 arl = Data_handle.view_by_name(dt);
    	}
      
    	   
       int i=0; 
    	 
       for(ArrayList<String> obj:arl){ // iterate 
    %>
										<tr>
											<td> <%=++i %> </td>
											<td> <%=obj.get(0) %></td>
											<td> <%=obj.get(1) %></td>
											<td> <%=obj.get(2) %></td>
										</tr>

										<%
         }
     	%>

									</tbody>
									</table>
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	
	<!-- 888888888888888888888888888888 scripts are of multiple date picker 88888888888888888888 -->

	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js'></script>
	<script src="index.js"></script>

	<!-- 8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888 -->

	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});
	</script>
	<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="js/main.js"> </script>
	
</body>

</html>
