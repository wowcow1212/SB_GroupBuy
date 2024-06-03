package com.forum.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.user.bean.UserBean;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "replies")
@Component
public class RepliesBean {

	public RepliesBean() {
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "reply_no")
	private Integer reply_no;
	
	@JoinColumn(name = "user_no")
	@ManyToOne
	private UserBean userBean;
	
	@JoinColumn(name = "post_no")
	@ManyToOne
	private PostsBean postsBean;

	@Column(name = "content")
	private String content;

	@Column(name = "update_date")
	private Date update_date;

	public Integer getReply_no() {
		return reply_no;
	}

	public void setReply_no(Integer reply_no) {
		this.reply_no = reply_no;
	}

	public UserBean getUserBean() {
		return userBean;
	}

	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}

	public PostsBean getPostsBean() {
		return postsBean;
	}

	public void setPostsBean(PostsBean postsBean) {
		this.postsBean = postsBean;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
}

