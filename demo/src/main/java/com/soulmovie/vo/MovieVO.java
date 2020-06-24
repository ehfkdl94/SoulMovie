package com.soulmovie.vo;

import java.util.Arrays;

public class MovieVO {
	
	private int movie_code = 0;
	private String movie_title = null;
	private String movie_date = null;
	private String movie_genre = null;
	private String movie_actor = null;
	private String movie_img = null;
	private int movie_cnt = 0;
	private Long movie_freq = 0L;
	private String rank = null;
	private int ROWN =0;
	
	public int getROWN() {
		return ROWN;
	}
	public void setROWN(int rOWN) {
		ROWN = rOWN;
	}
	public int getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(int movie_code) {
		this.movie_code = movie_code;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getMovie_date() {
		return movie_date;
	}
	public void setMovie_date(String movie_date) {
		this.movie_date = movie_date;
	}
	public String getMovie_genre() {
		return movie_genre;
	}
	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}
	public String getMovie_actor() {
		return movie_actor;
	}
	public void setMovie_actor(String movie_actor) {
		this.movie_actor = movie_actor;
	}
	public String getMovie_img() {
		return movie_img;
	}
	public void setMovie_img(String movie_img) {
		this.movie_img = movie_img;
	}
	public int getMovie_cnt() {
		return movie_cnt;
	}
	public void setMovie_cnt(int movie_cnt) {
		this.movie_cnt = movie_cnt;
	}
	public Long getMovie_freq() {
		return movie_freq;
	}
	public void setMovie_freq(Long movie_freq) {
		this.movie_freq = movie_freq;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	@Override
	public String toString() {
		return "MovieVO [movie_code=" + movie_code + ", movie_title=" + movie_title + ", movie_date=" + movie_date
				+ ", movie_genre=" + movie_genre + ", movie_actor=" + movie_actor + ", movie_img=" + movie_img
				+ ", movie_cnt=" + movie_cnt + ", movie_freq=" + movie_freq + ", rank=" + rank + "]";
	}
	
	
	
	
}
