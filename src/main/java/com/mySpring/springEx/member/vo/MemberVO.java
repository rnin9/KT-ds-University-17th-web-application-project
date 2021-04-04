package com.mySpring.springEx.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("memberVO")
//멤버 VO birth,phone,adderess,joinDate,approval_status, approval_key(삭제 예정) 추가
public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String birth;
	private String phone;
	private String address;
	private String address_detail;

	
	private Date joinDate;
	private String approval_status;
	private String approval_key;

	public MemberVO() {

	}

	public MemberVO(String id, String pwd, String name, String email) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getApproval_status() {
		return approval_status;
	}

	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}

	public String getApproval_key() {
		return approval_key;
	}

	public void setApproval_key(String approval_key) {
		this.approval_key = approval_key;
	}

}
