package com.soulmovie.vo;

public class LikeVO {

	private long brdno = 0L;
	private String userid = null;
	
	
	public long getBrdno() {
		return brdno;
	}
	public void setBrdno(long brdno) {
		this.brdno = brdno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "LikeVO [brdno=" + brdno + ", userid=" + userid + "]";
	}
	
}
