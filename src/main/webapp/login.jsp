 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
<meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Quiz System</title>
</head>
<body>
<div class="container-fluid">
  <div class="jumbotron bg-dark"  style=" color:white">
  <div class="row" >
    <div class="col-sm-9 mx-auto">
      <h1>DigiEdu ERA</h1>
      <p style=font-size:16px>Creating Winners for Life</p>
    </div>
  </div>
</div>
</div>
<br>

<%
 String message=(String)request.getAttribute("message");
 if(message!=null)
 {
	 %>
	    <div class="col-sm-12">
	   	<div class="alert alert-info alert-dismissible fade show" style="width:50%;margin-left: 25%; " >
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  <strong><%=message %></strong>
		</div>
		</div>	 
	 <% } %>
  <div class="row mx-4">
    <div class="col-sm-7">
      
<div id="demo" class="carousel slide " data-ride="carousel" >

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner " style="height:400px">
    <div class="carousel-item active">
     <img src="images/q.png" alt="poster_1">
		  <div class="carousel-caption">
		    <h3></h3>
		    <p></p>
		  </div>
      
    </div>
    <div class="carousel-item">
     <img src="images/g.png" alt="poster_2">
		  <div class="carousel-caption">
		    <h3></h3>
		    <p></p>
		  </div>
    </div>
   
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>

</div>
      
    </div>
    
    <div class="col-sm-4">
      <div class="container-fluid shadow-lg p-4 mb-4 bg-white"  >
      <form action="Authenticate" >
  <div class="form-group">
    <input type="email" class="form-control" placeholder="Enter email" name="email">
  	</div>
  		<div class="form-group">
    	<input type="password" class="form-control" placeholder="Enter password" name="password">
  		</div>
  		<div class="form-group">
    	<select class="form-control" name="category">
  		  	<option>Student</option>
  		  	<option>College</option>
  		  	<option>Administrator</option>
  		</select>
  		</div>
  		<a class="text-secondary " href="forgotPassword.jsp">Forget Password ?</a>
  		
       <div class="form-group mt-2" >
       <button type="submit" class="btn btn-primary" >Login</button>
       <a href="MainController?task=signupPage" class="btn btn-primary">Sign Up</a>
       </div>
      </form>
      </div>
    </div>
 
  <div class="col-sm-4">
     
    </div>
   </div>
</body>
</html>