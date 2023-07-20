<%@page import="com.quiz.College"%>
<%@page import="com.quiz.DBHandler"%>
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
<title>Add Question</title>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->
  <%
  College clg=(College)session.getAttribute("clg");
  %>
  <a class="navbar-brand" href="#"><%=clg.getName() %></a>


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
  
  <form action="MainController" style="margin:20px;padding:20px 0px 20px 0px;">
  <h3>Add Question</h3><hr>
	<div class="form-group">
	   <label for="comment">Question:</label>
	  <textarea class="form-control" rows="5" id="comment" name="question"></textarea>
	</div>
	<div class="form-group">
	  <label for="usr">Option 1:</label>
	  <input type="text" class="form-control"  name="op1">
	</div>
	
	<div class="form-group">
	  <label for="usr">Option 2:</label>
	  <input type="text" class="form-control"  name="op2">
	</div>
	
	<div class="form-group">
	  <label for="usr">Option 3:</label>
	  <input type="text" class="form-control" name="op3">
	</div>
	
	<div class="form-group">
	  <label for="usr">Option 4:</label>
	  <input type="text" class="form-control"  name="op4">
	</div>
	
	<div class="form-group">
	  <label for="usr">Answer:</label>
	  <input type="text" class="form-control"  name="answer">
	</div>
	
	
	  <input type="hidden" class="form-control"  name="testId" value="<%=session.getAttribute("testId")%>">
	
	
	<div class="form-group">
	  <button type="submit" class="btn btn-primary" name="task" value="addQuestion" >Add Question</button>
	  <button type="submit" class="btn btn-primary" name="task" value="testscreen" >Done</button>
	</div>
	 <div class="form-group"></div>
	 
  </form>
</div>
</div>
</body>
</html>