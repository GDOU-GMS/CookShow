package com.blueshit.cookshow.model.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the t_relation database table.
 * 
 */
@Entity
@Table(name="t_relation")
public class Relation implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createDate;

	private int deleted;

	@Column(name="read_state")
	private int readState;

	@Temporal(TemporalType.TIMESTAMP)
	private Date updateDate;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="user_follower")
	private User Follower;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="user_by_follower")
	private User ByFollower;

	public Relation() {
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getDeleted() {
		return this.deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}

	public int getReadState() {
		return this.readState;
	}

	public void setReadState(int readState) {
		this.readState = readState;
	}

	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public User getFollower() {
		return this.Follower;
	}

	public void setFollower(User Follower) {
		this.Follower = Follower;
	}

	public User getByFollower() {
		return this.ByFollower;
	}

	public void setByFollower(User ByFollower) {
		this.ByFollower = ByFollower;
	}

}