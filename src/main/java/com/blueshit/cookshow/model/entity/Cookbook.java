package com.blueshit.cookshow.model.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.Set;


/**
 * The persistent class for the t_cookbook database table.
 * 
 */
@Entity
@Table(name="t_cookbook")
public class Cookbook implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;

	@Column(name="classification_code",columnDefinition = "TEXT")
	private String classificationCode;

	@Column(name="click_num")
	private int clickNum;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createDate;

	private int deleted;

	@Column(name="favour_num")
	private int favourNum;

    @Column(columnDefinition = "TEXT")
	private String material;

	@Column(name="public_state")
	private int publicState;

    @Column(columnDefinition = "TEXT")
	private String remind;

    @Column(columnDefinition = "TEXT")
	private String step;

	private String title;

	@Column(name="title_image")
	private String titleImage;

	@Temporal(TemporalType.TIMESTAMP)
	private Date updateDate;

	//bi-directional many-to-one association to CommentCookbook
	@OneToMany(mappedBy="Cookbook")
	private Set<CommentCookbook> CommentCookbooks;

	//bi-directional many-to-one association to User
	@ManyToOne
	private User User;

    @ManyToMany
    @JoinTable(name = "t_menu_cookbook",inverseJoinColumns = @JoinColumn(name = "menu_id"),joinColumns = @JoinColumn(name="cookbook_id"))
    private Set<Menu> menus;

	public Cookbook() {
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getClassificationCode() {
		return this.classificationCode;
	}

	public void setClassificationCode(String classificationCode) {
		this.classificationCode = classificationCode;
	}

	public int getClickNum() {
		return this.clickNum;
	}

	public void setClickNum(int clickNum) {
		this.clickNum = clickNum;
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

	public int getFavourNum() {
		return this.favourNum;
	}

	public void setFavourNum(int favourNum) {
		this.favourNum = favourNum;
	}

	public String getMaterial() {
		return this.material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public int getPublicState() {
		return this.publicState;
	}

	public void setPublicState(int publicState) {
		this.publicState = publicState;
	}

	public String getRemind() {
		return this.remind;
	}

	public void setRemind(String remind) {
		this.remind = remind;
	}

	public String getStep() {
		return this.step;
	}

	public void setStep(String step) {
		this.step = step;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitleImage() {
		return this.titleImage;
	}

	public void setTitleImage(String titleImage) {
		this.titleImage = titleImage;
	}

	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Set<CommentCookbook> getCommentCookbooks() {
		return this.CommentCookbooks;
	}

	public void setCommentCookbooks(Set<CommentCookbook> CommentCookbooks) {
		this.CommentCookbooks = CommentCookbooks;
	}

	public CommentCookbook addCommentCookbook(CommentCookbook CommentCookbook) {
		getCommentCookbooks().add(CommentCookbook);
		CommentCookbook.setCookbook(this);

		return CommentCookbook;
	}

	public CommentCookbook removeCommentCookbook(CommentCookbook CommentCookbook) {
		getCommentCookbooks().remove(CommentCookbook);
		CommentCookbook.setCookbook(null);

		return CommentCookbook;
	}

	public User getUser() {
		return this.User;
	}

	public void setUser(User User) {
		this.User = User;
	}

    public Set<Menu> getMenus() {
        return menus;
    }

    public void setMenus(Set<Menu> menus) {
        this.menus = menus;
    }
}