package com.soulmovie.vo;

public class ChoiceVO {
	
	private long choice_no = 0L;
	private long choice_freq = 0L;
	private String choice_reason = null;
	private String choice_category = null;
	private String choice_date = null;
	private int choice_code = 0;
	private String choice_id = null;
	
	
	//Getter Setter
	public long getChoice_no() {
		return choice_no;
	}
	public void setChoice_no(long choice_no) {
		this.choice_no = choice_no;
	}
	public long getChoice_freq() {
		return choice_freq;
	}
	public void setChoice_freq(long choice_freq) {
		this.choice_freq = choice_freq;
	}
	public String getChoice_reason() {
		return choice_reason;
	}
	public void setChoice_reason(String choice_reason) {
		this.choice_reason = choice_reason;
	}
	public String getChoice_category() {
		return choice_category;
	}
	public void setChoice_category(String choice_category) {
		this.choice_category = choice_category;
	}
	public String getChoice_date() {
		return choice_date;
	}
	public void setChoice_date(String choice_date) {
		this.choice_date = choice_date;
	}
	public int getChoice_code() {
		return choice_code;
	}
	public void setChoice_code(int choice_code) {
		this.choice_code = choice_code;
	}
	public String getChoice_id() {
		return choice_id;
	}
	public void setChoice_id(String choice_id) {
		this.choice_id = choice_id;
	}
	
	//to String
	@Override
	public String toString() {
		return "ChoiceVO [choice_no=" + choice_no + ", choice_freq=" + choice_freq + ", choice_reason=" + choice_reason
				+ ", choice_category=" + choice_category + ", choice_date=" + choice_date + ", choice_code="
				+ choice_code + ", choice_id=" + choice_id + "]";
	}
	
	

}