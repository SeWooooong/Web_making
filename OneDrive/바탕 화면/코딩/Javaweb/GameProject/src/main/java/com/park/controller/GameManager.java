package com.park.controller;

import com.park.model.User;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.park.dao.GameDao;

@WebServlet("/GameManager")

public class GameManager extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private GameDao dao;
	  public GameManager() {
	        super();
	        dao = new GameDao();
	    }
	  
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	  List<User> userList = this.dao.getAllUsers();
          request.setAttribute("userList", userList);
          String action = request.getParameter("action"); 
          if(action != null) {
              if(action.equalsIgnoreCase("delete")) {
            	  String userId=request.getParameter("userId");
            	  this.dao.deleteUser(userId);
            	  request.setAttribute("userList", dao.getAllUsers()); 
                 }
              }
        
          request.getRequestDispatcher("manager.jsp").forward(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
