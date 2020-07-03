package com.soulmovie.vo;

public class BoardChatVO {
   private long no = 0L;
   private long userid =0L;
   private String usernick =null;
   private String content=null;
   private String createdate = null;
   private long brdno = 0L;
   private String username =null;
   private int brdnumber = 0;
   private int check =0;
   
   
   public int getCheck() {
      return check;
   }
   public void setCheck(int check) {
      this.check = check;
   }
   public int getBrdnumber() {
      return brdnumber;
   }
   public void setBrdnumber(int brdnumber) {
      this.brdnumber = brdnumber;
   }
   public String getUsername() {
      return username;
   }
   public void setUsername(String username) {
      this.username = username;
   }
   public long getNo() {
      return no;
   }
   public void setNo(long no) {
      this.no = no;
   }
   public long getUserid() {
      return userid;
   }
   public void setUserid(long userid) {
      this.userid = userid;
   }
   public String getUsernick() {
      return usernick;
   }
   public void setUsernick(String usernick) {
      this.usernick = usernick;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getCreatedate() {
      return createdate;
   }
   public void setCreatedate(String createdate) {
      this.createdate = createdate;
   }
   public long getBrdno() {
      return brdno;
   }
   public void setBrdno(long brdno) {
      this.brdno = brdno;
   }
   @Override
   public String toString() {
      return "BoardChatVO [no=" + no + ", userid=" + userid + ", usernick=" + usernick + ", content=" + content
            + ", createdate=" + createdate + ", brdno=" + brdno + ", username=" + username + ", brdnumber="
            + brdnumber + ", check=" + check + "]";
   }

   
   
}
