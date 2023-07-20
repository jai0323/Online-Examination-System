<%@page import="com.quiz.Review"%>
<%@page import="java.util.ArrayList"%>
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
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="MainController?task=studentHome">Home</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="StudentProfile.jsp">Profile</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="MainController?task=Results">Results</a>
    </li>
   <li class="nav-item">
      <a class="nav-link" href="ChangePassword.jsp">Change password</a>
    </li>
  </ul>
  <a href="MainController?task=logout_student" class="btn btn-success bg-warning border border-danger float-right " style="float: right;margin-left:auto;margin-right:0"> Logout </a>
  
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
<% }%>

<div class="container-fluid">
  <div class="row" style=margin:"20px;">
  	<div class="col-sm-12">
  		<div class="container shadow-lg p-4 mb-4 bg-white rounded" style="height:670px" >
  			 <h3>Results</h3>
  			 <%
  			 ArrayList<Review> rlist=(ArrayList<Review>)request.getAttribute("reviews");
  			 %>
  			  <div style="height:600px;overflow-y:auto;width: 100%;">
				  <table class="table table-striped">
				    <thead>
				      <tr>
				        <th>Test Id</th>
				         <th>Subject</th>
				        <th>Review</th>
				        <th>Response</th>
				        <th>Rating</th>
				      </tr>
				    </thead>
				    <tbody>
				    <%if(rlist!=null){
				    for(Review r:rlist){ %>
				    <tr>
				     <td><%=r.getTestId()%></td>
				     <td><%=r.getSubject()%></td>
				     <td><%=r.getReview()%></td>
				     <td><%=r.getResp()%></td>
				     <td><%=r.getRate() %></td>
				    </tr>
				    <%}}%>
				    </tbody>
				    </table>
			</div>
		</div>
	</div>
	</div>
	</div>		    
 
</body>
</html>