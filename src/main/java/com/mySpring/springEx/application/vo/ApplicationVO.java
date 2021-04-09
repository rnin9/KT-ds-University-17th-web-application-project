package com.mySpring.springEx.application.vo;

import org.springframework.stereotype.Component;

@Component("applicationVO")
public class ApplicationVO {
    private String partnerApplyUserID;
    private String partnerApplyPartnerID;
    private String partnerApplyResumeID;
//    private String partnerApplyDate;
//    private String partnerApplyState;

    public ApplicationVO() {

    }

    public ApplicationVO(String partnerApplyUserID, String partnerApplyPartnerID, String partnerApplyResumeID, String partnerApplyDate, String partnerApplyState) {
        this.partnerApplyUserID = partnerApplyUserID;
        this.partnerApplyPartnerID = partnerApplyPartnerID;
        this.partnerApplyResumeID = partnerApplyResumeID;
//        this.partnerApplyDate = partnerApplyDate;
//        this.partnerApplyState = partnerApplyState;
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

//    public String getPartnerApplyDate() {
//        return partnerApplyDate;
//    }
//
//    public void setPartnerApplyDate(String partnerApplyDate) {
//        this.partnerApplyDate = partnerApplyDate;
//    }
//
//    public String getPartnerApplyState() {
//        return partnerApplyState;
//    }
//
//    public void setPartnerApplyState(String partnerApplyState) {
//        this.partnerApplyState = partnerApplyState;
//    }
}
