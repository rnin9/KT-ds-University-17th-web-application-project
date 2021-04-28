package com.mySpring.springEx.suggestion.vo;

import org.springframework.stereotype.Component;

@Component("suggestionVO")
public class SuggestionVO {
    private String partnerSuggestionUserID;
    private String partnerSuggestionPartnerID;
    private String partnerSuggestionDescription;
    private String partnerSuggestionAcception;
    
    
    public SuggestionVO() {}
    
	public SuggestionVO(String partnerSuggestionUserID, String partnerSuggestionPartnerID,
			String partnerSuggestionDescription, String partnerSuggestionAcception) {
		this.partnerSuggestionUserID = partnerSuggestionUserID;
		this.partnerSuggestionPartnerID = partnerSuggestionPartnerID;
		this.partnerSuggestionDescription = partnerSuggestionDescription;
		this.partnerSuggestionAcception = partnerSuggestionAcception;
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
