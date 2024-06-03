package com.user.bean;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.match.bean.TagsBean;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.forum.bean.LikesBean;
import com.forum.bean.PostsBean;
import com.forum.bean.RepliesBean;
import com.forum.bean.ReportsBean;
import com.group.model.Group;
import com.group.model.Order;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinTable;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "users")
@Component
public class UserBean implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "userno")
	private Integer userNo; //not null
	
	@Column(name = "account")
	private String userAccount; //not null
	
	@Column(name = "userpassword")
	private String userPassword; //not null
	
	@Column(name = "ucname")
	private String userChineseName;

	@Column(name = "uename")
	private String userEnglishName;
	
	@Column(name = "nickname")
	private String nickName;
	
	@Column(name = "avatar")
	private String avatar;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "birthday")
	private LocalDateTime birthday;
	
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "useraddress")
	private String userAddress;
	
	@Column(name = "creationdatetime")
	private LocalDateTime creationDatetime;
	
	@Column(name = "lastlogindatetime")
	private LocalDateTime lastLoginDatetime;
	
	@Column(name = "gender")
	private Integer gender; //0：生理女 1：生理男 not null
	
	@Column(name = "goalno")
	private Integer goalNo;
	
	@Column(name = "bloodtype")
	private String bloodType;
	
	@Column(name = "mbti")
	private String MBTI;
	
	@Column(name = "suspension")
	private Integer suspension; //0：未停權 1：已停權 Not Null
	
	@Column(name = "verify")
	private Integer verify; //0：未驗證 1：已驗證 Not Null
	
	@Column(name = "isdelete")
	private Integer isDelete; //0：未刪除 1：已刪除 Not Null
	
	@Column(name = "ismanager")
	private Integer isManager;
	
	@Column(name = "point")
	private Integer point;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "userBean", cascade = CascadeType.ALL)
	private List<UserImageBean> userImages ;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "userBean", cascade = CascadeType.ALL)
	private List<FriendStateBean> FriendStates;
	
	
	public UserBean() {
	}

	

	//多對多  // 有 join table 這邊為主要控制方，操作兩方關係盡量由這邊(User)操作
	@ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	@JoinTable(name="usertags",
		joinColumns = {@JoinColumn(name="fkuserno", referencedColumnName = "userno")},
		inverseJoinColumns = {@JoinColumn(name="fktagno", referencedColumnName = "tagno")})
	private Set<TagsBean> tagsBeans = new HashSet<>();  //屬性 => getters and setters
	
	
	
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user", cascade = CascadeType.ALL)
	private List<Group> groups ;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "userNo", cascade = CascadeType.ALL)
	private List<Order> orders ;
	
	// getters and setters
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "userBean", cascade = {CascadeType.PERSIST,CascadeType.MERGE})
	private Set<PostsBean> PostsBean =new HashSet<>();
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "userBean", cascade = {CascadeType.PERSIST,CascadeType.MERGE})
	private Set<RepliesBean> repliesBean =new HashSet<>();
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "userBean", cascade = {CascadeType.PERSIST,CascadeType.MERGE})
	private Set<ReportsBean> reportsBean =new HashSet<>();
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "userBean", cascade = {CascadeType.PERSIST,CascadeType.MERGE})
	private Set<LikesBean> likesBean =new HashSet<>();

	
	

	public int getUserNo() {return userNo;}
	public String getUserAccount() {return userAccount;}
	public String getUserPassword() {return userPassword;}
	public String getUserChineseName() {return userChineseName;}
	public String getUserEnglishName() {return userEnglishName;}
	public String getNickName() {return nickName;}
	public String getAvatar() {return avatar;}
	public String getEmail() {return email;}
	public LocalDateTime getBirthday() {return birthday;}
	public String getPhone() {return phone;}
	public String getUserAddress() {return userAddress;}
	public LocalDateTime getCreationDatetime() {return creationDatetime;}
	public LocalDateTime getLastLoginDatetime() {return lastLoginDatetime;}
	public int getGender() {return gender;}
	public Integer getGoalNo() {return goalNo;}
	public String getBloodType() {return bloodType;}
	public String getMBTI() {return MBTI;}
	public int getSuspension() {return suspension;}
	public int getVerify() {return verify;}
	public int getIsDelete() {return isDelete;}
	public Integer getIsManager() {return isManager;}
	public Set<TagsBean> getTagsBeans() {return tagsBeans;}   //ManyToMany
	public Integer getPoint() {return point;}
	
	public Set<PostsBean> getPostsBean() {return PostsBean;}
	public Set<RepliesBean> getRepliesBean() {return repliesBean;}
	public Set<ReportsBean> getReportsBean() {return reportsBean;}
	public Set<LikesBean> getLikesBean() {return likesBean;}
	public List<UserImageBean> getUserImages() {return userImages;}
	public List<FriendStateBean> getFriendStates() {return FriendStates;}
	
	
	
	public void setUserNo(int userNo) {this.userNo = userNo;}
	public void setUserAccount(String userAccount) {this.userAccount = userAccount;}
	public void setUserPassword(String userPassword) {this.userPassword = userPassword;}
	public void setUserChineseName(String userChineseName) {this.userChineseName = userChineseName;}
	public void setUserEnglishName(String userEnglishName) {this.userEnglishName = userEnglishName;}
	public void setNickName(String nickName) {this.nickName = nickName;}
	public void setAvatar(String avatar) {this.avatar = avatar;}
	public void setEmail(String email) {this.email = email;}
	public void setBirthday(LocalDateTime birthday) {this.birthday = birthday;}
	public void setPhone(String phone) {this.phone = phone;}
	public void setUserAddress(String userAddress) {this.userAddress = userAddress;}
	public void setCreationDatetime(LocalDateTime creationDatetime) {this.creationDatetime = creationDatetime;}
	public void setLastLoginDatetime(LocalDateTime lastLoginDatetime) {this.lastLoginDatetime = lastLoginDatetime;}
	public void setGender(int gender) {this.gender = gender;}
	public void setGoalNo(Integer goalNo) {this.goalNo = goalNo;}
	public void setBloodType(String bloodType) {this.bloodType = bloodType;}
	public void setMBTI(String mBTI) {MBTI = mBTI;}
	public void setSuspension(int suspension) {this.suspension = suspension;}
	public void setVerify(int verify) {this.verify = verify;}
	public void setIsDelete(int isDelete) {this.isDelete = isDelete;}
	public void setIsManager(Integer isManager) {this.isManager = isManager;}
	public void setTagsBeans(Set<TagsBean> TagsBeans) {this.tagsBeans = tagsBeans;}   //ManyToMany
	public void setPoint(Integer point) {this.point = point;}
	
	public void setPostsBean(Set<PostsBean> postsBean) {PostsBean = postsBean;}
	public void setRepliesBean(Set<RepliesBean> repliesBean) {this.repliesBean = repliesBean;}
	public void setReportsBean(Set<ReportsBean> reportsBean) {this.reportsBean = reportsBean;}
	public void setLikesBean(Set<LikesBean> likesBean) {this.likesBean = likesBean;}
	
	public void setUserImages(List<UserImageBean> userImages) {this.userImages = userImages;}
	public void setFriendStates(List<FriendStateBean> friendStates) {FriendStates = friendStates;}
	
	
	
	public UserBean_Vo getUserBean_Vo() {
		UserBean_Vo userBean_Vo = new UserBean_Vo();
		userBean_Vo.setUserNo(getUserNo());
		userBean_Vo.setUserAccount(getUserAccount());
		userBean_Vo.setUserPassword(getUserPassword());
		userBean_Vo.setUserChineseName(getUserChineseName());
		userBean_Vo.setUserEnglishName(getUserEnglishName());
		
		userBean_Vo.setNickName(getNickName());
		userBean_Vo.setAvatar(getAvatar());
		userBean_Vo.setEmail(getEmail());
		userBean_Vo.setBirthday(getBirthday());
		userBean_Vo.setPhone(getPhone());
		
		userBean_Vo.setUserAddress(getUserAddress());
		userBean_Vo.setCreationDatetime(getCreationDatetime());
		userBean_Vo.setLastLoginDatetime(getLastLoginDatetime());
		userBean_Vo.setGender(getGender());
		userBean_Vo.setGoalNo(getGoalNo());
		
		userBean_Vo.setBloodType(getBloodType());
		userBean_Vo.setMBTI(getMBTI());
		userBean_Vo.setSuspension(getSuspension());
		userBean_Vo.setVerify(getVerify());
		userBean_Vo.setIsDelete(getIsDelete());
		
		userBean_Vo.setIsManager(getIsManager());
		userBean_Vo.setPoint(getPoint());
		
		return userBean_Vo;
	}
	@Override
	public String toString() {
		return "UserBean [userNo=" + userNo + ", userAccount=" + userAccount + ", userPassword=" + userPassword
				+ ", userChineseName=" + userChineseName + ", userEnglishName=" + userEnglishName + ", nickName="
				+ nickName + ", avatar=" + avatar + ", email=" + email + ", birthday=" + birthday + ", phone=" + phone
				+ ", userAddress=" + userAddress + ", creationDatetime=" + creationDatetime + ", lastLoginDatetime="
				+ lastLoginDatetime + ", gender=" + gender + ", goalNo=" + goalNo + ", bloodType=" + bloodType
				+ ", MBTI=" + MBTI + ", suspension=" + suspension + ", verify=" + verify + ", isDelete=" + isDelete
				+ "com.example.manytomany.entity.UserBean[ userNo=" + userNo + " ]]";   //ManyToMany
	}
	
	
	
	
	// ---ManyToMany : 除雙主鍵以外還有其他欄位才要加，要另外寫Bean
	// ---UserTagsBean : https://docs.jboss.org/hibernate/orm/6.4/userguide/html_single/Hibernate_User_Guide.html#identifiers-composite
	// ---UserTagsBeanKey :
	
	@Override
	public int hashCode() {
		int hash = 0;
		hash += (userNo != null ? userNo.hashCode() : 0);
		return hash;
	}

	@Override
	public boolean equals(Object object) {
		if (!(object instanceof UserBean)) {
			return false;
		}
		UserBean other = (UserBean) object;
		return !((this.userNo == null && other.userNo != null) || (this.userNo != null && !this.userNo.equals(other.userNo)));
	}

}

