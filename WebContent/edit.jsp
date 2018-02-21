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
		<form method="get" action="SaveServlet">
		<% List<String> selectedList = new ArrayList<String>();
			selectedList.add("1");
			selectedList.add("2");
			selectedList.add("3");
			selectedList.add("4");
			selectedList.add("5");
		%>
	    <h1 style="background-color:blue;text-align:center"> Edit your TODO LIST</h1>
	
		<h3 style="text-align:center">Title:   <input type="text"  name="name" value="<%=request.getAttribute("name") %>" /></h3>
		<br/>
		<h3 style="text-align:center">Date:   <input type="date"   name="date" value="<%=request.getAttribute("date")%>" /></h3>
		<br/>
		<h3 style="text-align:center">Content:  <br> <textarea cols="50" rows="10"  name="content" >
			<%=request.getAttribute("content").toString() %></textarea><br></h3><br/>
		<br/>
		<h3 style="text-align:center">Priority :  
		<select name="priority">
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
		</select>
		</h3>
		<br/>
		<input type="hidden" name="saveId" value="<%=request.getAttribute("taskId") %>"/>
		<p style="text-align:center"><button type="submit">Save</button></p>
	</form>
</body>
</html>