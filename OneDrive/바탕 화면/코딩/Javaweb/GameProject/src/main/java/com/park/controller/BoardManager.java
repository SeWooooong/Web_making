package com.park.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.park.dao.BoardDao;
import com.park.model.Board;
import com.park.model.User;

/**
 * Servlet implementation class BoardManager
 */
@WebServlet("/BoardManager")
public class BoardManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardDao dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardManager() {
        super();
        this.dao=new BoardDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 List<Board> boardList = this.dao.getAllUsers();
         request.setAttribute("boardList", boardList);
         String action = request.getParameter("action"); 
         if(action != null) {
             if(action.equalsIgnoreCase("delete")) {
           	  String Id=request.getParameter("ID");
           	  int num = Integer.parseInt(request.getParameter("num"));
           	  this.dao.deleteBoard(Id,num);
           	  request.setAttribute("boardList", dao.getAllUsers()); 
                }
             }
       
         request.getRequestDispatcher("managerBoard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
