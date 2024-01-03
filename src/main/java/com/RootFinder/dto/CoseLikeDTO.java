package com.RootFinder.dto;

public class CoseLikeDTO {
	String code, id, likeCheck;

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

	public String getLikeCheck() {
		return likeCheck;
	}

	public void setLikeCheck(String likeCheck) {
		this.likeCheck = likeCheck;
	}

	@Override
	public String toString() {
		return "CoseLikeDTO [code=" + code + ", id=" + id + ", likeCheck=" + likeCheck + "]";
	}
	
}
