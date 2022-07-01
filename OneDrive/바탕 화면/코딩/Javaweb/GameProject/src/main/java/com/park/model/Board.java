package com.park.model;

public class Board {
	
	private int num;
	private String title;
	private String id;
	private String date;
	private String content;
	private int hit;
	
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title=title;
	}
	public String getID() {
		return id;
	}
	public void setID(String id) {
		this.id=id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date=date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit=hit;
	}
	
	public void setContent(String content) {
		this.content=content;
	}
	public String getContent() {
		return content;
	}
	
}
