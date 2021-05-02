package com.mySpring.springEx.application.vo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mySpring.springEx.member.vo.MemberVO;
import com.mySpring.springEx.resume.vo.ResumeVO;

@Component("applicationVO")
public class ApplicationVO {
    private String partnerApplyUserID;
    private String partnerApplyPartnerID;
    private String partnerApplyResumeID;
    private String partnerApplyDate;
    private String partnerApplyState;
    private String applicantNum;

    @Autowired
	MemberVO memberVO;
    
    @Autowired
  	ResumeVO resumeVO;

	public ResumeVO getResumeVO() {
		return resumeVO;
	}

	public void setResumeVO(ResumeVO resumeVO) {
		this.resumeVO = resumeVO;
	}

	public ApplicationVO() {

    }

    public ApplicationVO(String partnerApplyUserID, String partnerApplyPartnerID, String partnerApplyResumeID, String partnerApplyDate, String partnerApplyState, String applicantNum) {
        this.partnerApplyUserID = partnerApplyUserID;
        this.partnerApplyPartnerID = partnerApplyPartnerID;
        this.partnerApplyResumeID = partnerApplyResumeID;
        this.partnerApplyDate = partnerApplyDate;
        this.partnerApplyState = partnerApplyState;
        this.applicantNum = applicantNum;
    }

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
    public String getPartnerApplyUserID() {
        return partnerApplyUserID;
    }

    public void setPartnerApplyUserID(String partnerApplyUserID) {
        this.partnerApplyUserID = partnerApplyUserID;
    }

    public String getPartnerApplyPartnerID() {
        return partnerApplyPartnerID;
    }

    public void setPartnerApplyPartnerID(String partnerApplyPartnerID) {
        this.partnerApplyPartnerID = partnerApplyPartnerID;
    }

    public String getPartnerApplyResumeID() {
        return partnerApplyResumeID;
    }

    public void setPartnerApplyResumeID(String partnerApplyResumeID) {
        this.partnerApplyResumeID = partnerApplyResumeID;
    }

    public String getPartnerApplyDate() {
        return partnerApplyDate;
    }

    public void setPartnerApplyDate(String partnerApplyDate) {
        this.partnerApplyDate = partnerApplyDate;
    }

    public String getPartnerApplyState() {
        return partnerApplyState;
    }

    public void setPartnerApplyState(String partnerApplyState) {
        this.partnerApplyState = partnerApplyState;
    }

    public String getApplicantNum() { return applicantNum; }

    public void setApplicantNum(String applicantNum) { this.applicantNum = applicantNum; }
}
