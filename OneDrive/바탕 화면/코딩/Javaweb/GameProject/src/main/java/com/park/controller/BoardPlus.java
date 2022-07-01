package com.park.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.park.dao.BoardDao;
import com.park.model.Board;

/**
 * Servlet implementation class BoardPlus
 */
@WebServlet("/BoardPlus")
public class BoardPlus extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private BoardDao dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardPlus() {
        super();
        this.dao=new BoardDao();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		String date = request.getParameter("date");
		int hit = 0;
		Board user = new Board();
		user.setID(id); user.setContent(content); user.setTitle(title); user.setDate(date); user.setHit(hit);
		boolean check = this.dao.addBorder(user);
		if(check == true) {
			request.getRequestDispatcher("plusContent.jsp").forward(request, response);
		}
	}

}
