package com.dinesh.controllerobject;

import java.io.IOException;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

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
 * Servlet implementation class SaveServlet
 */
@WebServlet("/SaveServlet")
public class SaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					Connection connection = ConnectionObject.createConnection();
					String save = request.getParameter("saveId");
					List list = new List();
					list.setName(request.getParameter("name"));
					list.setPriority(Integer.parseInt(request.getParameter("priority")));
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					sdf.setLenient(false);
					try {
						System.out.println(request.getParameter("date"));
						list.setDate(sdf.parse(request.getParameter("date")));
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} 
					list.setContent(request.getParameter("content"));
					list.setAddedAt(Calendar.getInstance().getTime());
					Boolean condition = IndexLogic.save(connection,save,list);
					RequestDispatcher rd = null;
					if(condition){
						rd = request.getRequestDispatcher("/index.jsp");
						rd.include(request, response);
					}
					else{
						rd = request.getRequestDispatcher("/edit.jsp");
						rd.include(request,response);
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
