package com.RootFinder.dto;

public class CoseListDTO {
	private String code;
	private String main_img;
	private String main_addr;
	private String title;
	private int view_cnt;
	
	
	
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public String getMain_addr() {
		return main_addr;
	}
	public void setMain_addr(String main_addr) {
		this.main_addr = main_addr;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "CoseListDTO [code=" + code + ", main_img=" + main_img + ", main_addr=" + main_addr + ", title=" + title
				+ ", view_cnt=" + view_cnt + "]";
	}
	
}
