//package com.RootFinder.dto;
//import java.text.ParseException;
//import java.util.Date;
//
//import util.DateParse;
//
//public class CoseDTO {
//	private String code;
//	private String id;
//	private String addr;
//	private String price;
//	private String starttime;
//	private String placeName;
//	private String endtime;
//	private String day;
//	private Date cose_date;
//	private String img;
//	private String content;
//	
//	
//	public String getPlaceName() {
//		return placeName;
//	}
//	public void setPlaceName(String placeName) {
//		this.placeName = placeName;
//	}
//	public String getCode() {
//		return code;
//	}
//	public void setCode(String code) {
//		this.code = code;
//	}
//	public String getId() {
//		return id;
//	}
//	public void setId(String id) {
//		this.id = id;
//	}
//	public String getAddr() {
//		return addr;
//	}
//	public void setAddr(String addr) {
//		this.addr = addr;
//	}
//	public String getPrice() {
//		return price;
//	}
//	public void setPrice(String price) {
//		this.price = price;
//	}
//	public String getStarttime() {
//		return starttime;
//	}
//	public void setStarttime(String starttime) {
//		this.starttime = starttime;
//	}
//	public String getEndtime() {
//		return endtime;
//	}
//	public void setEndtime(String endtime) {
//		this.endtime = endtime;
//	}
//	public String getDay() {
//		return day;
//	}
//	public void setDay(String day) {
//		this.day = day;
//	}
//	public Date getCose_date() {
//		return cose_date;
//	}
//	public void setCose_date(Date cose_date) {
//		this.cose_date = cose_date;
//	}
//	public String getImg() {
//		return img;
//	}
//	public void setImg(String img) {
//		this.img = img;
//	}
//	public String getContent() {
//		return content;
//	}
//	public void setContent(String content) {
//		this.content = content;
//	}
//	@Override
//	public String toString() {
//		return "CoseDTO [code=" + code + ", id=" + id + ", addr=" + addr + ", price=" + price + ", starttime="
//				+ starttime + ", placeName=" + placeName + ", endtime=" + endtime + ", day=" + day + ", cose_date="
//				+ cose_date + ", img=" + img + ", content=" + content + "]";
//	}
//	
//	
//	
//	
//	
//}

//민준추가
package com.RootFinder.dto;

import java.text.ParseException;
import java.util.Date;

import util.DateParse;

public class CoseDTO {
	Date cose_date;
	String day,img,code,id,placeName,addr,price,starttime,endtime,content;
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String place) {
		this.placeName = place;
	}
	public Date getCose_date() {
		return cose_date;
	}
	public void setCose_date(Date cose_date) {
		this.cose_date = cose_date;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
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
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "CoseDTO [cose_date=" + cose_date + ", day=" + day + ", img=" + img + ", code=" + code + ", id=" + id
				+ ", placeName=" + placeName + ", addr=" + addr + ", price=" + price + ", starttime=" + starttime
				+ ", endtime=" + endtime + ", content=" + content + "]";
	}
	
	
	
	
	
}







