package com.park.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.park.model.User;
import com.park.util.Dbutil;

public class GameDao {

	private Connection connection;

	public GameDao() {
		connection = Dbutil.getConnection();
	}

	public boolean addUser(User user) {
		boolean check = true;;
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("insert into gameproject.signin_table values (?, ?, ?, ?, ?, ?)");
			preparedStatement.setString(1, user.getUserid());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getPasswordcheck());
			preparedStatement.setString(4, user.getEmail());
			preparedStatement.setString(5, user.getphone());
			preparedStatement.setString(6, user.getnickname());
			
			preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			check=false;
		}
		return check;
	}
	
	public void deleteUser(String userId) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("delete from gameproject.signin_table where id=?");
			preparedStatement.setString(1, userId);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void addScore(String id, String name, double score) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("insert into gameproject.ranking values (?, ?, ?)");
			preparedStatement.setString(1, id);
			preparedStatement.setString(2, name);
			preparedStatement.setDouble(3, score);
			preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateScore(String id, double score) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("update ranking set score=?" +"where id=?");
			preparedStatement.setDouble(1, score);
			preparedStatement.setString(2, id);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<User> getAllScore(){
		List<User> users = new ArrayList<User>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from ranking order by score asc");
			while(rs.next()) {
				User user = new User();
				user.setUserid(rs.getString("id"));
				user.setnickname(rs.getString("name"));
				user.setScore(Double.parseDouble(rs.getString("score")));
				users.add(user);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}
	
	public List<User> getAllUsers() {
		List<User> users = new ArrayList<User>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from gameproject.signin_table");
			while (rs.next()) {
				User user = new User();
				user.setUserid(rs.getString("id"));
				user.setEmail(rs.getString("Email"));
				user.setphone(rs.getString("phone"));
				user.setnickname(rs.getString("nickname"));
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return users;
	}
	
	public User getUserID(String e_mail, String tell) {
		User user = new User();
		
		try {
			PreparedStatement preparedStatement = connection.
					prepareStatement("select * from gameproject.signin_table where Email=? and phone=?");
			preparedStatement.setString(1, e_mail);
			preparedStatement.setString(2, tell);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
			user.setUserid(rs.getString("id"));
			user.setPassword(rs.getString("password"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
		
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