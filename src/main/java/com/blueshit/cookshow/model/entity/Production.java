package com.blueshit.cookshow.model.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.Set;


/**
 * The persistent class for the t_production database table.
 * 
 */
@Entity
@Table(name="t_production")
public class Production implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createDate;

	private int deleted;

	private int favour;

	@Column(columnDefinition = "TEXT")
	private String intro;

	@Temporal(TemporalType.TIMESTAMP)
	private Date publicDate;

	private String title;

	@Temporal(TemporalType.TIMESTAMP)
	private Date updateDate;

    @Column(name = "cookbook_title")
    private String cookbookTitle;

    @Column(name = "cookbook_id")
    private Long cookbookId;

    private String titleImage;

	//bi-directional many-to-one association to CommentProduction
	@OneToMany(mappedBy="Production")
	private Set<CommentProduction> CommentProductions;

	//bi-directional many-to-one association to User
	@ManyToOne
	private User User;

	public Production() {
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

	public int getFavour() {
		return this.favour;
	}

	public void setFavour(int favour) {
		this.favour = favour;
	}

	public String getIntro() {
		return this.intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public Date getPublicDate() {
		return this.publicDate;
	}

	public void setPublicDate(Date publicDate) {
		this.publicDate = publicDate;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Set<CommentProduction> getCommentProductions() {
		return this.CommentProductions;
	}

	public void setCommentProductions(Set<CommentProduction> CommentProductions) {
		this.CommentProductions = CommentProductions;
	}

	public CommentProduction addCommentProduction(CommentProduction CommentProduction) {
		getCommentProductions().add(CommentProduction);
		CommentProduction.setProduction(this);

		return CommentProduction;
	}

	public CommentProduction removeCommentProduction(CommentProduction CommentProduction) {
		getCommentProductions().remove(CommentProduction);
		CommentProduction.setProduction(null);

		return CommentProduction;
	}

	public User getUser() {
		return this.User;
	}

	public void setUser(User User) {
		this.User = User;
	}


    public String getCookbookTitle() {
        return cookbookTitle;
    }

    public void setCookbookTitle(String cookbookTitle) {
        this.cookbookTitle = cookbookTitle;
    }

    public Long  getCookbookId() {
        return cookbookId;
    }

    public void setCookbookId(Long cookbookId) {
        this.cookbookId = cookbookId;
    }

    public String getTitleImage() {
        return titleImage;
    }

    public void setTitleImage(String titleImage) {
        this.titleImage = titleImage;
    }
}