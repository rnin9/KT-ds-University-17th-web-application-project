package com.mySpring.springEx.notice.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("noticeVO")
public class NoticeVO {
	private int notice_no;
	private String notice_category;
	private String notice_title;
	private String notice_contents;
	private String notice_adminID;
	private Date notice_date;
	private int notice_hit;
	private int nt_file_size;
	
	

	public NoticeVO() {
		
	}

	public NoticeVO(int notice_no, String notice_category, String notice_title, String notice_contents, String notice_adminID,
			Date notice_date, int notice_hit, int nt_file_size) {
		this.notice_no = notice_no;
		this.notice_category = notice_category;
		this.notice_title = notice_title;
		this.notice_contents = notice_contents;
		this.notice_adminID = notice_adminID;
		this.notice_date = notice_date;
		this.notice_hit = notice_hit;
		this.nt_file_size = nt_file_size;
		
	}

	public int getNt_file_size() {
		return nt_file_size;
	}

	public void setNt_file_size(int nt_file_size) {
		this.nt_file_size = nt_file_size;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_category() {
		return notice_category;
	}

	public void setNotice_category(String notice_category) {
		this.notice_category = notice_category;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_contents() {
		return notice_contents;
	}

	public void setNotice_contents(String notice_contents) {
		this.notice_contents = notice_contents;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	public int getNotice_hit() {
		return notice_hit;
	}

	public void setNotice_hit(int notice_hit) {
		this.notice_hit = notice_hit;
	}


	public String getNotice_adminID() {
		return notice_adminID;
	}

	public void setNotice_adminID(String notice_adminID) {
		this.notice_adminID = notice_adminID;
	}
}
