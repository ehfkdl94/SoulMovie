package com.soulmovie.vo;

public class MemberVO {
	private int userid = 0;
	private String password = null;
	private String userrname = null;
	private String usernick = null;
	private String userage = null;
	private String usergender = null;
	private String useremail = null;
	private int userccnt = 0;
	private String admin = null;
	private String joindate = null;
	private String username= null;
	


	
	
	//Getter Setter
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserrname() {
		return userrname;
	}
	public void setUserrname(String userrname) {
		this.userrname = userrname;
	}
	public String getUsernick() {
		return usernick;
	}
	public void setUsernick(String usernick) {
		this.usernick = usernick;
	}
	public String getUserage() {
		return userage;
	}
	public void setUserage(String userage) {
		this.userage = userage;
	}
	public String getUsergender() {
		return usergender;
	}
	public void setUsergender(String usergender) {
		this.usergender = usergender;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public int getUserccnt() {
		return userccnt;
	}
	public void setUserccnt(int userccnt) {
		this.userccnt = userccnt;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;			
	}
	
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	//toString
	@Override
	public String toString() {
		return "MemberVO [userid=" + userid + ", password=" + password + ", userrname=" + userrname + ", usernick="
				+ usernick + ", userage=" + userage + ", usergender=" + usergender + ", useremail=" + useremail
				+ ", userccnt=" + userccnt + ", admin=" + admin + ", joindate=" + joindate + ", username=" + username +"]";
	}
	
	
}
