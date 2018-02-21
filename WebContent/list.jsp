<%@page import="java.util.LinkedList,java.util.Iterator" %>
<%@page import="com.dinesh.beanobject.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Saved Lists</title>
<script>
	function submitId(id){
		document.getElementById("id").value=id;
		var form= document.getElementById("showList");
		form.submit();
	}
</script>
</head>
<body>
	<% LinkedList<List> todoList =  (LinkedList<List>)request.getAttribute("todoLists"); 
  	 Iterator<List> show = todoList.iterator();%>
  	 <form id="showList" method="get" action="ShowServlet">
  	 	<input id="id" name="taskId" type="hidden">
  	 </form>
  	 <table>
  	 		<caption style="color:red">Reminder Lists</caption>
  	 		<tr>
				<th>Task Id</th>
				<th>Title</th>
				<th>Date</th>
		    </tr>
  	 		<% while(show.hasNext()){
  	 			    List list = (List)show.next(); %>
  	 		    <tr>
  	 		    	<td><a onclick='submitId(<%= list.getTaskId() %>)'><%= list.getTaskId() %></a></td>
  	 		    	<td><%= list.getName() %></td>
  	 		    	<td><%= list.getDate() %></td>
  	 		    </tr>
  	 		<% } %>
  	 </table>
  	 <br/>
		<a href="index.jsp"><button type="submit">Tap here to add a List</button></a>
	<br/>
	    <h4>Note:</h4><p>Click on corresponding TaskId to view your List</p>
  	 
</body>
</html>