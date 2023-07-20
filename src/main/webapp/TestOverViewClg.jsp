<%@page import="java.util.ArrayList"%>
<%@page import="com.quiz.*"%>
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
      <a class="nav-link" href="MainController?task=testscreen">Add Test</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="MainController?task=ViewUser">View Users</a>
    </li>
  </ul>
  <a href="MainController?task=logout_college" class="btn btn-success bg-warning border border-danger float-right " style="float: right;margin-left:auto;margin-right:0"> Logout </a>
  
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
	 <% } %>
 <div class="container-fluid">
  <div class="row" style=margin:20px>
  	<div class="col-sm-12">
  		<div class="container shadow-lg p-4 mb-4 bg-white rounded" style="height:720px" >
  			 <h3>Test Details</h3>
  			 <% Test t=(Test)request.getAttribute("test");
  			    ArrayList<Question> qlist=(ArrayList<Question>)request.getAttribute("qlist");
  			    %>
  			   <h5>Test ID : <%=t.getTestId()%></h5>
				 <h5>Course : <%=t.getName()%></h5>
				 <h5>Subject : <%=t.getSubject() %></h5>
  			  <div style="height:500px;overflow-y:auto;width: 100%;">
				  <table class="table table-striped" style="margin-bottom:20px">
				     <tbody> 
				    <%for(Question q:qlist)
				      {
				    %>
				   
				   
				      <tr><td>
				      <h4>Question:</h4><br>
				      <%=q.getQuestion()%>
				      </td></tr>
				      <tr>
				      <td>Option 1 : <%=q.getOp1() %></td>
				      </tr>
				      <tr>
				      <td>Option 2 : <%=q.getOp2() %></td>
				      </tr>
				      <tr>
				      <td>Option 3 : <%=q.getOp3() %></td>
				      </tr>
				      <tr>
				      <td>Option 4 : <%=q.getOp4() %></td>
				      </tr>
				      <tr>
				      <td>Answer : <%=q.getAnswer() %></td>
				      </tr>
				   				    
				    <%} %>
				    </tbody>
				  </table>
				  </div>
  		</div>
  	</div>
  </div>
  </div>
</body>
</html>