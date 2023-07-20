<%@page import="com.quiz.Results"%>
<%@page import="com.quiz.Student"%>
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
	Student student=(Student)session.getAttribute("student");
	 %>
	  <a class="navbar-brand float-right" style="float: right;margin-left:auto;margin-right:0" href="#"><%=student.getName()%></a>
		
</nav>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->
  
  <!-- Links -->
  
</nav>
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
<% }
 
 %>

<div class="container-fluid">
<%
    Results r=(Results)request.getAttribute("result");
   
%>
 	 <div class="rounded shadow-lg mx-auto" style="width:50%;">
 	        <br>
		    <div class="rounded  mx-auto" style="width:30%;">
		  	<img src="images/tick.png" class="rounded-circle shadow-lg"  alt="Tick">
		    </div>
		    <br>
		    <div class="rounded  mx-auto" style="width:17%;">
		    <h3>Submitted</h3>
		    <br>
		    <h6>Your Score is <%=r.getScore()%>/<%=r.getMarks()%></h6>
		    
		    </div>
		    <div style="width:75%;margin:auto">
		    <form action="MainController" style="margin:20px;padding:20px 0px 20px 0px;">
				<div class="form-group">
				   <label for="comment">Review:</label>
				  <input type="text" class="form-control" name="review">
				</div>
				<div class="form-group">
				   <label for="comment">Rate the Test out of 5</label>
				  <input type="number" class="form-control" name="rate">
				</div>
				<input type="hidden" name="testId" value="<%=r.getTestId()%>">
		    <button type="submit" name="task" value="review" class="btn btn-success" style="width:20%;margin:auto" >Submit</button>
		    </form>
		    </div>
		    
     </div>
</div>
</body>
</html>