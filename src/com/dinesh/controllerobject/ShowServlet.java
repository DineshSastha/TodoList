package com.dinesh.controllerobject;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dinesh.beanobject.List;
import com.dinesh.businessobject.IndexLogic;
import com.dinesh.connection.ConnectionObject;

/**
 * Servlet implementation class ShowServlet
 */
@WebServlet("/ShowServlet")
public class ShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Connection connection = ConnectionObject.createConnection();
			String taskId =(request.getParameter("taskId"));
			List list =IndexLogic.showList(connection,taskId);
			request.setAttribute("taskId",list.getTaskId());
			request.setAttribute("name", list.getName());
    		request.setAttribute("date",list.getDate());
    		request.setAttribute("content", list.getContent());
    		request.setAttribute("priority", list.getPriority());
    		request.setAttribute("addedAt", list.getAddedAt());
			RequestDispatcher rd = null;
			rd = request.getRequestDispatcher("/show.jsp");
			rd.include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
