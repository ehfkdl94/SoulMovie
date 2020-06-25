package com.soulmovie.vo;

public class ContactVO {
	private int cno = 0;
	private String cname = null;
	private String cemail = null;
	private String csubject = null;
	private String cmessage = null;
	private String cdate = null;
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCemail() {
		return cemail;
	}
	public void setCemail(String cemail) {
		this.cemail = cemail;
	}
	public String getCsubject() {
		return csubject;
	}
	public void setCsubject(String csubject) {
		this.csubject = csubject;
	}
	public String getCmessage() {
		return cmessage;
	}
	public void setCmessage(String cmessage) {
		this.cmessage = cmessage;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	@Override
	public String toString() {
		return "ContactVO [cno=" + cno + ", cname=" + cname + ", cemail=" + cemail + ", csubject=" + csubject
				+ ", cmessage=" + cmessage + ", cdate=" + cdate + "]";
	}
	
}
