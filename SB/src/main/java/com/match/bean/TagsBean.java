package com.match.bean;

import java.util.HashSet;
import java.util.Set;
import org.springframework.stereotype.Component;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.user.bean.UserBean;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

@Entity                               //定義這個 Class 為一個實體(Entity)
@Table(name="tags")
@Component                            //標註一個類為Sping容器的類
public class TagsBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="tagno")
	private Integer tagNo;
	
	@Column(name="tagname")
	private String tagName;  
	
	@Transient
	private Integer userNo;
	
	
	public Integer getUserNo() {
		return userBeans.iterator().next().getUserNo();
	}


	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}

	
	//---ManyToMany
	//---如果要互相可以找，兩邊都要用@JoinTable，並把mappedBy註解，因為不能只有一方是主控方
	
	@JsonIgnore                                //要加這個不然會跑很多資料
//	@ManyToMany(mappedBy = "tagsBeans")                                                      //雙邊找要註解
	@ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	@JoinTable(name="usertags",                                                              //雙邊找，單邊找再換回來
	joinColumns = {@JoinColumn(name="fktagno", referencedColumnName = "tagno")},             //fkuserno -> fktagno   userno -> tagno 
	inverseJoinColumns = {@JoinColumn(name="fkuserno", referencedColumnName = "userno")})    //tagno    -> userno    tagno  -> userno 
	private Set<UserBean> userBeans = new HashSet<>();   //getters and setters
	
	
	
	//Constructors from superclass
	public TagsBean() {
	}


	//Constructors using Fields  根據編號和名稱來初始化   => Controller
	public TagsBean(Integer tagNo, String tagName) {
		this.tagNo = tagNo;
		this.tagName = tagName;
	}
	
	
	//Constructors using Fields  根據名稱來初始化   => Controller
	public TagsBean(String tagName) {
		super();
		this.tagName = tagName;
	}



	//getters and setters
	public Integer getTagNo() {
		return tagNo;
	}


	public void setTagNo(Integer tagNo) {
		this.tagNo = tagNo;
	}


	public String getTagName() {
		return tagName;
	}


	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	
	public Set<UserBean> getUserBeans() {
		return userBeans;
	}

	public void setUserBeans(Set<UserBean> userBeans) {
		this.userBeans = userBeans;
	}
	
	
	
	// ---ManyToMany
	// ---下面的代碼除了雙主鍵以外還有其他欄位才要加，要另外寫Bean
	// ---UserTagsBean : https://docs.jboss.org/hibernate/orm/6.4/userguide/html_single/Hibernate_User_Guide.html#identifiers-composite
	// ---UserTagsBeanKey :

	
	   @Override
	   public int hashCode() {
	   	int hash = 0;
	   	hash += (tagNo != null ? tagNo.hashCode() : 0);
	   	return hash;
	   }

	   @Override
	   public boolean equals(Object object) {
	   	if (!(object instanceof TagsBean)) {
	   		return false;
	   	}
	   	TagsBean other = (TagsBean) object;
	   	return !((this.tagNo == null && other.tagNo != null) || (this.tagNo != null && !this.tagNo.equals(other.tagNo)));
	   }

	   @Override
	   public String toString() {
	   	return "com.example.manytomany.entity.TagsBean[ tagNo=" + tagNo + " ]";
	   }


}
