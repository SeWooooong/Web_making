package com.park.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.park.model.Board;
import com.park.model.User;
import com.park.model.comment;
import com.park.util.Dbutil;

public class BoardDao {

	private Connection connection;

	public BoardDao() {
		connection = Dbutil.getConnection();
	}

	public boolean addBorder(Board user) {
		boolean check = true;;
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("insert into bulletinboard values (?, ?, ?, ?, ?, ?)");
			preparedStatement.setInt(1, user.getNum());
			preparedStatement.setString(2, user.getID());
			preparedStatement.setString(3, user.getTitle());
			preparedStatement.setString(4, user.getDate());
			preparedStatement.setInt(5, user.getHit());
			preparedStatement.setString(6, user.getContent());
			
			preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			check=false;
		}
		return check;
	}
	
	public void deleteBoard(String Id, int num) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("delete from gameproject.bulletinboard where num=? and id=?");
			preparedStatement.setInt(1, num);
			preparedStatement.setString(2, Id);
			
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void insertComment(int num, String id, String comment) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("insert into comment values (?, ?, ?)");
			preparedStatement.setInt(1, num);
			preparedStatement.setString(2, id);
			preparedStatement.setString(3, comment);
			preparedStatement.executeUpdate();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	public void updateHit(Board user) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("update gameproject.bulletinboard set hit=hit+1 where num=? and id=?");

		   preparedStatement.setInt(1, user.getNum());
		   preparedStatement.setString(2, user.getID()); 
		   preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

	
	
	
	
	public Board getContent(int num, String id) {
		Board board = new Board();
		try {
			PreparedStatement preparedStatement = connection.
					prepareStatement("select * from gameproject.bulletinboard where num=? and id=?");
			preparedStatement.setInt(1, num);
			preparedStatement.setString(2, id); 
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
			board.setNum(num);
			board.setID(rs.getString("id"));
			board.setTitle(rs.getString("title"));
			board.setContent(rs.getString("content"));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return board;
	}

	
	 
	public List<comment> getComment(int num) {
		List<comment> comts = new ArrayList<comment>();
		try {
			PreparedStatement preparedStatement = connection.
					prepareStatement("select * from gameproject.comment where num=?");
			preparedStatement.setInt(1, num);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
			comment comt = new comment();
			comt.setNum(num);
			comt.setID(rs.getString("id"));
			comt.setComment(rs.getString("comment"));
			comts.add(comt);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return comts;
	}
	
	public List<Board> getAllUsers() {
		List<Board> boards = new ArrayList<Board>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from gameproject.bulletinboard");
			while (rs.next()) {
				Board board = new Board();
				board.setNum(rs.getInt("num"));
				board.setID(rs.getString("id"));
				board.setTitle(rs.getString("Title"));
				board.setDate(rs.getString("date"));
				board.setHit(rs.getInt("hit"));
				boards.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return boards;
	}
	public boolean getUserByLogin(String userId, String password) {
		User user = new User();
		boolean login = false;
		try {
			PreparedStatement preparedStatement = connection.
					prepareStatement("select * from gameproject.signin_table");
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				user.setUserid(rs.getString("id"));
				user.setPassword(rs.getString("password"));
				if(user.getUserid().equals(userId) && user.getPassword().equals(password)) {
					login = true;
					break;
				}	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return login;
	}
}
