package com.park.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.park.model.User;
import com.park.dao.GameDao;

/**
 * Servlet implementation class GameController
 */
@WebServlet("/GameController")
public class GameController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     private GameDao gameDao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameController() {
        super();
        // TODO Auto-generated constructor stub
        this.gameDao = new GameDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
		String id = request.getParameter("id");
		 String pwd = request.getParameter("pwd");
		 boolean login = this.gameDao.getUserByLogin(id, pwd);
	     if(login == true) {
	    	 request.getRequestDispatcher("login_success.jsp?first=" + id ).forward(request, response);
	    	 
	     }
	     else {
	    	 request.getRequestDispatcher("login_fail.jsp").forward(request, response);
	    	
	     }
	}

}
