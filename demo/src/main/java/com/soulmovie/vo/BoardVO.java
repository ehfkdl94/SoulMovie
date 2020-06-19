package com.soulmovie.vo;

import java.util.Arrays;

public class BoardVO {
	
	private long brdno = 0L;
	private int brdid = 0;
	private String brdtitle = null;
	private String brddate = null;
	private String brdcontent = null;
	private byte[] brdimg = null;
	private long brdhit = 0L;
	private long brdlike = 0L;
	
	//Getter Setter
	public long getBrdno() {
		return brdno;
	}
	public void setBrdno(long brdno) {
		this.brdno = brdno;
	}
	public int getBrdid() {
		return brdid;
	}
	public void setBrdid(int brdid) {
		this.brdid = brdid;
	}
	public String getBrdtitle() {
		return brdtitle;
	}
	public void setBrdtitle(String brdtitle) {
		this.brdtitle = brdtitle;
	}
	public String getBrddate() {
		return brddate;
	}
	public void setBrddate(String brddate) {
		this.brddate = brddate;
	}
	public String getBrdcontent() {
		return brdcontent;
	}
	public void setBrdcontent(String brdcontent) {
		this.brdcontent = brdcontent;
	}
	public byte[] getBrdimg() {
		return brdimg;
	}
	public void setBrdimg(byte[] brdimg) {
		this.brdimg = brdimg;
	}
	public long getBrdhit() {
		return brdhit;
	}
	public void setBrdhit(long brdhit) {
		this.brdhit = brdhit;
	}
	public long getBrdlike() {
		return brdlike;
	}
	public void setBrdlike(long brdlike) {
		this.brdlike = brdlike;
	}
	//to String
	@Override
	public String toString() {
		return "BoardVO [brdno=" + brdno + ", brdid=" + brdid + ", brdtitle=" + brdtitle + ", brddate=" + brddate
				+ ", brdcontent=" + brdcontent + ", brdimg=" + Arrays.toString(brdimg) + ", brdhit=" + brdhit
				+ ", brdlike=" + brdlike + "]";
	}
	

}
