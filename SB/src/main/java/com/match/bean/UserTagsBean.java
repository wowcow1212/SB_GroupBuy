package com.match.bean;

import com.user.bean.UserBean;

import jakarta.persistence.CascadeType;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;


//2. 定義實體類別
@Entity
class UserTagsBean {
    @EmbeddedId
    private UserTagsBeanKey id;

    @ManyToOne(fetch = FetchType.LAZY)   //記得要加
    @MapsId("fkUserNo")
    @JoinColumn(name = "FKUserNo")
    private UserBean userBean;

    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("fkTagNo")
    @JoinColumn(name = "FKTagNo")
    private TagsBean tagsBean;

    private int rating;

    // 無參數構造函數
    public UserTagsBean() {
    }

    // 有參數構造函數
    public UserTagsBean(UserTagsBeanKey id, UserBean userBean, TagsBean tagsBean, int rating) {
        this.id = id;
        this.userBean = userBean;
        this.tagsBean = tagsBean;
        this.rating = rating;
    }

    // getter 和 setter 方法
    public UserTagsBeanKey getId() {
        return id;
    }

    public void setId(UserTagsBeanKey id) {
        this.id = id;
    }

    public UserBean getUserBean() {
        return userBean;
    }

    public void setUserBean(UserBean userBean) {
        this.userBean = userBean;
    }

    public TagsBean getTagsBean() {
        return tagsBean;
    }

    public void setTagsBean(TagsBean tagsBean) {
        this.tagsBean = tagsBean;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
}