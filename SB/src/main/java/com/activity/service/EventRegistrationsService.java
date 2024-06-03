package com.activity.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.activity.bean.EventRegistrationsBean;
import com.activity.bean.EventRegistrationsRepository;

@Service
@Transactional
public class EventRegistrationsService {

    @Autowired
    private EventRegistrationsRepository erRepos;

    public EventRegistrationsBean insert(EventRegistrationsBean registrations) {
        return erRepos.save(registrations);
    }

    public EventRegistrationsBean update(EventRegistrationsBean registrations) {
        return erRepos.save(registrations);
    }

    public void deleteEventByEventNo(Integer registrationID) {
        erRepos.deleteById(registrationID);
    }

    public Optional<EventRegistrationsBean> findByRegistration(Integer registrationID) {
        return erRepos.findById(registrationID);
    }

    public List<EventRegistrationsBean> findAllRegistrations() {
        return erRepos.findAll();
    }

    public List<EventRegistrationsBean> findByEventNoAndUserNo(Integer eventNo, Integer userNo) {
        return erRepos.findByEventNoAndUserNo(eventNo, userNo);
    }
}
