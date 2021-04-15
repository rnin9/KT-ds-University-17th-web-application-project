package com.mySpring.springEx.partner.vo;


import org.springframework.stereotype.Component;

@Component("partnerVO")
public class PartnerVO {
	private String partnerLicenseNum;           /*협력사 사업자번호*/
	private String partnerState;              /*협약 상태*/
	private String partnerName;                   /*협력사 명*/
	private String partnerInformation;            /*간단한 회사 정보*/
	private String partnerAddress;                /*협력사 주소*/
	private String partnerPhoneNumber;            /*협력사 전화번호*/
	private String partnerEmail;                  /*협력사 이메일*/
	private String partnerCEO;                    /*협력사 대표명*/
	private int partnerHeadCount;                 /*인원 규모*/
	private String partnerApplyYN;              /*지원 가능 여부*/
	private String partnerApplyFinishDate;          /*모집 마감 날짜*/
	private String partnerURL;                    /*회사 홈페이지*/
	private String partnerRegisterDate;           /*등록날짜*/


	public PartnerVO(){

	}

	public PartnerVO(String partnerLicenseNum, String partnerState, String partnerName, String partnerInformation,String partnerAddress,String partnerPhoneNumber,String partnerEmail,String partnerCEO,int partnerHeadCount,String partnerApplyYN,String partnerApplyFinishDate,String partnerURL, String partnerRegisterDate){
		this.partnerLicenseNum = partnerLicenseNum;
		this.partnerName = partnerName;
		this.partnerInformation = partnerInformation;
		this.partnerAddress = partnerAddress;
		this.partnerPhoneNumber   = partnerPhoneNumber;
		this.partnerEmail = partnerEmail;
		this.partnerCEO = partnerCEO;
		this.partnerHeadCount = partnerHeadCount;
		this.partnerApplyYN = partnerApplyYN;
		this.partnerURL = partnerURL;
		this.partnerApplyFinishDate = partnerApplyFinishDate;
		this.partnerRegisterDate = partnerRegisterDate;


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


}