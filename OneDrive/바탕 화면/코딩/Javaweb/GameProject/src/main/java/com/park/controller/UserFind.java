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
 * Servlet implementation class UserFind
 */
@WebServlet("/UserFind")
public class UserFind extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GameDao gameDao;
       

    public UserFind() {
        super();
        // TODO Auto-generated constructor stub
        this.gameDao = new GameDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		     User user= new User();
			 String e_mail = request.getParameter("e-mail");
			 String tell = request.getParameter("tel");
			 user = this.gameDao.getUserID(e_mail, tell);
			 String id =user.getUserid(); String psw = user.getPassword();
			 if(user.getUserid() != null) {
			 request.getRequestDispatcher("Find.jsp?id="+id+"&psw="+psw).forward(request, response);
			 }
			 else {
				 request.getRequestDispatcher("Findfail.jsp").forward(request, response);
			 }
		   
	}

}
