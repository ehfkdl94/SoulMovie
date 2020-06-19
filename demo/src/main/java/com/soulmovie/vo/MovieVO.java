package com.soulmovie.vo;

public class MovieVO {
	
	private int movie_code = 0;
	private String movie_title = null;
	private String movie_date = null;
	private String movie_nation = null;
	private String movie_genre = null;
	private String movie_director = null;
	private String movie_actor = null;
	private String movie_img = null;
	private String movie_cnt = null;
	private String movie_freq = null;
	
	//Getter Setter
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
	public String getMovie_nation() {
		return movie_nation;
	}
	public void setMovie_nation(String movie_nation) {
		this.movie_nation = movie_nation;
	}
	public String getMovie_genre() {
		return movie_genre;
	}
	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}
	public String getMovie_director() {
		return movie_director;
	}
	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
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
	public String getMovie_cnt() {
		return movie_cnt;
	}
	public void setMovie_cnt(String movie_cnt) {
		this.movie_cnt = movie_cnt;
	}
	public String getMovie_freq() {
		return movie_freq;
	}
	public void setMovie_freq(String movie_freq) {
		this.movie_freq = movie_freq;
	}
	
	
	//to String
	
	@Override
	public String toString() {
		return "MovieVO [movie_code=" + movie_code + ", movie_title=" + movie_title + ", movie_date=" + movie_date
				+ ", movie_nation=" + movie_nation + ", movie_genre=" + movie_genre + ", movie_director="
				+ movie_director + ", movie_actor=" + movie_actor + ", movie_img=" + movie_img + ", movie_cnt="
				+ movie_cnt + ", movie_freq=" + movie_freq + "]";
	}
	
	
}
