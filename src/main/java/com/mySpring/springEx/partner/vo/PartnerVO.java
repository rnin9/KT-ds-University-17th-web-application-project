package com.mySpring.springEx.partner.vo;

import java.util.Date;

import org.springframework.stereotype.Component;
import com.mySpring.springEx.application.vo.ApplicationVO;

@Component("partnerVO")
public class PartnerVO {
	private String partnerLicenseNum;           /*�삊�젰�궗 �궗�뾽�옄踰덊샇*/
	private String partnerState;              /*�삊�빟 �긽�깭*/
	private String partnerName;                   /*�삊�젰�궗 紐�*/
	private String partnerInformation;            /*媛꾨떒�븳 �쉶�궗 �젙蹂�*/
	private String partnerAddress;                /*�삊�젰�궗 二쇱냼*/
	private String partnerPhoneNumber;            /*�삊�젰�궗 �쟾�솕踰덊샇*/
	private String partnerEmail;                  /*�삊�젰�궗 �씠硫붿씪*/
	private String partnerCEO;                    /*�삊�젰�궗 ���몴紐�*/
	private int partnerHeadCount;                 /*�씤�썝 洹쒕え*/
	private String partnerApplyYN;              /*吏��썝 媛��뒫 �뿬遺�*/
	private String partnerApplyFinishDate;          /*紐⑥쭛 留덇컧 �궇吏�*/
	private String partnerURL;                    /*�쉶�궗 �솃�럹�씠吏�*/
	private String partnerRegisterDate;           /*�벑濡앸궇吏�*/
	private ApplicationVO applicationVO;
	private String partnerApplyUserID;
	private String partnerIndustryType;			 /*�뾽醫�*/
	private String partnerCharger;					/*담당자 이름*/
	private String partnerChargerDepartment;		/*담당자 부서*/
	private String partnerChargerID;				/*담당자 ID*/
	private String partnerChargerEmail;				/*담당자 Email*/


	public PartnerVO(){

	}

	public PartnerVO(String partnerLicenseNum, String partnerState, String partnerName, String partnerInformation,
			String partnerAddress, String partnerPhoneNumber, String partnerEmail, String partnerCEO,
			int partnerHeadCount, String partnerApplyYN, String partnerApplyFinishDate, String partnerURL,
			String partnerRegisterDate, ApplicationVO applicationVO, String partnerApplyUserID,
			String partnerIndustryType, String partnerCharger, String partnerChargerDepartment, String partnerChargerID,
			String partnerChargerEmail) {
		this.partnerLicenseNum = partnerLicenseNum;
		this.partnerState = partnerState;
		this.partnerName = partnerName;
		this.partnerInformation = partnerInformation;
		this.partnerAddress = partnerAddress;
		this.partnerPhoneNumber = partnerPhoneNumber;
		this.partnerEmail = partnerEmail;
		this.partnerCEO = partnerCEO;
		this.partnerHeadCount = partnerHeadCount;
		this.partnerApplyYN = partnerApplyYN;
		this.partnerApplyFinishDate = partnerApplyFinishDate;
		this.partnerURL = partnerURL;
		this.partnerRegisterDate = partnerRegisterDate;
		this.applicationVO = applicationVO;
		this.partnerApplyUserID = partnerApplyUserID;
		this.partnerIndustryType = partnerIndustryType;
		this.partnerCharger = partnerCharger;
		this.partnerChargerDepartment = partnerChargerDepartment;
		this.partnerChargerID = partnerChargerID;
		this.partnerChargerEmail = partnerChargerEmail;
	}
	
	public String getPartnerIndustryType() {
		return partnerIndustryType;
	}

	public void setPartnerIndustryType(String partnerIndustryType) {
		this.partnerIndustryType = partnerIndustryType;
	}

	public String getPartnerCharger() {
		return partnerCharger;
	}

	public void setPartnerCharger(String partnerCharger) {
		this.partnerCharger = partnerCharger;
	}

	public String getPartnerChargerDepartment() {
		return partnerChargerDepartment;
	}

	public void setPartnerChargerDepartment(String partnerChargerDepartment) {
		this.partnerChargerDepartment = partnerChargerDepartment;
	}

	public String getPartnerChargerID() {
		return partnerChargerID;
	}

	public void setPartnerChargerID(String partnerChargerID) {
		this.partnerChargerID = partnerChargerID;
	}

	public String getPartnerChargerEmail() {
		return partnerChargerEmail;
	}

	public void setPartnerChargerEmail(String partnerChargerEmail) {
		this.partnerChargerEmail = partnerChargerEmail;
	}

	public String getPartnerApplyFinishDate() {
		return partnerApplyFinishDate;
	}

	public void setPartnerApplyFinishDate(String partnerApplyFinishDate) {
		this.partnerApplyFinishDate = partnerApplyFinishDate;
	}

	public String getPartnerLicenseNum() {
		return partnerLicenseNum;
	}

	public void setPartnerLicenseNum(String partnerLicenseNum) {
		this.partnerLicenseNum = partnerLicenseNum;
	}

	public String getPartnerState() {
		return partnerState;
	}

	public void setPartnerState(String partnerState) {
		this.partnerState = partnerState;
	}

	public String getPartnerName() {
		return partnerName;
	}

	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}

	public String getPartnerInformation() {
		return partnerInformation;
	}

	public void setPartnerInformation(String partnerInformation) {
		this.partnerInformation = partnerInformation;
	}

	public String getPartnerAddress() {
		return partnerAddress;
	}

	public void setPartnerAddress(String partnerAddress) {
		this.partnerAddress = partnerAddress;
	}

	public String getPartnerPhoneNumber() {
		return partnerPhoneNumber;
	}

	public void setPartnerPhoneNumber(String partnerPhoneNumber) {
		this.partnerPhoneNumber = partnerPhoneNumber;
	}

	public String getPartnerEmail() {
		return partnerEmail;
	}

	public void setPartnerEmail(String partnerEmail) {
		this.partnerEmail = partnerEmail;
	}

	public String getPartnerCEO() {
		return partnerCEO;
	}

	public void setPartnerCEO(String partnerCEO) {
		this.partnerCEO = partnerCEO;
	}

	public int getPartnerHeadCount() {
		return partnerHeadCount;
	}

	public void setPartnerHeadCount(int partnerHeadCount) {
		this.partnerHeadCount = partnerHeadCount;
	}
	public String getPartnerApplyYN() {
		return partnerApplyYN;
	}

	public void setPartnerApplyYN(String partnerApplyYN) {
		this.partnerApplyYN = partnerApplyYN;
	}

	public String getPartnerURL() {
		return partnerURL;
	}

	public void setPartnerURL(String partnerURL) {
		this.partnerURL = partnerURL;
	}

	public String getPartnerRegisterDate() {
		return partnerRegisterDate;
	}

	public void setPartnerRegisterDate(String partnerRegisterDate) {
		this.partnerRegisterDate = partnerRegisterDate;
	}

	public String getPartnerApplyUserID() {
		return partnerApplyUserID;
	}

	public void setPartnerApplyUserID(String partnerApplyUserID) {
		this.partnerApplyUserID = partnerApplyUserID;
	}

	public ApplicationVO getApplicationVO() {
		return applicationVO;
	}

	public void setApplicationVO(ApplicationVO applicationVO) {
		this.applicationVO = applicationVO;
	}

}
