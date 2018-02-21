<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Details</title>
</head>
<body>
<% if((request.getAttribute("message")!= null) && (request.getAttribute("message").equals("")) ){ %>
    <h1 style="color:blue"><%= request.getAttribute("message") %></h1>
    <%} %>
		<table>
			<caption style="color:red">Show Lists</caption>
			<tr>
				<td>Task ID:</td>
				<td><%=request.getAttribute("taskId") %></td>
			</tr>
			<tr>
				<td>Name:</td>
				<td><%=request.getAttribute("name") %></td>
			</tr>
			<tr>
				<td>Date:</td>
				<td><%=request.getAttribute("date") %></td>
			</tr>
			<tr>
				<td>Content:</td>
				<td><%=request.getAttribute("content") %></td>
			</tr>
			<tr>
				<td>Priority:</td>
				<td><%=request.getAttribute("priority") %></td>
			</tr>
			<tr>
				<td>Added at:</td>
				<td><%=request.getAttribute("addedAt") %></td>
			</tr>
		</table>
		<br/>
		<form method="get" action="EditServlet">
			<input type="hidden" name="editId" value="<%=request.getAttribute("taskId") %>"/>
			<button type="submit">Edit</button>
		</form>
		<br/>
		<form method="get" action="DeleteServlet">
			<input type="hidden" name="deleteId" value="<%=request.getAttribute("taskId") %>"/>
			<button type="submit">Delete</button>
		</form>

</body>
</html>