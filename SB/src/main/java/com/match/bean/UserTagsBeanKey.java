package com.match.bean;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
	
	//1. 定義複合主鍵類別
	@Embeddable
	class UserTagsBeanKey implements Serializable {
	    @Column(name = "fkuserno")
	    private Integer fkUserNo;

	    @Column(name = "fktagno")
	    private Integer fkTagNo;

	    // 無參數構造函數
	    public UserTagsBeanKey() {
	    }

	    // 有參數構造函數
	    public UserTagsBeanKey(Integer fkUserNo, Integer fkTagNo) {
	        this.fkUserNo = fkUserNo;
	        this.fkTagNo = fkTagNo;
	    }

	    // getter 和 setter 方法
	    public Integer getFkUserNo() {
	        return fkUserNo;
	    }

	    public void setFkUserNo(Integer fkUserNo) {
	        this.fkUserNo = fkUserNo;
	    }

	    public Integer getFkTagNo() {
	        return fkTagNo;
	    }

	    public void setFkTagNo(Integer fkTagNo) {
	        this.fkTagNo = fkTagNo;
	    }

	    // hashCode 和 equals 實現
	    @Override
	    public int hashCode() {
	        final int prime = 31;
	        int result = 1;
	        result = prime * result + ((fkUserNo == null) ? 0 : fkUserNo.hashCode());
	        result = prime * result + ((fkTagNo == null) ? 0 : fkTagNo.hashCode());
	        return result;
	    }

	    @Override
	    public boolean equals(Object obj) {
	        if (this == obj)
	            return true;
	        if (obj == null)
	            return false;
	        if (getClass() != obj.getClass())
	            return false;
	        UserTagsBeanKey other = (UserTagsBeanKey) obj;
	        if (fkUserNo == null) {
	            if (other.fkUserNo != null)
	                return false;
	        } else if (!fkUserNo.equals(other.fkUserNo))
	            return false;
	        if (fkTagNo == null) {
	            if (other.fkTagNo != null)
	                return false;
	        } else if (!fkTagNo.equals(other.fkTagNo))
	            return false;
	        return true;
	    }
	}
