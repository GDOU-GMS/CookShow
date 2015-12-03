package com.blueshit.cookshow.model.vo;

import java.util.Date;



import com.blueshit.cookshow.model.entity.User;

public class RelationVo {
	
	private Long id;
	
	private Date createDate;

	private int deleted;

	private int readState;

	private Date updateDate;

	private User Follower;

	private User ByFollower;
	
	private String toCreateDate;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getDeleted() {
		return deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}

	public int getReadState() {
		return readState;
	}

	public void setReadState(int readState) {
		this.readState = readState;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public User getFollower() {
		return Follower;
	}

	public void setFollower(User follower) {
		Follower = follower;
	}

	public User getByFollower() {
		return ByFollower;
	}

	public void setByFollower(User byFollower) {
		ByFollower = byFollower;
	}

	public String getToCreateDate() {
		return toCreateDate;
	}

	public void setToCreateDate(String toCreateDate) {
		this.toCreateDate = toCreateDate;
	}
	
	
	
	
	
	
}
