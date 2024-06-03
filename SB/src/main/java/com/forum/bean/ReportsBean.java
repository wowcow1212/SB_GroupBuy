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
import jakarta.persistence.UniqueConstraint;

@Entity
@Table(name = "reports", uniqueConstraints = @UniqueConstraint(columnNames = {"post_no", "user_no"}))
@Component
public class ReportsBean {

	public ReportsBean() {
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "report_no")
	private Integer report_no;
	
	@JoinColumn(name = "user_no")
	@ManyToOne
	private UserBean userBean;
	
	@JoinColumn(name = "post_no")
	@ManyToOne
	private PostsBean postsBean;
	
	@Column(name = "reason")
	private String reason;
	
	@Column(name = "report_date")
	private Date report_date;

	public Integer getReport_no() {
		return report_no;
	}

	public void setReport_no(Integer report_no) {
		this.report_no = report_no;
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

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
}
