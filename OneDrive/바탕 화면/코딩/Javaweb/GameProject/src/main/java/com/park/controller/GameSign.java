package com.park.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.park.dao.GameDao;
import com.park.model.User;

/**
 * Servlet implementation class GameSign
 */
@WebServlet("/GameSign")
public class GameSign extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GameDao gameDao;    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameSign() {
        super();
        this.gameDao = new GameDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String id = request.getParameter("id");
		 String pwd = request.getParameter("pwd");
		 String pwdcheck = request.getParameter("pwdcheck");
		 String email = request.getParameter("email");
		 String phone = request.getParameter("phone");
		 String nickname = request.getParameter("name");
		 User user = new User();
	
		 user.setUserid(id);
		 user.setPassword(pwd);
		 user.setPasswordcheck(pwdcheck);
		 user.setEmail(email);
		 user.setphone(phone);
		 user.setnickname(nickname);
		
	     boolean signin = this.gameDao.addUser(user);
	     if(signin == true) {
	    	 request.getRequestDispatcher("signin.jsp").forward(request, response);
	     }
	     
	}

}
