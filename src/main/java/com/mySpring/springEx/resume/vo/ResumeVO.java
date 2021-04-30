package com.mySpring.springEx.resume.vo;

import org.springframework.stereotype.Component;
import java.sql.Date;

@Component("resumeVO")
public class ResumeVO {
	//Resume 
	private String resumeID;
	private String resumeUser;
	private String resumeForeign;
	private String resumeIDnumber;
	private String resumePic;
	private String resumeSchool;
	private String resumeGrade;
	private String resumeContext1;
	private String resumeContext2;
	private String resumeContext3;
	private String resumeContext4;
	private String resumeContext5;
	private String resumeDate;
	private String resumeCheck;
	private String resumeLastEdu;
	
	// Resume_Career 
	private String careerUser;
	private String careerCenter;
	private String careerStartdate;
	private String careerEnddate;
	private String careerContent;
	private String careerHour;
	private String careerType;
	private String careerPosition;
	private String careerOther;
	private String careerCheck;
	private int careerSEQ;
	private String careerResume;
	// Resume_Certificate
	private String certificateUser;
	private String certificateName;
	private String certificateEnforcement;
	private String certificateDate;
	private int certificateSEQ;
	private String certificateResume;
	// Resume_Foreign
	private String foreignUser;
	private String foreignCriteria;
	private String foreignName;
	private String foreignScore;
	private String foreignEnforcement;
	private String foreignDate;
	private String foreignOther;
	private int foreignSEQ;
	private String foreignResume;
	// Resume_Project 
	private String projectUser;
	private String projectEnforcement;
	private String projectName;
	private String projectDev;
	private String projectContent;
	private String projectRole;
	private String projectURL;
	private int projectSEQ;
	private String projectResume;
	

	public ResumeVO() {}
	
	public ResumeVO(String resumeID, String resumeUser, String resumeForeign, String resumeIDnumber, String resumePic, String resumeSchool, String resumeGrade, 
			String resumeContext1, String resumeContext2, String resumeContext3, String resumeContext4, String resumeContext5, String resumeDate, String resumeCheck, String resumeLastEdu) {
		
			this.resumeID = resumeID;
			this.resumeUser = resumeUser;
			this.resumeForeign = resumeForeign;
			this.resumeIDnumber = resumeIDnumber;
			this.resumePic = resumePic;
			this.resumeSchool = resumeSchool;
			this.resumeGrade = resumeGrade;
			this.resumeContext1 = resumeContext1;
			this.resumeContext2 = resumeContext2;
			this.resumeContext3 = resumeContext3;
			this.resumeContext4 = resumeContext4;
			this.resumeContext5 = resumeContext5;
			this.resumeDate = resumeDate;
			this.resumeCheck = resumeCheck;
			this.resumeLastEdu = resumeLastEdu;
			
	}
	
	public ResumeVO(String careerID, String careerUser, String careerCenter, String careerStartdate, String careerEnddate, String careerContent, int careerSEQ, 
			String careerHour, String careerType, String careerPosition, String careerOther, String careerCheck, String careerResume,
			String certificateUser, String certificateName, String certificateEnforcement, String certificateDate, int certificateSEQ, String certificateResume,
			String foreignUser, String foreignCriteria, String foreignName, String foreignScore, String foreignEnforcement, String foreignDate, String foreignOther, int foreignSEQ, String foreignResume,
			String projectUser, String projectEnforcement, String projectName, String projectDev, String projectContent, String projectRole, String projectURL, int projectSEQ, String projectResume) {

			this.careerUser = careerUser;
			this.careerCenter = careerCenter;
			this.careerStartdate = careerStartdate;
			this.careerEnddate = careerEnddate;
			this.careerContent = careerContent;
			this.careerHour = careerHour;
			this.careerType = careerType;
			this.careerPosition = careerPosition;
			this.careerOther = careerOther;
			this.careerCheck = careerCheck;
			this.careerSEQ = careerSEQ;
			this.careerResume = careerResume;
			
			this.certificateUser = certificateUser;
			this.certificateName = certificateName;
			this.certificateEnforcement = certificateEnforcement;
			this.certificateDate = certificateDate;
			this.certificateSEQ = certificateSEQ;
			this.certificateResume = certificateResume;
			
			this.foreignUser = foreignUser;
			this.foreignCriteria = foreignCriteria;
			this.foreignName = foreignName;
			this.foreignScore = foreignScore;
			this.foreignEnforcement = foreignEnforcement;
			this.foreignDate = foreignDate;
			this.foreignOther = foreignOther;
			this.foreignSEQ = foreignSEQ;
			this.foreignResume = foreignResume;
			
			this.projectUser = projectUser;
			this.projectEnforcement = projectEnforcement;
			this.projectName = projectName;
			this.projectDev = projectDev;
			this.projectContent = projectContent;
			this.projectRole = projectRole;
			this.projectURL = projectURL;
			this.projectSEQ = projectSEQ;
			this.projectResume = projectResume;
	}
	

	
	public String getResumeLastEdu() {
		return resumeLastEdu;
	}

	public void setResumeLastEdu(String resumeLastEdu) {
		this.resumeLastEdu = resumeLastEdu;
	}

	public String getCareerResume() {
		return careerResume;
	}

	public void setCareerResume(String careerResume) {
		this.careerResume = careerResume;
	}

	public String getCertificateResume() {
		return certificateResume;
	}

	public void setCertificateResume(String certificateResume) {
		this.certificateResume = certificateResume;
	}

	public String getForeignResume() {
		return foreignResume;
	}

	public void setForeignResume(String foreignResume) {
		this.foreignResume = foreignResume;
	}

	public String getProjectResume() {
		return projectResume;
	}

	public void setProjectResume(String projectResume) {
		this.projectResume = projectResume;
	}

	public int getCareerSEQ() {
		return careerSEQ;
	}

	public void setCareerSEQ(int careerSEQ) {
		this.careerSEQ = careerSEQ;
	}

	public int getProjectSEQ() {
		return projectSEQ;
	}

	public void setProjectSEQ(int projectSEQ) {
		this.projectSEQ = projectSEQ;
	}

	public int getForeignSEQ() {
		return foreignSEQ;
	}

	public void setForeignSEQ(int foreignSEQ) {
		this.foreignSEQ = foreignSEQ;
	}

	public int getCertificateSEQ() {
		return certificateSEQ;
	}

	public void setCertificateSEQ(int certificateSEQ) {
		this.certificateSEQ = certificateSEQ;
	}

	public String getResumeCheck() {
		return resumeCheck;
	}

	public void setResumeCheck(String resumeCheck) {
		this.resumeCheck = resumeCheck;
	}

	public String getResumeDate() {
		return resumeDate;
	}

	public void setResumeDate(String resumeDate) {
		this.resumeDate = resumeDate;
	}

	public String getCareerUser() {
		return careerUser;
	}

	public void setCareerUser(String careerUser) {
		this.careerUser = careerUser;
	}

	public String getCareerCenter() {
		return careerCenter;
	}

	public void setCareerCenter(String careerCenter) {
		this.careerCenter = careerCenter;
	}

	public String getCareerStartdate() {
		return careerStartdate;
	}

	public void setCareerStartdate(String careerStartdate) {
		this.careerStartdate = careerStartdate;
	}

	public String getCareerEnddate() {
		return careerEnddate;
	}

	public void setCareerEnddate(String careerEnddate) {
		this.careerEnddate = careerEnddate;
	}

	public String getCareerContent() {
		return careerContent;
	}

	public void setCareerContent(String careerContent) {
		this.careerContent = careerContent;
	}

	public String getCareerHour() {
		return careerHour;
	}

	public void setCareerHour(String careerHour) {
		this.careerHour = careerHour;
	}

	public String getCareerType() {
		return careerType;
	}

	public void setCareerType(String careerType) {
		this.careerType = careerType;
	}

	public String getCareerPosition() {
		return careerPosition;
	}

	public void setCareerPosition(String careerPosition) {
		this.careerPosition = careerPosition;
	}

	public String getCareerOther() {
		return careerOther;
	}

	public void setCareerOther(String careerOther) {
		this.careerOther = careerOther;
	}

	public String getCareerCheck() {
		return careerCheck;
	}

	public void setCareerCheck(String careerCheck) {
		this.careerCheck = careerCheck;
	}

	public String getCertificateUser() {
		return certificateUser;
	}

	public void setCertificateUser(String certificateUser) {
		this.certificateUser = certificateUser;
	}

	public String getCertificateName() {
		return certificateName;
	}

	public void setCertificateName(String certificateName) {
		this.certificateName = certificateName;
	}

	public String getCertificateEnforcement() {
		return certificateEnforcement;
	}

	public void setCertificateEnforcement(String certificateEnforcement) {
		this.certificateEnforcement = certificateEnforcement;
	}

	public String getCertificateDate() {
		return certificateDate;
	}

	public void setCertificateDate(String certificateDate) {
		this.certificateDate = certificateDate;
	}

	public String getForeignUser() {
		return foreignUser;
	}

	public void setForeignUser(String foreignUser) {
		this.foreignUser = foreignUser;
	}

	public String getForeignCriteria() {
		return foreignCriteria;
	}

	public void setForeignCriteria(String foreignCriteria) {
		this.foreignCriteria = foreignCriteria;
	}

	public String getForeignName() {
		return foreignName;
	}

	public void setForeignName(String foreignName) {
		this.foreignName = foreignName;
	}

	public String getForeignScore() {
		return foreignScore;
	}

	public void setForeignScore(String foreignScore) {
		this.foreignScore = foreignScore;
	}

	public String getForeignEnforcement() {
		return foreignEnforcement;
	}

	public void setForeignEnforcement(String foreignEnforcement) {
		this.foreignEnforcement = foreignEnforcement;
	}

	public String getForeignDate() {
		return foreignDate;
	}

	public void setForeignDate(String foreignDate) {
		this.foreignDate = foreignDate;
	}

	public String getForeignOther() {
		return foreignOther;
	}

	public void setForeignOther(String foreignOther) {
		this.foreignOther = foreignOther;
	}

	public String getProjectUser() {
		return projectUser;
	}

	public void setProjectUser(String projectUser) {
		this.projectUser = projectUser;
	}

	public String getProjectEnforcement() {
		return projectEnforcement;
	}

	public void setProjectEnforcement(String projectEnforcement) {
		this.projectEnforcement = projectEnforcement;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectDev() {
		return projectDev;
	}

	public void setProjectDev(String projectDev) {
		this.projectDev = projectDev;
	}

	public String getProjectContent() {
		return projectContent;
	}

	public void setProjectContent(String projectContent) {
		this.projectContent = projectContent;
	}

	public String getProjectRole() {
		return projectRole;
	}

	public void setProjectRole(String projectRole) {
		this.projectRole = projectRole;
	}

	public String getProjectURL() {
		return projectURL;
	}

	public void setProjectURL(String projectURL) {
		this.projectURL = projectURL;
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
