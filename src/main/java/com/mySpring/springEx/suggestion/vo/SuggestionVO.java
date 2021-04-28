package com.mySpring.springEx.suggestion.vo;

import org.springframework.stereotype.Component;

@Component("suggestionVO")
public class SuggestionVO {
	private String partnerSuggestionUserID;
	private String partnerSuggestionPartnerID;
	private String partnerSuggestionDescription;
	private String partnerSuggestionAcception;
	private String partnerSuggestionTitle;
	private String partnerSuggestionDate;
	private String partnerSuggestionPartnerD; // delete from Partner
	private String partnerSuggestionUserD; // delete from user

	public SuggestionVO() {
	}

	public SuggestionVO(String partnerSuggestionUserID, String partnerSuggestionPartnerID,
			String partnerSuggestionDescription, String partnerSuggestionAcception, String partnerSuggestionDate,
			String partnerSuggestionPartnerD, String partnerSuggestionUserD) {
		super();
		this.partnerSuggestionUserID = partnerSuggestionUserID;
		this.partnerSuggestionPartnerID = partnerSuggestionPartnerID;
		this.partnerSuggestionDescription = partnerSuggestionDescription;
		this.partnerSuggestionAcception = partnerSuggestionAcception;
		this.partnerSuggestionDate = partnerSuggestionDate;
		this.partnerSuggestionPartnerD = partnerSuggestionPartnerD;
		this.partnerSuggestionUserD = partnerSuggestionUserD;
	}

	public String getPartnerSuggestionTitle() {
		return partnerSuggestionTitle;
	}

	public void setPartnerSuggestionTitle(String partnerSuggestionTitle) {
		this.partnerSuggestionTitle = partnerSuggestionTitle;
	}
	
	public String getPartnerSuggestionDate() {
		return partnerSuggestionDate;
	}

	public void setPartnerSuggestionDate(String partnerSuggestionDate) {
		this.partnerSuggestionDate = partnerSuggestionDate;
	}

	public String getPartnerSuggestionPartnerD() {
		return partnerSuggestionPartnerD;
	}

	public void setPartnerSuggestionPartnerD(String partnerSuggestionPartnerD) {
		this.partnerSuggestionPartnerD = partnerSuggestionPartnerD;
	}

	public String getPartnerSuggestionUserD() {
		return partnerSuggestionUserD;
	}

	public void setPartnerSuggestionUserD(String partnerSuggestionUserD) {
		this.partnerSuggestionUserD = partnerSuggestionUserD;
	}

	public String getPartnerSuggestionUserID() {
		return partnerSuggestionUserID;
	}

	public void setPartnerSuggestionUserID(String partnerSuggestionUserID) {
		this.partnerSuggestionUserID = partnerSuggestionUserID;
	}

	public String getPartnerSuggestionPartnerID() {
		return partnerSuggestionPartnerID;
	}

	public void setPartnerSuggestionPartnerID(String partnerSuggestionPartnerID) {
		this.partnerSuggestionPartnerID = partnerSuggestionPartnerID;
	}

	public String getPartnerSuggestionDescription() {
		return partnerSuggestionDescription;
	}

	public void setPartnerSuggestionDescription(String partnerSuggestionDescription) {
		this.partnerSuggestionDescription = partnerSuggestionDescription;
	}

	public String getPartnerSuggestionAcception() {
		return partnerSuggestionAcception;
	}

	public void setPartnerSuggestionAcception(String partnerSuggestionAcception) {
		this.partnerSuggestionAcception = partnerSuggestionAcception;
	}

}