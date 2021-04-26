package com.mySpring.springEx.suggestion.vo;

import org.springframework.stereotype.Component;

@Component("suggestionVO")
public class SuggestionVO {
    private String userID;
    private String partnerID;
    private String suggestDescription;
    private String acception;
    private String suggestionDate;
    private String partnerDeletion;
    private String userDeletion;

    public SuggestionVO() {

    }

    public SuggestionVO(String userID, String partnerID, String suggestDescription, String acception, String suggestionDate, String partnerDeletion, String userDeletion) {
        this.userID = userID;
        this.partnerID = partnerID;
        this.suggestDescription = suggestDescription;
        this.acception = acception;
        this.suggestionDate = suggestionDate;
        this.partnerDeletion = partnerDeletion;
        this.userDeletion = userDeletion;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPartnerID() {
        return partnerID;
    }

    public void setPartnerID(String partnerID) {
        this.partnerID = partnerID;
    }

    public String getSuggestDescription() {
        return suggestDescription;
    }

    public void setSuggestDescription(String suggestDescription) {
        this.suggestDescription = suggestDescription;
    }

    public String getAcception() {
        return acception;
    }

    public void setAcception(String acception) {
        this.acception = acception;
    }

    public String getSuggestionDate() {
        return suggestionDate;
    }

    public void setSuggestionDate(String suggestionDate) {
        this.suggestionDate = suggestionDate;
    }

    public String getPartnerDeletion() {
        return partnerDeletion;
    }

    public void setPartnerDeletion(String partnerDeletion) {
        this.partnerDeletion = partnerDeletion;
    }

    public String getUserDeletion() {
        return userDeletion;
    }

    public void setUserDeletion(String userDeletion) {
        this.userDeletion = userDeletion;
    }
}
