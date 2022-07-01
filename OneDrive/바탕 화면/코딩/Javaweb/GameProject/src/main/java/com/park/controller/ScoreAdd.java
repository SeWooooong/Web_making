package com.park.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.park.dao.GameDao;

/**
 * Servlet implementation class ScoreAdd
 */
@WebServlet("/ScoreAdd")
public class ScoreAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GameDao dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScoreAdd() {
        super();
        dao=new GameDao();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		double score = Double.parseDouble(request.getParameter("score"));
		this.dao.addScore(id, name, score);
		request.getRequestDispatcher("Game.jsp").forward(request, response);
	}

}
