package com.blueshit.cookshow.model.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.Set;


/**
 * The persistent class for the t_comment_production database table.
 * 
 */
@Entity
@Table(name="t_comment_production")
public class CommentProduction implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;

    @Column(columnDefinition = "TEXT")
	private String content;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createDate;

	private int deleted;

	@Temporal(TemporalType.TIMESTAMP)
	private Date updateDate;

	private String username;

	//bi-directional many-to-one association to CommentProduction
	@ManyToOne
	@JoinColumn(name="reply_id")
	private CommentProduction CommentProduction;

	//bi-directional many-to-one association to CommentProduction
	@OneToMany(mappedBy="CommentProduction")
	private Set<CommentProduction> CommentProductions;

	//bi-directional many-to-one association to Production
	@ManyToOne
	private Production Production;

	//bi-directional many-to-one association to User
	@ManyToOne
	private User User;

	public CommentProduction() {
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public CommentProduction getCommentProduction() {
		return this.CommentProduction;
	}

	public void setCommentProduction(CommentProduction CommentProduction) {
		this.CommentProduction = CommentProduction;
	}

	public Set<CommentProduction> getCommentProductions() {
		return this.CommentProductions;
	}

	public void setCommentProductions(Set<CommentProduction> CommentProductions) {
		this.CommentProductions = CommentProductions;
	}

	public CommentProduction addCommentProduction(CommentProduction CommentProduction) {
		getCommentProductions().add(CommentProduction);
		CommentProduction.setCommentProduction(this);

		return CommentProduction;
	}

	public CommentProduction removeCommentProduction(CommentProduction CommentProduction) {
		getCommentProductions().remove(CommentProduction);
		CommentProduction.setCommentProduction(null);

		return CommentProduction;
	}

	public Production getProduction() {
		return this.Production;
	}

	public void setProduction(Production Production) {
		this.Production = Production;
	}

	public User getUser() {
		return this.User;
	}

	public void setUser(User User) {
		this.User = User;
	}

}