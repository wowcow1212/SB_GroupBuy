package com.user.bean;

import lombok.Data;

@Data
public class SocketMsg {
	private int type;

	private String sendOutUser;

	private String receiveUser;

	private String msg;

	public SocketMsg() {
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getSendOutUser() {
		return sendOutUser;
	}

	public void setSendOutUser(String sendOutUser) {
		this.sendOutUser = sendOutUser;
	}

	public String getReceiveUser() {
		return receiveUser;
	}

	public void setReceiveUser(String receiveUser) {
		this.receiveUser = receiveUser;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	

}
