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
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("message","");
		Connection connection = ConnectionObject.createConnection();
		String delete = request.getParameter("deleteId");
		Boolean condition = IndexLogic.delete(connection,delete);
		RequestDispatcher rd = null;
		if(condition){
			rd = request.getRequestDispatcher("/index.jsp");
			request.setAttribute("message", "Selected List Deleted Successfully!!");
			rd.include(request, response);
		}
		else{
			rd = request.getRequestDispatcher("/show.jsp");
			request.setAttribute("message","Something went Wrong");
			rd.include(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
