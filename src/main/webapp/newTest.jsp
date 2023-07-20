<%@page import="com.quiz.College"%>
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
<title>Welcome</title>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
 	<ul class="navbar-nav">
 		<li class="nav-item navbar-brand">
 			DigiEdu ERA
	 	</li>
	</ul>
	<%
    
   College clg=(College)session.getAttribute("clg");
  %>
  <a class="navbar-brand float-right" style="float: right;margin-left:auto;margin-right:0" href="#"><%=clg.getName() %></a>
	
</nav>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->
  

  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="MainController?task=collegeHome">Home</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="MainController?task=ViewUser">View Users</a>
    </li>
  </ul>
  <a href="MainController?task=logout_college" class="btn btn-success bg-warning border border-danger float-right " style="float: right;margin-left:auto;margin-right:0"> Logout </a>
 
</nav>
<br>

      <div class="container-fluid shadow-lg p-4 mb-4 bg-white mx-auto"  style="width:500px;margin:100px;" >
      <form action="MainController">
           <div class="form-group">
	    	<select class="form-control" name="course">
	  		  	<option>B.tech</option>
	  		  	<option>BCA</option>
	  		  	<option>BSc</option>
	  		  	<option>M.tech</option>
	  		  	<option>MCA</option>
	  		  	<option>MBA</option>
	  		  	<option>B.com</option>
	  		  	<option>M.com</option>
	  		  	<option>BBA</option>
	  		</select>
	  		</div>
	       <div class="form-group">
		    <label for="name">Semester :</label>
		    <input type="number" class="form-control" placeholder="Enter name" name="semester">
		  </div>
		  <div class="form-group">
		    <label for="subject">Subject:</label>
		    <input type="text" class="form-control" placeholder="Enter Subject" name="subject" id="subject">
		  </div>
		  <input type="hidden" name="code" value="<%=clg.getCode()%>">
		  <button type="submit" class="btn btn-primary" name="task" value="createtest">Create</button>
		</form>
      </div>
 
</body>
</html>