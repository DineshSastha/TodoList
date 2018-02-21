package com.dinesh.businessobject;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

import com.dinesh.beanobject.List;
import com.dinesh.connection.ConnectionObject;

public class IndexLogic {

	public static Boolean indexing(Connection connection,List list){
			try{
				String sql = "insert into todo_lists(name,date,content,priority,added_at)"
						+ "values(?,?,?,?,?)";
				PreparedStatement pst = connection.prepareStatement(sql);
				pst.setString(1, list.getName());
				pst.setDate(2,new Date(list.getDate().getTime()));
				pst.setString(3, list.getContent());
				pst.setInt(4, list.getPriority());
				pst.setDate(5,new Date(list.getAddedAt().getTime()));
				int rs = pst.executeUpdate();
				if(rs>0){
					ConnectionObject.closeConnection();
					return true;
				}
			}catch(Exception e){
				e.printStackTrace();
				return false;
			}
			ConnectionObject.closeConnection();
			return true; 
	}
	public static LinkedList<List> getList(Connection connection){
		List list;
		LinkedList<List> lists = new LinkedList<List>();
		try{
			String sql = "Select task_id,name,date from todo_lists";
			PreparedStatement pst = connection.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				list = new List();
				list.setName(rs.getString("name"));
				list.setDate(rs.getDate("date"));
				list.setTaskId(rs.getInt("task_id"));
				lists.add(list);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("cancelled");
			
		}
				
		return lists;
			
	}
	public static  List showList(Connection connection,String showTask){
		List list = new List();
		try{
			String sql = "Select * from todo_lists where task_id=(?)";
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, Integer.parseInt(showTask));
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				list.setTaskId(rs.getInt("task_id"));
				list.setName(rs.getString("name"));
				list.setDate(rs.getDate("date"));
				list.setContent(rs.getString("content"));
				list.setPriority(rs.getInt("priority"));
				list.setAddedAt(rs.getDate("added_at"));
			}
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
		return list;
		
	}
	public static Boolean delete(Connection connection, String delete) {
		try{
			String sql = "Delete from todo_lists where task_id=(?)";
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, Integer.parseInt(delete));
			int rs = pst.executeUpdate();
			if(rs>0){
				ConnectionObject.closeConnection();
				return true;
			}
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
		
	}
}
