package com.park.model;


public class User {

	private String userid;
	private String password;
	private String email;
	private String phone;
	private String nickname;
	private String passwordcheck;
	private double score;
	
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score=score;
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String Password) {
		this.password = Password;
	}
	
	public void setPasswordcheck(String Passwordcheck) {
		this.passwordcheck = Passwordcheck;
	}
	public String getPasswordcheck() {
		return passwordcheck;
	}
	
	public String getphone() {
		return phone;
	}
	public void setphone(String phone) {
		this.phone = phone;
	}
	
	public String getnickname() {
		return nickname;
	}
	public void setnickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
