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
import com.park.model.comment;


@WebServlet("/BoardController")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private BoardDao dao;
   
    public BoardController() {
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
			Board board = new Board();
			if(action.equalsIgnoreCase("Content")) {
				int num = Integer.parseInt(request.getParameter("num"));
				String id = request.getParameter("id");
				board.setID(id); board.setNum(num);
				
				List<comment> comlist = this.dao.getComment(num);
				request.setAttribute("comlist", comlist);
                
				this.dao.updateHit(board);
				board=this.dao.getContent(num,id);
				
				request.setAttribute("content", board);
				request.getRequestDispatcher("Content.jsp").forward(request, response);
			}
		}
		else {
		request.getRequestDispatcher("bulletinBoard.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
