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
<% } %>

<div class="container-fluid">
  <div class="rounded shadow-lg mx-auto" style="width:75%;">
  <%  ArrayList<Question>qlist=(ArrayList<Question>)session.getAttribute("qlist");
     ArrayList<Integer>atmQues=(ArrayList<Integer>)session.getAttribute("atmQues");
     int qno=atmQues.size();

      Question q=qlist.get(qno);
  %>
  <form action="MainController" style="margin:20px;padding:20px 10px 20px 0px;">
      
      
        <div class="form-group p-2">
		<label for="usr"><h3>Quetions <%=qno+1%>:</h3></label><br>
		<label><%=q.getQuestion() %></label>
		  <input type="hidden" name="qid" value="<%=q.getQid()%>">
		</div>  
		<div class="form-check p-3">
		  <label class="form-check-label">
		    <input type="radio" class="form-check-input" name="op" value="<%=q.getOp1()%>"><%=q.getOp1()%>
		  </label>
		</div>
		<div class="form-check p-3">
		  <label class="form-check-label">
		    <input type="radio" class="form-check-input" name="op" value="<%=q.getOp2()%>"><%=q.getOp2()%>
		  </label>
		</div><div class="form-check p-3">
		  <label class="form-check-label">
		    <input type="radio" class="form-check-input" name="op" value="<%=q.getOp3()%>"><%=q.getOp3()%>
		  </label>
		</div><div class="form-check p-3">
		  <label class="form-check-label">
		    <input type="radio" class="form-check-input" name="op" value="<%=q.getOp4()%>"><%=q.getOp4()%>
		  </label>
		</div>
		
      
      <div class="form-group float-right  p-2">
	  <button type="submit" class="btn btn-success" name="task" value="nextQuestion" >Next</button>
	</div><br><br>

	 
  </form>
  
</div>
</div>
</body>
</html>