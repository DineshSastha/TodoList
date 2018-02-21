package com.dinesh.beanobject;

import java.util.Date;

public class List {
			private String name,content;
			private  Date date,addedAt;	
			private int priority,taskId;
			
			public int getTaskId() {
				return taskId;
			}
			public void setTaskId(int taskId) {
				this.taskId = taskId;
			}
			public Date getAddedAt() {
				return addedAt;
			}
			public void setAddedAt(Date addedAt) {
				this.addedAt = addedAt;
			}
			
			public String getName() {
				return name;
			}
			public void setName(String name) {
				this.name = name;
			}
			public String getContent() {
				return content;
			}
			public void setContent(String content) {
				this.content = content;
			}
			public Date getDate() {
				return date;
			}
			public void setDate(Date date) {
				this.date = date;
			}
			public int getPriority() {
				return priority;
			}
			public void setPriority(int priority) {
				this.priority = priority;
			}
			
			
}
