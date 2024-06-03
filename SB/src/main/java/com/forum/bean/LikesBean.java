package com.forum.bean;

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
@Table(name = "likes")
@Component
public class LikesBean {

	public LikesBean() {
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "like_no")
	private Integer like_no;
	
	@JoinColumn(name = "user_no")
	@ManyToOne
	private UserBean userBean;
	
	@JoinColumn(name = "post_no")
	@ManyToOne
	private PostsBean postsBean;

	public Integer getLike_no() {
		return like_no;
	}

	public void setLike_no(Integer like_no) {
		this.like_no = like_no;
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

}
