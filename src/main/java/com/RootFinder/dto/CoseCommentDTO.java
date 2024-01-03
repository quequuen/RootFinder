package com.RootFinder.dto;

public class CoseCommentDTO {
	private String code, id, comment_text, comment_write_time;
	private int prt_num, cdr_num;
	
	

	public int getPrt_num() {
		return prt_num;
	}

	public void setPrt_num(int prt_num) {
		this.prt_num = prt_num;
	}

	public int getCdr_num() {
		return cdr_num;
	}

	public void setCdr_num(int cdr_num) {
		this.cdr_num = cdr_num;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getComment_text() {
		return comment_text;
	}

	public void setComment_text(String comment_text) {
		this.comment_text = comment_text;
	}

	public String getComment_write_time() {
		return comment_write_time;
	}

	public void setComment_write_time(String comment_write_time) {
		this.comment_write_time = comment_write_time;
	}

	@Override
	public String toString() {
		return "CoseCommentDTO [code=" + code + ", id=" + id + ", comment_text=" + comment_text
				+ ", comment_write_time=" + comment_write_time + ", prt_num=" + prt_num + ", cdr_num=" + cdr_num + "]";
	}
	
	
	
	
}
