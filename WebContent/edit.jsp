<%@page import="java.io.PrintStream,java.util.*,java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Your List</title>
</head>
<body>
		<form method="get" action="SaveServlet" onsubmit="return validate()">
		<% List<String> selectedList = new ArrayList<String>();
			selectedList.add("1");
			selectedList.add("2");
			selectedList.add("3");
			selectedList.add("4");
			selectedList.add("5");
		%>
	    <h1 style="background-color:blue;text-align:center"> Edit your TODO LIST</h1>
	
		<h3 style="text-align:center">Title:   <input type="text"  size="50" maxlength="250" autofocus="autofocus" pattern="[A-Za-z]+" id = "name" name="name" value="<%=request.getAttribute("name") %>" /></h3><label id = "titleError"></label>
		<br/>
		<h3 style="text-align:center">Date:   <input type="date"   id = "date" name="date" value="<%=request.getAttribute("date")%>" /></h3><label id = "dateError"></label>
		<br/>
		<h3 style="text-align:center">Content:  <br> <textarea id="content" cols="50" rows="10"  name="content" maxlength="1000" >
			<%=request.getAttribute("content").toString() %></textarea><br></h3><label id="contentError"></label><br/>
		<br/>
		<h3 style="text-align:center">Priority :  
		<select name="priority" id = "priority">
		<% String abc =request.getAttribute("priority").toString();
			System.out.println(abc);
			System.out.println(selectedList);
			for(String options : selectedList){
				if(abc.equals(options)){
					out.print("<option selected>"+options+"</option>");
				}else{
					out.print("<option>"+options+"</option>");
				}
			}
		%>
		</select><label id="priorityError"></label>
		</h3>
		<br/>
		<input type="hidden" name="saveId" value="<%=request.getAttribute("taskId") %>"/>
		<p style="text-align:center"><button type="submit">Save</button></p>
	</form>
	<script src="js/validate.js">
	</script>
</body>
</html>