package com.mySpring.springEx.resume.vo;

import org.springframework.stereotype.Component;
import java.sql.Date;

@Component("resumeVO")
public class ResumeVO {
	private String resumeID;
	private String resumeUser;
	private String resumeForeign;
	private String resumeIDnumber;
	private String resumePic;
	private String resumeSpecial;
	private String resumeArmy;
	private String resumeSchool;
	private String resumeGrade;
	private String resumeContext1;
	private String resumeContext2;
	private String resumeContext3;
	private String resumeContext4;
	private String resumeContext5;
	private String resumeDate;
	
	public ResumeVO() {
		
	}
	
	public ResumeVO(String resumeID,String resumeUser, String resumeForeign,String resumeIDnumber,String resumePic,String resumeSpecial,String resumeArmy, String resumeSchool,String resumeGrade, String resumeContext1,String resumeContext2,String resumeContext3,String resumeContext4,String resumeContext5,String resumeDate) {
		this.resumeID = resumeID;
		this.resumeUser = resumeUser;
		this.resumeForeign = resumeForeign;
		this.resumeIDnumber = resumeIDnumber;
		this.resumePic = resumePic;
		this.resumeSpecial = resumeSpecial;
		this.resumeArmy = resumeArmy;
		this.resumeSchool = resumeSchool;
		this.resumeGrade = resumeGrade;
		this.resumeContext1 = resumeContext1;
		this.resumeContext2 = resumeContext2;
		this.resumeContext3 = resumeContext3;
		this.resumeContext4 = resumeContext4;
		this.resumeContext5 = resumeContext5;
		this.resumeDate = resumeDate;
		
	}

	public String getResumeDate() {
		return resumeDate;
	}

	public void setResumeDate(String resumeDate) {
		this.resumeDate = resumeDate;
	}

	public String getResumeID() {
		return resumeID;
	}

	public void setResumeID(String resumeID) {
		this.resumeID = resumeID;
	}

	public String getResumeUser() {
		return resumeUser;
	}

	public void setResumeUser(String resumeUser) {
		this.resumeUser = resumeUser;
	}

	public String getResumeForeign() {
		return resumeForeign;
	}

	public void setResumeForeign(String resumeForeign) {
		this.resumeForeign = resumeForeign;
	}

	public String getResumeIDnumber() {
		return resumeIDnumber;
	}

	public void setResumeIDnumber(String resumeIDnumber) {
		this.resumeIDnumber = resumeIDnumber;
	}

	public String getResumePic() {
		return resumePic;
	}

	public void setResumePic(String resumePic) {
		this.resumePic = resumePic;
	}

	public String getResumeSpecial() {
		return resumeSpecial;
	}

	public void setResumeSpecial(String resumeSpecial) {
		this.resumeSpecial = resumeSpecial;
	}

	public String getResumeArmy() {
		return resumeArmy;
	}

	public void setResumeArmy(String resumeArmy) {
		this.resumeArmy = resumeArmy;
	}

	public String getResumeSchool() {
		return resumeSchool;
	}

	public void setResumeSchool(String resumeSchool) {
		this.resumeSchool = resumeSchool;
	}

	public String getResumeGrade() {
		return resumeGrade;
	}

	public void setResumeGrade(String resumeGrade) {
		this.resumeGrade = resumeGrade;
	}

	public String getResumeContext1() {
		return resumeContext1;
	}

	public void setResumeContext1(String resumeContext1) {
		this.resumeContext1 = resumeContext1;
	}

	public String getResumeContext2() {
		return resumeContext2;
	}

	public void setResumeContext2(String resumeContext2) {
		this.resumeContext2 = resumeContext2;
	}

	public String getResumeContext3() {
		return resumeContext3;
	}

	public void setResumeContext3(String resumeContext3) {
		this.resumeContext3 = resumeContext3;
	}

	public String getResumeContext4() {
		return resumeContext4;
	}

	public void setResumeContext4(String resumeContext4) {
		this.resumeContext4 = resumeContext4;
	}

	public String getResumeContext5() {
		return resumeContext5;
	}

	public void setResumeContext5(String resumeContext5) {
		this.resumeContext5 = resumeContext5;
	}

	
}
