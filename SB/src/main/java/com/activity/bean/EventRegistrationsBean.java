package com.activity.bean;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

import java.time.LocalDateTime;

@Entity
@Table(name = "eventregistrations")
public class EventRegistrationsBean {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer registrationID;
    
    @Column(name = "eventno")
    private Integer eventNo;
    @Column(name = "userno")
    private Integer userNo;
    @Column(name = "participantname")
    private String participantName;
    @Column(name = "contactinfo")
    private String contactInfo;
    @Column(name = "registrationtime")
    private LocalDateTime registrationTime;

    @ManyToOne
    @JoinColumn(name = "eventno", insertable = false, updatable = false)
    private EventBean event;

    // Getter and Setter methods
    public Integer getRegistrationID() {
        return registrationID;
    }

    public void setRegistrationID(Integer registrationID) {
        this.registrationID = registrationID;
    }

    public Integer getEventNo() {
        return eventNo;
    }

    public void setEventNo(Integer eventNo) {
        this.eventNo = eventNo;
    }

    public Integer getUserNo() {
        return userNo;
    }

    public void setUserNo(Integer userNo) {
        this.userNo = userNo;
    }

    public String getParticipantName() {
        return participantName;
    }

    public void setParticipantName(String participantName) {
        this.participantName = participantName;
    }

    public String getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(String contactInfo) {
        this.contactInfo = contactInfo;
    }

    public LocalDateTime getRegistrationTime() {
        return registrationTime;
    }

    public void setRegistrationTime(LocalDateTime registrationTime) {
        this.registrationTime = registrationTime;
    }

    public EventBean getEvent() {
        return event;
    }

    public void setEvent(EventBean event) {
        this.event = event;
    }
}
