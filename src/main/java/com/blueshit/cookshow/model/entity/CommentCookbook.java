package com.blueshit.cookshow.model.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.Set;


/**
 * The persistent class for the t_comment_cookbook database table.
 * 
 */
@Entity
@Table(name="t_comment_cookbook")
public class CommentCookbook implements Serializable {
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

	//bi-directional many-to-one association to CommentCookbook
	@ManyToOne
	@JoinColumn(name="reply_id")
	private CommentCookbook CommentCookbook;

	//bi-directional many-to-one association to CommentCookbook
	@OneToMany(mappedBy="CommentCookbook")
	private Set<CommentCookbook> CommentCookbooks;

	//bi-directional many-to-one association to Cookbook
	@ManyToOne
	private Cookbook Cookbook;

	//bi-directional many-to-one association to User
	@ManyToOne
	private User User;

	public CommentCookbook() {
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

	public CommentCookbook getCommentCookbook() {
		return this.CommentCookbook;
	}

	public void setCommentCookbook(CommentCookbook CommentCookbook) {
		this.CommentCookbook = CommentCookbook;
	}

	public Set<CommentCookbook> getCommentCookbooks() {
		return this.CommentCookbooks;
	}

	public void setCommentCookbooks(Set<CommentCookbook> CommentCookbooks) {
		this.CommentCookbooks = CommentCookbooks;
	}

	public CommentCookbook addCommentCookbook(CommentCookbook CommentCookbook) {
		getCommentCookbooks().add(CommentCookbook);
		CommentCookbook.setCommentCookbook(this);

		return CommentCookbook;
	}

	public CommentCookbook removeCommentCookbook(CommentCookbook CommentCookbook) {
		getCommentCookbooks().remove(CommentCookbook);
		CommentCookbook.setCommentCookbook(null);

		return CommentCookbook;
	}

	public Cookbook getCookbook() {
		return this.Cookbook;
	}

	public void setCookbook(Cookbook Cookbook) {
		this.Cookbook = Cookbook;
	}

	public User getUser() {
		return this.User;
	}

	public void setUser(User User) {
		this.User = User;
	}

}