function validate(){
		/* validate title */
		
		var title= document.getElementById("name").value;
		var date = document.getElementById("date").value;
		var content = document.getElementById("content").value;
		var priority = document.getElementById("priority").value;
		if(title===""){
			document.getElementById("titleError").innerHTML= "title is mandatory";
			return false;
		}else{
			document.getElementById("titleError").innerHTML="";
		}
		
		/* end of validate title */
		/* validate date */
		if(date===""){
			document.getElementById("dateError").innerHTML = "date is mandatory";
			return false;
		}else{
			document.getElementById("dateError").innerHTML="";
		}
		var now = new Date();
		var then = document.getElementById("date").value;
		if((then - now)<0){
			document.getElementById("dateError").innerHTML = "Enter the valid date more than today";
			return false;
		}else{
			document.getElementById("dateError").innerHTML = "";
		}
		/* end of validate date */
		
		/* validate content */
		if(content===""){
			document.getElementById("contentError").innerHTML = "content is mandatory";
			document.getElementById("content").focus();
			return false;
		}else{
			document.getElementById("conentError").innerHTML="";
		}
		/* end of validate content */
		
		/* validate priority */
		if(content===""){
			document.getElementById("priorityError").innerHTML = "priority is mandatory";
			return false;
		}else{
			document.getElementById("prioirtyError").innerHTML="";
		}
		/* end of validate priority */
		
		return flag;
		
	}
	