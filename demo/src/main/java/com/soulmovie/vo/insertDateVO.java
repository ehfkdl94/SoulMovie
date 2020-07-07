package com.soulmovie.vo;

public class insertDateVO {
	private String choicedate= null;
	private int count = 0;
	public String getChoicedate() {
		return choicedate;
	}
	public void setChoicedate(String choicedate) {
		this.choicedate = choicedate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "insertDateVO [choicedate=" + choicedate + ", count=" + count + "]";
	}
	
}
