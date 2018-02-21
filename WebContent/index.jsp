<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ToDo List</title>
</head>
<body>
	<% if((request.getAttribute("message")!= null) && (request.getAttribute("message").equals("")) ){ %>
    <h1 style="color:red"><%= request.getAttribute("message") %></h1>
    <%} %>
	<form method="post" action="IndexServlet">
	    <h1 style="background-color:blue;text-align:center">TODO LIST</h1>
	
		<h3 style="text-align:center">Title:   <input type="text" placeholder="Enter Title" name="name"/></h3>
		<br/>
		<h3 style="text-align:center">Date:   <input type="date" placeholder="Enter the date"  name="date"/></h3>
		<br/>
		<h3 style="text-align:center">Content:  <br> <textarea cols="50" rows="10" placeholder="Enter your content, Maximum length=1000 characters" name="content"></textarea><br></h3><br/>
		<br/>
		<h3 style="text-align:center">Priority :  
		<select name="priority">
		   <option>1</option>
		   <option>2</option>
		   <option>3</option>
		   <option>4</option>
		   <option>5</option>
		</select>
		</h3>
		<br/>
		<p style="text-align:center"><button type="submit">Submit</button>
	</form>
	<form method="post" action="ListServlet">
		<p style="text-align:center"><button type="submit">Show Added Notes</button>
	</form>
	
</body>
</html>