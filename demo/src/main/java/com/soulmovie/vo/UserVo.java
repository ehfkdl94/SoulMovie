package com.soulmovie.vo;

public class UserVo {

	
	 private Long userid = 0L;
	 private String username = null;
	 private String password =null;
	 private String userrname = null;
	 private String usernick =null;
	 private String userage = null;
	 private String usergender = null;
	 private String useremail = null;
	 private long userccnt =0L;
	 private String admin ="USER";
	 private String joindate = null;

	
	public Long getUserid() {
		return userid;
	}


	public void setUserid(Long userid) {
		this.userid = userid;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
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


	public long getUserccnt() {
		return userccnt;
	}


	public void setUserccnt(long userccnt) {
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


	@Override
	public String toString() {
		return "UserVo [userid=" + userid + ", username=" + username + ", password=" + password + ", userrname="
				+ userrname + ", usernick=" + usernick + ", userage=" + userage + ", usergender=" + usergender
				+ ", useremail=" + useremail + ", userccnt=" + userccnt + ", admin=" + admin + ", joindate=" + joindate
				+ "]";
	}
	
}
