package com.soulmovie.vo;

public class LikeVO {

	private long brdno = 0L;
	private int userid = 0;
	private int lno = 0;

	
	
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	public long getBrdno() {
		return brdno;
	}
	public void setBrdno(long brdno) {
		this.brdno = brdno;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "LikeVO [brdno=" + brdno + ", userid=" + userid + "]";
	}
	
}
