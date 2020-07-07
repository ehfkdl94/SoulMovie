	package com.soulmovie.vo;

public class JoinDateVO {
	private String joindate = null;
	private int count = 0;
	
	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "JoinDateVO [joindate=" + joindate + ", count=" + count + "]";
	}
	
}
