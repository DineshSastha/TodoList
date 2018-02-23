<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ToDo List</title>
</head>
<body>
	<% if(request.getAttribute("message")!= null && !request.getAttribute("message").equals("") ){ %>
    <h1 style="color:red"><%= request.getAttribute("message") %></h1>
    <% request.setAttribute("message",""); } %>
	<form method="post" action="IndexServlet" onsubmit="return validate()">
	    <h1 style="background-color:blue;text-align:center">TODO LIST</h1>
	
		<h3 style="text-align:center">Title:   <input type="text" pattern="[A-Za-z]+" placeholder="Enter Title" id="name" name="name" size="50"  maxlength="250" autofocus="autofocus"/></h3><label id="titleError"></label>
		<br/>
		<h3 style="text-align:center">Date:   <input type="date" placeholder="Enter the date" id="date" name="date" /></h3><label id = "dateError"></label>
		<br/>
		<h3 style="text-align:center">Content:  <br> <textarea cols="50" rows="10" placeholder="Enter your content, Maximum length=1000 characters" id = "content" name="content" maxlength="1000"></textarea><br></h3><label id="contentError"></label>
		<br/>
		<h3 style="text-align:center">Priority :  
		<select name="priority" id = "priority" required> 
		   <option value="1">very high</option>
		   <option value="2">high</option>
		   <option value="3">medium</option>
		   <option value="4">low</option>
		   <option value="5">very low</option>
		</select>
		</h3><label id = "priorityError"></label>
		<br/>
		<p style="text-align:center"><button type="submit">Submit</button>
	</form>
	<form method="post" action="ListServlet">
		<p style="text-align:center"><button type="submit">Show Added Notes</button>
	</form>
	<script type="text/javascript" src="js/validate.js">
	
	</script>
</body>
</html>