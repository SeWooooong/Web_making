package com.park.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.park.dao.GameDao;
import com.park.model.User;


@WebServlet("/ScoreController")
public class ScoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private GameDao dao;
  
    public ScoreController() {
        super();
        dao=new GameDao();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> scoreList=this.dao.getAllScore();
		request.setAttribute("scoreList", scoreList);
		request.getRequestDispatcher("ranking.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		double score = Double.parseDouble(request.getParameter("score"));
		this.dao.updateScore(id, score);
		request.getRequestDispatcher("Game.jsp").forward(request, response);
	}

}
